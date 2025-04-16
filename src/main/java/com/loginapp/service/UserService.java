package com.loginapp.service;

import com.loginapp.model.User;
import com.loginapp.util.FileHandler;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Optional;

public class UserService {
    private ServletContext context;

    public UserService(ServletContext context) {
        this.context = context;
    }

    // Create a new user
    public boolean registerUser(User user) {
        List<User> users = FileHandler.readUsers(context);

        // Check if username or email already exists
        if (users.stream().anyMatch(u -> u.getUsername().equals(user.getUsername()) ||
                u.getEmail().equals(user.getEmail()))) {
            return false;
        }

        // Hash the password
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));

        // Add the new user
        users.add(user);
        FileHandler.writeUsers(users, context);
        return true;
    }

    // Find user by username
    public Optional<User> findByUsername(String username) {
        List<User> users = FileHandler.readUsers(context);
        return users.stream()
                .filter(u -> u.getUsername().equals(username))
                .findFirst();
    }

    // Find user by email
    public Optional<User> findByEmail(String email) {
        List<User> users = FileHandler.readUsers(context);
        return users.stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst();
    }

    // Find user by ID
    public Optional<User> findById(String id) {
        List<User> users = FileHandler.readUsers(context);
        return users.stream()
                .filter(u -> u.getId().equals(id))
                .findFirst();
    }

    // Authenticate user
    public Optional<User> authenticate(String username, String password) {
        Optional<User> userOpt = findByUsername(username);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (BCrypt.checkpw(password, user.getPassword())) {
                return Optional.of(user);
            }
        }

        return Optional.empty();
    }

    // Update user
    public boolean updateUser(User updatedUser) {
        List<User> users = FileHandler.readUsers(context);

        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getId().equals(updatedUser.getId())) {
                // Don't update the password if it's empty (meaning it wasn't changed)
                if (updatedUser.getPassword() == null || updatedUser.getPassword().isEmpty()) {
                    updatedUser.setPassword(users.get(i).getPassword());
                } else {
                    // Hash the new password
                    updatedUser.setPassword(BCrypt.hashpw(updatedUser.getPassword(), BCrypt.gensalt()));
                }

                users.set(i, updatedUser);
                FileHandler.writeUsers(users, context);
                return true;
            }
        }

        return false;
    }

    // Delete user
    public boolean deleteUser(String id) {
        List<User> users = FileHandler.readUsers(context);
        boolean removed = users.removeIf(u -> u.getId().equals(id));

        if (removed) {
            FileHandler.writeUsers(users, context);
            return true;
        }

        return false;
    }
}