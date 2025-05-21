package models;

import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String email;
    private String password;

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    //Hash password use to secure the name ()
    public void setPassword(String hashpw) {
        this.password = hashpw;
    }
}
