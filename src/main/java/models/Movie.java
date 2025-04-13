package models;

public class Movie {
    private int id;
    private String title;
    private String director;
    private int year;
    private String imageFileName;   //use to hold the image file name

    //created contructor
    public Movie(int id, String title, String director, int year, String imageFileName) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.year = year;
        this.imageFileName = imageFileName;
    }

    //Getters and setter method implementing
    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    // toFileString method, used to save movie details to file (with image file name)
    public String toFileString() {
        return id + "," + title + "," + director + "," + year + "," + imageFileName;
    }

    public Object getDirector() {
        return director;
    }

    public Object getTitle() {
        return title;
    }

    public Object getYear() {
        return year;
    }
}


