package utils;

import models.Movie;
import java.io.*;
import java.util.*;

public class MovieFileUtil {
    private static final String FILE_PATH = "C:\\Users\\Tharindu\\Desktop\\OOP_WEb\\Movies.txt";

    // Save movie to file
    public static void saveMovie(Movie movie) throws IOException {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true));
            writer.write(movie.toFileString());
            writer.newLine();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all movies from file
    public static List<Movie> loadMovies() {
        List<Movie> movies = new ArrayList<>();
        try {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                int id = Integer.parseInt(parts[0]);
                String title = parts[1];
                String director = parts[2];
                int year = Integer.parseInt(parts[3]);
                String imageFileName = parts[4];

                movies.add(new Movie(id, title, director, year, imageFileName));
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies;
    }
}
