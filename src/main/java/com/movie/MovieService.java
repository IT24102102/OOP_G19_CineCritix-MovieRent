package com.movie;

import java.util.ArrayList;
import java.util.List;

public class MovieService {
    private List<Movie> movieList;

    public MovieService() {
        movieList = new ArrayList<>();
    }

    public void addMovie(Movie movie) {
        movieList.add(movie);
    }

    public List<Movie> getAllMovies() {
        return movieList;
    }
}
