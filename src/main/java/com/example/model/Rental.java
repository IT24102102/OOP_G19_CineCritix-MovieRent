package com.example.model;

import java.io.*;
import java.util.*;

public class Rental {
    private int rentalId;
    private int userId;
    private int movieId;
    private String rentalDate;


    private static String FILE_PATH = "rentals.txt";

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

        // Create directory if it doesn't exist
        File file = new File(FILE_PATH);
        File parentDir = file.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
            System.out.println("Created directory: " + parentDir.getAbsolutePath());
        }
    }

    // Adds a new rental to the file with improved error handling
    public static void createRental(Rental rental) {
        File file = new File(FILE_PATH);
        try {
            // Create parent directories if they don't exist
            File parentDir = file.getParentFile();
            if (parentDir != null && !parentDir.exists()) {
                parentDir.mkdirs();
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
                }
            }
            System.out.println("Successfully read " + rentals.size() + " rentals from " + file.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error reading from file: " + file.getAbsolutePath());
            System.err.println("Error message: " + e.getMessage());
            e.printStackTrace();
        }

        return rentals;
    }

    // Updates the rental date of a given rentalId
    public static boolean updateRentalDate(int rentalId, String newDate) {
        List<Rental> rentals = getAllRentals();
        boolean updated = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
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
        }

        return updated;
    }

    // Deletes a rental by rentalId
    public static boolean deleteRental(int rentalId) {
        List<Rental> rentals = getAllRentals();
        boolean deleted = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
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
        }

        return deleted;
    }

    // Converts Rental object to file line
    private String toFileString() {
        return rentalId + "," + userId + "," + movieId + "," + rentalDate;
    }
}