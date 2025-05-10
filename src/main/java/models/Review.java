package models;

public class Review {
    private String username;
    private String movieName;
    private double rating;

    // Constructor
    public Review(String username, String movieName, double rating) {
        this.username = username;
        this.movieName = movieName;
        this.rating = rating;
    }

    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    // Method to convert Review object to a file-friendly string
    public String toFileString() {
        return username + "," + movieName + "," + rating;
    }
}

