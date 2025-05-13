package controller;

import models.Clients;
import models.Movie;

import java.util.List;

public class RentController {
    private List<Movie> availableMovies;

    public RentController(List<Movie> availableMovies) {
        this.availableMovies = availableMovies;
    }

    public String rentMovie(Clients client, String movieId) {
        Movie movieToRent = findMovieById(movieId);

        if (movieToRent == null) {
            return "Movie not found!";
        }

        // Logic to rent the movie to the client
        // (You could store this rental information in a file or database)
        return "Movie rented successfully to " + client.getUsername();
    }

    private Movie findMovieById(String movieId) {
        for (Movie movie : availableMovies) {
            if (movie.getId().equals(movieId)) {
                return movie;
            }
        }
        return null;
    }
}
