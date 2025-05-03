package models;

public class Admin extends User {

    public Admin(String username, String email, String password) {
        super(username, email, password); // Call the constructor of the parent class
    }

    // Admin-specific methods (if needed)
}
