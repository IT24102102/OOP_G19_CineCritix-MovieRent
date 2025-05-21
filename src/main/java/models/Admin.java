package models;

public class Admin extends User {

    public Admin(String username, String email, String password) {
        super(username, email, password); // Call the constructor of the parent class

        //No need to add extra attributes cuz we are not need of using for admins
    }


}
