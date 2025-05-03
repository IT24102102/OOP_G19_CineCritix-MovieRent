package com.example.model;

import java.io.*;
import java.util.*;

public class Rental {
    private int rentalId;
    private int userId;
    private int movieId;
    private String rentalDate;

    // File path for storing rental data
    private static String FILE_PATH = "rentals.txt";

    // Constructor to create a new rental record
    public Rental(int rentalId, int userId, int movieId, String rentalDate) {
        this.rentalId = rentalId;
        this.userId = userId;
        this.movieId = movieId;
        this.rentalDate = rentalDate;
    }

    // Getters
    public int getRentalId() { return rentalId; }
    public int getUserId() { return userId; }
    public int getMovieId() { return movieId; }
    public String getRentalDate() { return rentalDate; }

    // Allow setting the file path from the servlet
    public static void setFilePath(String path) {
        FILE_PATH = path;
        // Log the path to help with debugging
        System.out.println("Setting rental file path to: " + path);

        try {
            // Create file and parent directories if they don't exist
            File file = new File(FILE_PATH);

            // Debug information
            System.out.println("File absolute path: " + file.getAbsolutePath());
            System.out.println("File exists: " + file.exists());
            System.out.println("Parent directory exists: " + (file.getParentFile() != null && file.getParentFile().exists()));

            // Create parent directories if needed
            File parentDir = file.getParentFile();
            if (parentDir != null && !parentDir.exists()) {
                boolean created = parentDir.mkdirs();
                System.out.println("Created directory: " + parentDir.getAbsolutePath() + " (Success: " + created + ")");
            }

            // Try to create the file if it doesn't exist
            if (!file.exists()) {
                try {
                    boolean created = file.createNewFile();
                    System.out.println("Created file: " + file.getAbsolutePath() + " (Success: " + created + ")");
                } catch (IOException e) {
                    System.err.println("Failed to create file: " + e.getMessage());
                    // Don't throw exception, just log it
                }
            }

            // Check permissions
            System.out.println("File can read: " + file.canRead());
            System.out.println("File can write: " + file.canWrite());

        } catch (Exception e) {
            System.err.println("Error in setFilePath: " + e.getMessage());
            e.printStackTrace();

            // Try to use a fallback location
            tryFallbackLocation();
        }
    }

    // Try to use a fallback location if the primary location fails
    private static void tryFallbackLocation() {
        try {
            String userHome = System.getProperty("user.home");
            FILE_PATH = userHome + File.separator + "rentals.txt";
            System.out.println("Using fallback location: " + FILE_PATH);

            File file = new File(FILE_PATH);
            if (!file.exists()) {
                boolean created = file.createNewFile();
                System.out.println("Created fallback file: " + created);
            }
        } catch (Exception e) {
            System.err.println("Error creating fallback file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Adds a new rental to the file with improved error handling
    public static void createRental(Rental rental) {
        File file = new File(FILE_PATH);

        // Debug information before writing
        System.out.println("Attempting to write to: " + file.getAbsolutePath());
        System.out.println("File exists: " + file.exists());
        System.out.println("File can write: " + file.canWrite());
        System.out.println("Parent directory exists: " + (file.getParentFile() != null && file.getParentFile().exists()));

        try {
            // Create parent directories if they don't exist
            File parentDir = file.getParentFile();
            if (parentDir != null && !parentDir.exists()) {
                parentDir.mkdirs();
            }

            // Create file if it doesn't exist
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    System.err.println("Failed to create file before writing: " + e.getMessage());
                    tryFallbackLocation();
                    file = new File(FILE_PATH); // Update file reference to fallback
                }
            }

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(rental.toFileString());
                writer.newLine();
                writer.flush(); // Ensures data is written
                System.out.println("Rental saved successfully to: " + file.getAbsolutePath());
            }
        } catch (IOException e) {
            System.err.println("Error writing to file: " + file.getAbsolutePath());
            System.err.println("Error message: " + e.getMessage());
            e.printStackTrace();

            // Try with fallback location
            if (!file.getAbsolutePath().startsWith(System.getProperty("user.home"))) {
                tryFallbackLocation();
                createRental(rental); // Recursive call with fallback location
            }
        }
    }

