package service;

import models.Review;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import utils.MovieFileUtil;

public class ReviewService {

    private static final String USER_FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Cusers.txt";  // Path to users.txt
    private static final String MOVIE_FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CMovies.txt";  // Path to movie.txt
    private static final String REVIEW_FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Creviews.txt"; // Path to reviews.txt


    // Method to save the review
    public void saveReview(Review review) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(REVIEW_FILE_PATH, true))) {
            writer.write(review.getUsername() + "," + review.getMovieName() + "," + review.getRating());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to read the users from the file
    private List<String> getUsers() {
        List<String> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(USER_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                users.add(line.trim());  // Add username to the list
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Method to read the movies from the file
    /*public List<String> getMovies() {
        List<String> movies = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(MOVIE_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                movies.add(line.trim());  // Add movie name to the list
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies;
    } */

    // Method to validate if the user and movie exist
    public boolean isValidReview(Review review) {
        List<String> users = getUsers();
        List<String> movies = getMovies();
        return users.contains(review.getUsername()) && movies.contains(review.getMovieName());
    }

    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(REVIEW_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] reviewData = line.split(",");
                String username = reviewData[0].trim();
                String movieName = reviewData[1].trim();
                double rating = Double.parseDouble(reviewData[2].trim());
                reviews.add(new Review(username, movieName, rating));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    // Make this method public so JSP can access it
    public List<String> getMovieList() {
        return getMovies(); // Calls the private method
    }
    public List<String> getMovies() {
        return MovieFileUtil.getAllMovieTitles();
    }

    public List<Review> getSortedReviewsByRating() {
        List<Review> reviews = getAllReviews();
        int n = reviews.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (reviews.get(j).getRating() < reviews.get(j + 1).getRating()) {
                    Review temp = reviews.get(j);
                    reviews.set(j, reviews.get(j + 1));
                    reviews.set(j + 1, temp);
                }
            }
        }
        return reviews;
    }
    public void deleteReview(String username, String movieName) {
        List<Review> reviews = getAllReviews();
        reviews.removeIf(r -> r.getUsername().equalsIgnoreCase(username) && r.getMovieName().equalsIgnoreCase(movieName));

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(REVIEW_FILE_PATH, false))) {
            for (Review r : reviews) {
                writer.write(r.getUsername() + "|" + r.getMovieName() + "|" + r.getRating());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
