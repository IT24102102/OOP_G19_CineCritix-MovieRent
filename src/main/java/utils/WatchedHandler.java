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
    }


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
