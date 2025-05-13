package models;

import java.time.LocalDate;

public class Rent {
    private String rentalId;
    private Clients client;
    private Movie movie;
    private LocalDate rentalDate;
    private LocalDate dueDate;
    private boolean isReturned;

    public Rent(String rentalId, Clients client, Movie movie, LocalDate rentalDate, LocalDate dueDate, boolean isReturned) {
        this.rentalId = rentalId;
        this.client = client;
        this.movie = movie;
        this.rentalDate = rentalDate;
        this.dueDate = dueDate;
        this.isReturned = isReturned;
    }

    // Getters and Setters
    public String getRentalId() {
        return rentalId;
    }

    public Clients getClient() {
        return client;
    }

    public Movie getMovie() {
        return movie;
    }

    public LocalDate getRentalDate() {
        return rentalDate;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public boolean isReturned() {
        return isReturned;
    }

    public void setReturned(boolean returned) {
        isReturned = returned;
    }

    // Convert to file line (only storing necessary info)
    public String toFileString() {
        return rentalId + "," +
                client.getEmail() + "," +
                movie.getId() + "," +
                rentalDate + "," +
                dueDate + "," +
                isReturned;
    }

    // Parse from file line (requires Movie and Client lookup)
    public static Rent fromFileString(String line, Clients client, Movie movie) {
        String[] parts = line.split(",");
        return new Rent(
                parts[0],
                client,
                movie,
                LocalDate.parse(parts[3]),
                LocalDate.parse(parts[4]),
                Boolean.parseBoolean(parts[5])
        );
    }
}
