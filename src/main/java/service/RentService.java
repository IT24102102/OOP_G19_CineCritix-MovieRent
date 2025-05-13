package service;

import models.Rent;
import models.Clients;
import models.Movie;
import java.io.*;
import java.util.*;

public class RentService {
    private static final String RENTAL_FILE = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CRent.txt"; // Text file to store rentals

    // Save a new rental to the file
    public void saveRental(Rent rent) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(RENTAL_FILE, true))) {
            writer.write(rent.toFileString());
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error saving rental: " + e.getMessage());
        }
    }

    // Load all rentals from the file
    public List<Rent> loadAllRentals(List<Clients> clients, List<Movie> movies) {
        List<Rent> rentals = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(RENTAL_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                Clients client = findClientByEmail(clients, parts[1]);
                Movie movie = findMovieById(movies, parts[2]);
                Rent rent = Rent.fromFileString(line, client, movie);
                rentals.add(rent);
            }
        } catch (IOException e) {
            System.err.println("Error loading rentals: " + e.getMessage());
        }
        return rentals;
    }

    // Mark a rental as returned
    public void markAsReturned(String rentalId, List<Rent> rentals) {
        for (Rent rent : rentals) {
            if (rent.getRentalId().equals(rentalId)) {
                rent.setReturned(true);
                updateRentalFile(rentals);
                break;
            }
        }
    }

    // Helper method to find a client by email
    private Clients findClientByEmail(List<Clients> clients, String email) {
        return clients.stream()
                .filter(client -> client.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    // Helper method to find a movie by ID
    private Movie findMovieById(List<Movie> movies, String movieId) {
        return movies.stream()
                .filter(movie -> movie.getId().equals(movieId))
                .findFirst()
                .orElse(null);
    }

    // Update the rental file after changes
    private void updateRentalFile(List<Rent> rentals) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(RENTAL_FILE))) {
            for (Rent rent : rentals) {
                writer.write(rent.toFileString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error updating rental file: " + e.getMessage());
        }
    }
}
