package models;

public class Movie {
    private int id;
    private String title;
    private String director;
    private int year;
    private String imageFileName;  // This will hold the image file name

    public Movie(int id, String title, String director, int year, String imageFileName) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.year = year;
        this.imageFileName = imageFileName;
    }
    public Movie(int movieId, String movieName) {
        this.id = movieId;
        this.title = movieName;
    }

    public Movie(String movieName) {
        this.title = movieName;
    }

    // Getter and Setter methods for imageFileName
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

    public String getTitle() {
        return title;
    }

    public Object getYear() {
        return year;
    }


    public Object getId() {
        return id;
    }

    public void setTitle(Object title) {
        this.title = (String) title;
    }

    public void setDirector(Object director) {
        this.director = (String) director;
    }

    public void setYear(Object year) {
        this.year = (int) year;
    }

    public String getMovieName() {
        return title;
    }
}
