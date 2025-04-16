package com.loginapp.util;

import com.loginapp.model.User;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class FileHandler {
    private static final ReadWriteLock rwLock = new ReentrantReadWriteLock();
    private static final String FILE_SEPARATOR = "|";

    // Get the path to the text file
    private static File getUsersFile(ServletContext context) {
        String filePath = context.getRealPath("/WEB-INF/users.txt");
        File file = new File(filePath);

        // Create the file if it doesn't exist
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return file;
    }

    // Read all users from file
    public static List<User> readUsers(ServletContext context) {
        List<User> users = new ArrayList<>();
        rwLock.readLock().lock();

        try {
            File file = getUsersFile(context);
            if (file.length() == 0) {
                return users;
            }

            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.trim().isEmpty()) {
                        continue; // Skip empty lines
                    }

                    String[] parts = line.split("\\|");
                    if (parts.length >= 5) {
                        User user = new User(
                                parts[0].trim(),  // id
                                parts[1].trim(),  // username
                                parts[2].trim(),  // email
                                parts[3].trim(),  // password
                                parts[4].trim()   // fullName
                        );
                        users.add(user);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            rwLock.readLock().unlock();
        }

        return users;
    }

    // Write users to file
    public static void writeUsers(List<User> users, ServletContext context) {
        rwLock.writeLock().lock();

        try {
            File file = getUsersFile(context);

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (User user : users) {
                    writer.write(user.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            rwLock.writeLock().unlock();
        }
    }
}