package service;

import models.Admin;
import models.Clients;
import models.User;
import utils.FileHandler;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletContext;
import java.util.List;

public class UserService {
    // Register user (Client or Admin)
    public boolean registerUser(User user) {
        List<User> users = FileHandler.readUsers();

        // Check if username or email already exists
        for (User existing : users) {
            if (existing.getUsername().equalsIgnoreCase(user.getUsername()) ||
                    existing.getEmail().equalsIgnoreCase(user.getEmail())) {
                return false;
            }
        }

        // Hash the password
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));

        // Add to list and write
        users.add(user);
        FileHandler.writeUsers(users);  // No context needed
        return true;
    }


    // Authenticate user (Client or Admin)
    // Authenticate user (Client or Admin)
    public User authenticate(String email, String password) {
        // 1. Check for hardcoded admin login
        if (email.equalsIgnoreCase("AdminCineCritix@gmail.com") && password.equals("Admin@Rohana")) {
            return new Admin("admin", "AdminCineCritix@gmail.com", "Admin@Rohana");
        }

        // 2. Check in registered users list (Clients/Admins)
        List<User> users = FileHandler.readUsers();
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email) &&
                    BCrypt.checkpw(password, user.getPassword())) {
                return user;
            }
        }
        return null; // Authentication failed
    }
    // Find user by username
    public User findByUsername(String username) {
        List<User> users = FileHandler.readUsers();
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        return null;
    }
    // Update user (preserves password if not changed)
    public boolean updateUser(User updatedUser) {
        List<User> users = FileHandler.readUsers();

        for (int i = 0; i < users.size(); i++) {
            User existing = users.get(i);

            if (existing.getUsername().equalsIgnoreCase(updatedUser.getUsername())) {
                // Only update password if a new one is provided
                if (updatedUser.getPassword() == null || updatedUser.getPassword().isEmpty()) {
                    updatedUser.setPassword(existing.getPassword());
                } else {
                    updatedUser.setPassword(BCrypt.hashpw(updatedUser.getPassword(), BCrypt.gensalt()));
                }

                users.set(i, updatedUser);
                FileHandler.writeUsers(users); // No context needed
                return true;
            }
        }

        return false;
    }
    // In UserService.java
    public List<User> getAllUsers() {
        return FileHandler.readUsers(); // Simply return the full list
    }


    // Delete user
    public boolean deleteUser(String username) {
        List<User> users = FileHandler.readUsers();
        boolean removed = users.removeIf(user -> user.getUsername().equalsIgnoreCase(username));

        if (removed) {
            FileHandler.writeUsers(users); // No context needed
        }

        return removed;
    }
}