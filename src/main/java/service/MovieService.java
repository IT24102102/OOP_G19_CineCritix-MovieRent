package service;

import models.Movie;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MovieService {

    private static final String MOVIE_FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/movies.txt";  // File to store movies

    // Method to get all movies
    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(MOVIE_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                int movieId = Integer.parseInt(data[0]);
                String movieName = data[1];
                movies.add(new Movie(movieId, movieName));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies;
    }

    // Method to validate if a movie exists in the list
    public boolean isValidMovie(String movieName) {
        List<Movie> movieList = getAllMovies();  // Get all movies
        for (Movie movie : movieList) {
            if (movie.getMovieName().equalsIgnoreCase(movieName)) {
                return true; // Movie found
            }
        }
        return false; // Movie not found
    }

}
