package com.cinecritix.model;
//final

public class WatchedMovie {
    private int id;
    private String title;
    private String author;
    private String imageUrl;
    private String watchedDate;

    public WatchedMovie(int id, String title, String author, String imageUrl, String watchedDate) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.imageUrl = imageUrl;
        this.watchedDate = watchedDate;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getImageUrl() { return imageUrl; }
    public String getWatchedDate() { return watchedDate; }
}