    // Returns a list of all rentals with improved error handling
    public static List<Rental> getAllRentals() {
        List<Rental> rentals = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            System.out.println("Rentals file does not exist at: " + file.getAbsolutePath());
            return rentals; // If file doesn't exist, return empty list
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue; // Skip empty lines
                }

                String[] data = line.trim().split(",");
                if (data.length == 4) {
                    try {
                        Rental rental = new Rental(
                                Integer.parseInt(data[0]),
                                Integer.parseInt(data[1]),
                                Integer.parseInt(data[2]),
                                data[3]
                        );
                        rentals.add(rental);
                    } catch (NumberFormatException nfe) {
                        System.err.println("Skipping invalid rental line: " + line);
                    }
                } else {
                    System.err.println("Skipping line with incorrect format: " + line);
                }
            }
            System.out.println("Successfully read " + rentals.size() + " rentals from " + file.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error reading from file: " + file.getAbsolutePath());
            System.err.println("Error message: " + e.getMessage());
            e.printStackTrace();

            // Try with fallback location if main file fails
            if (!file.getAbsolutePath().startsWith(System.getProperty("user.home"))) {
                tryFallbackLocation();
                return getAllRentals(); // Recursive call with fallback location
            }
        }

        return rentals;
    }

    // Updates the rental date of a given rentalId
    public static boolean updateRentalDate(int rentalId, String newDate) {
        List<Rental> rentals = getAllRentals();
        boolean updated = false;
        File file = new File(FILE_PATH);

        if (!file.exists() || !file.canWrite()) {
            System.err.println("Cannot write to file: " + file.getAbsolutePath());
            tryFallbackLocation();
            file = new File(FILE_PATH);
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (Rental r : rentals) {
                if (r.getRentalId() == rentalId) {
                    r.rentalDate = newDate;
                    updated = true;
                    System.out.println("Updated rental ID " + rentalId + " with new date: " + newDate);
                }
                writer.write(r.toFileString());
                writer.newLine();
            }
            writer.flush();
        } catch (IOException e) {
            System.err.println("Error updating rental date: " + e.getMessage());
            e.printStackTrace();

            // Try with fallback location
            if (!file.getAbsolutePath().startsWith(System.getProperty("user.home"))) {
                tryFallbackLocation();
                return updateRentalDate(rentalId, newDate); // Recursive call with fallback
            }
        }

        return updated;
    }

    // Deletes a rental by rentalId
    public static boolean deleteRental(int rentalId) {
        List<Rental> rentals = getAllRentals();
        boolean deleted = false;
        File file = new File(FILE_PATH);

        if (!file.exists() || !file.canWrite()) {
            System.err.println("Cannot write to file: " + file.getAbsolutePath());
            tryFallbackLocation();
            file = new File(FILE_PATH);
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (Rental r : rentals) {
                if (r.getRentalId() != rentalId) {
                    writer.write(r.toFileString());
                    writer.newLine();
                } else {
                    deleted = true;
                    System.out.println("Deleted rental ID: " + rentalId);
                }
            }
            writer.flush();
        } catch (IOException e) {
            System.err.println("Error deleting rental: " + e.getMessage());
            e.printStackTrace();

            // Try with fallback location
            if (!file.getAbsolutePath().startsWith(System.getProperty("user.home"))) {
                tryFallbackLocation();
                return deleteRental(rentalId); // Recursive call with fallback
            }
        }

        return deleted;
    }

    // Converts Rental object to file line
    private String toFileString() {
        return rentalId + "," + userId + "," + movieId + "," + rentalDate;
    }
}