package utils;

import models.Movie;
import java.io.*;
import java.util.*;

public class MovieFileUtil {
    private static final String FILE_PATH = "C:\\Users\\Tharindu\\Desktop\\OOP_WEb\\Original\\CMovies.txt";

    // Save or update movie to file
    public static void saveMovie(Movie movie) throws IOException {
        // Load all movies
        List<Movie> movies = loadMovies();

        // Check if the movie exists (by ID)
        boolean movieExists = false;
        for (Movie m : movies) {
            if (m.getId() == movie.getId()) {
                // Movie exists, update its details
                m.setTitle(movie.getTitle());
                m.setDirector(movie.getDirector());
                m.setYear(movie.getYear());
                m.setImageFileName(movie.getImageFileName());
                movieExists = true;
                break;
            }
        }

        // If movie doesn't exist, add it to the list
        if (!movieExists) {
            movies.add(movie);
        }

        // Write all movies back to the file (this includes the updated movie)
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Movie m : movies) {
                writer.write(m.toFileString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to load movies from the file
    public static List<Movie> loadMovies() {
        List<Movie> movies = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] movieData = line.split(",");

                // Check if the line has exactly 5 fields
                if (movieData.length == 5) {
                    int id = Integer.parseInt(movieData[0]);
                    String title = movieData[1];
                    String director = movieData[2];
                    int year = Integer.parseInt(movieData[3]);
                    String imageFileName = movieData[4];

                    Movie movie = new Movie(id, title, director, year, imageFileName);
                    movies.add(movie);
                } else {
                    System.out.println("Skipping invalid movie entry: " + line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies;
    }

    // Method to get movie by ID
    public static Movie getMovieById(int id) {
        List<Movie> movies = loadMovies();
        for (Movie movie : movies) {
            if (movie.getId().equals(id)) {  // Corrected comparison to use primitive int
                return movie;
            }
        }
        return null;
    }

    // Method to delete movie by ID
    public static boolean deleteMovieById(int id) {
        List<Movie> movies = loadMovies();
        boolean movieFound = false;

        for (Movie movie : movies) {
            if (movie.getId().equals(id)) {
                movies.remove(movie);  // Remove the movie from the list
                movieFound = true;
                break;
            }
        }

        // If a movie is found and removed, overwrite the file with updated list
        if (movieFound) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
                for (Movie m : movies) {
                    writer.write(m.toFileString());
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return false;
    }
    //adding code for dispaly index.jsp's newly add section

    // Get last 5 movies added (assumed as "newly arrived")
    public static List<Movie> getNewlyArrivedMovies() {
        List<Movie> allMovies = loadMovies();
        int total = allMovies.size();
        int fromIndex = Math.max(0, total - 5); // Get last 5 movies
        return allMovies.subList(fromIndex, total);
    }
    public static List<String> getAllMovieTitles() {
        List<String> titles = new ArrayList<>();
        List<Movie> movies = loadMovies();
        for (Movie movie : movies) {
            titles.add(movie.getTitle());
        }
        return titles;
    }





}
