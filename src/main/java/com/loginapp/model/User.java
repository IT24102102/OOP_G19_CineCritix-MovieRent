package com.loginapp.model;

import java.io.Serializable;
import java.util.UUID;

public class User implements Serializable {
    private String id;
    private String username;
    private String email;
    private String password;
    private String fullName;

    // Default constructor
    public User() {
        this.id = UUID.randomUUID().toString();
    }

    // Constructor with fields
    public User(String username, String email, String password, String fullName) {
        this.id = UUID.randomUUID().toString();
        this.username = username;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
    }

    // Parameterized constructor for parsing from file
    public User(String id, String username, String email, String password, String fullName) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
    }

    // Getters and setters to access private variables
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    // Convert user to string format for storage

    public String toFileString() {
        return String.join("|", id, username, email, password, fullName);
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                '}';
    }
}