package models;

public class Clients extends User {
    private String fullName;
    private String phoneNumber;


// Paramiterized Constructor
    public Clients(String username, String email, String password, String fullName, String phoneNumber) {
        super(username, email, password);
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
    }
 // getter
    public String getFullName() {
        return fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
}
