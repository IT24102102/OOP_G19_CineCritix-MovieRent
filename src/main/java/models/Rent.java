package models;

import java.time.LocalDate;

public class Rent {
    private String rentId;
    private User user;      // only username needed in User
    private Movie movie;    // only movieName needed in Movie
    private LocalDate rentDate;

    public Rent(String rentId, User user, Movie movie, LocalDate rentDate) {
        this.rentId = rentId;
        this.user = user;
        this.movie = movie;
        this.rentDate = rentDate;
    }

    // Getters and setters
    public String getRentId() { return rentId; }
    public User getUser() { return user; }
    public Movie getMovie() { return movie; }
    public LocalDate getRentDate() { return rentDate; }

    @Override
    public String toString() {
        // format for saving to text file: rentId|username|movieName|rentDate
        return rentId + "|" + user.getUsername() + "|" + movie.getMovieName() + "|" + rentDate;
    }
    public Rent(String rentId) {
        this.rentId = rentId;
    }


    // static method to parse a line from file back to Rent object
    public static Rent fromString(String line) {
        String[] parts = line.split("\\|");
        if(parts.length != 4) return null;

        String rentId = parts[0];
        User user = new User(parts[1]);
        Movie movie = new Movie(parts[2]);
        LocalDate rentDate = LocalDate.parse(parts[3]);
        return new Rent(rentId, user, movie, rentDate);
    }
}
