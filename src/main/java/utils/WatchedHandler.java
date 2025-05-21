package utils;

import java.io.*;
import java.util.*;

public class WatchedHandler {
    private static final String FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Cwatched.txt";

    // Adds the watched movie to the watched.txt file
    public static void addWatchedMovie(String movieName) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(movieName);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //using in build in here
    /*
    // Loads the watched movies into a stack (latest movie on top)
    public static Stack<String> loadWatchedMovies() {
        Stack<String> stack = new Stack<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                stack.push(line); // push to stack to reverse the display order
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return stack;
    }   */
    // Custom stack ,bacuse for the DSA part we need to do like it

    public static MyStack loadWatchedMovies() {
        // First read all movies into a list to know size
        List<String> movies = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                movies.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Create custom stack with capacity (For DSA part)
        MyStack stack = new MyStack(movies.size());

        // Push movies onto stack to reverse display order (latest on top- from the reading text file)
        for (String movie : movies) {
            stack.push(movie);
        }
        return stack;
    }


    //Stack isnt not using,, casue we are using this part. bcz it showing the jsp so accurate
    public static void deleteWatchedMovie(String movieName) {
        List<String> movies = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.equalsIgnoreCase(movieName)) {
                    movies.add(line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (String m : movies) {
                writer.write(m);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
