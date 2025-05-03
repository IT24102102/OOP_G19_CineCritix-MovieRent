package utils;

import models.Clients;
import models.User;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String FILE_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Cusers.txt";
    private static final String DELIMITER = "\\|";
    private static final String JOINER = "|";

    // Get file at the given absolute path
    private static File getFile() {
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs(); // Ensure parent folders exist
                file.createNewFile();          // Create the file
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return file;
    }

    // Read users (Clients) from external file
    public static List<User> readUsers() {
        List<User> users = new ArrayList<>();
        File file = getFile();

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;

            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] parts = line.split(DELIMITER);

                if (parts.length == 5) {
                    String username = parts[0];
                    String email = parts[1];
                    String hashedPassword = parts[2];
                    String fullName = parts[3];
                    String phone = parts[4];

                    users.add(new Clients(username, email, hashedPassword, fullName, phone));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Write users (Clients) to external file
    public static void writeUsers(List<User> users) {
        File file = getFile();

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            for (User user : users) {
                if (user instanceof Clients) {
                    Clients client = (Clients) user;
                    String line = String.join(JOINER,
                            client.getUsername(),
                            client.getEmail(),
                            client.getPassword(),
                            client.getFullName(),
                            client.getPhoneNumber());
                    bw.write(line);
                    bw.newLine();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    // Method to get a user by their email
    public static Clients getUserDetailsByEmail(String email) {
        List<User> users = readUsers();  // Get all users from the file
        for (User user : users) {
            if (user instanceof Clients) {
                Clients client = (Clients) user;
                if (client.getEmail().equalsIgnoreCase(email)) {
                    return client;  // If email matches, return the client
                }
            }
        }
        return null;  // Return null if no match found
    }

}