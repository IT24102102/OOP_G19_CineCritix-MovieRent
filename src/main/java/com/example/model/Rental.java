package com.example.model;

import java.io.*;
import java.util.*;

public class Rental {
    private int rentalId;
    private int userId;
    private int movieId;
    private String rentalDate;
    private static final String FILE_NAME = "rentals.txt";

    public Rental(int rentalId, int userId, int movieId, String rentalDate) {
        this.rentalId = rentalId;
        this.userId = userId;
        this.movieId = movieId;
        this.rentalDate = rentalDate;
    }


    public int getRentalId() { return rentalId; }
    public int getUserId() { return userId; }
    public int getMovieId() { return movieId; }
    public String getRentalDate() { return rentalDate; }
    public void setRentalDate(String rentalDate) { this.rentalDate = rentalDate; }

    // Create a new rental record
    public static void createRental(Rental rental) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME, true))) {
            writer.write(rental.rentalId + "," + rental.userId + "," + rental.movieId + "," + rental.rentalDate);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    // Get rental details by ID
    public static Rental getRentalById(int rentalId) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (Integer.parseInt(data[0]) == rentalId) {
                    return new Rental(Integer.parseInt(data[0]), Integer.parseInt(data[1]),
                            Integer.parseInt(data[2]), data[3]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}



