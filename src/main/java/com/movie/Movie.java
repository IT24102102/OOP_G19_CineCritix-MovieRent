package com.movie;

public class Movie {
    private String title;
    private String genre;
    private double rating;
    private String imageUrl;

    // Constructor
    public Movie(String title, String genre, double rating) {
        this.title = title;
        this.genre = genre;
        this.rating = rating;
    }
    //Constructor overload, because need to add image urls
    public Movie(String title, String imageUrl) {
        this.title = title;
        this.imageUrl = imageUrl;
    }


    // Getters and setters
    public String getTitle() {
        return title;
    }
    public String getImageUrl() {
        return imageUrl;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

}
