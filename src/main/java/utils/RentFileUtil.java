package utils;

import models.Rent;
import models.User;
import models.Movie;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class RentFileUtil {

    private static final String DEFAULT_RENT_FILE = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CRent.txt";



    public static void saveRent(Rent rent, String filePath) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            String line = rent.getRentId() + "," + rent.getUser().getUsername() + "," +
                    rent.getMovie().getMovieName() + "," + rent.getRentDate();
            bw.write(line);
            bw.newLine();
        }
    }

    //Loads rent details
    public static List<Rent> loadRents(String filePath) {
        List<Rent> rents = new ArrayList<>();
        File file = new File(filePath);

        if (!file.exists()) {
            return rents; // return empty list if file doesn't exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                // Format: rentId,username,movieName,rentDate
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    String rentId = parts[0];
                    String username = parts[1];
                    String movieName = parts[2];
                    LocalDate rentDate = LocalDate.parse(parts[3]);

                    rents.add(new Rent(rentId, new User(username), new Movie(movieName), rentDate));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return rents;
    }

    // Simplified version: search from default file
    public static Rent findRent(String username, String movieName, LocalDate rentDate) {
        return findRent(username, movieName, rentDate, DEFAULT_RENT_FILE);
    }

    public static Rent findRent(String username, String movieName, LocalDate rentDate, String filePath) {
        for (Rent rent : loadRents(filePath)) {
            if (rent.getUser().getUsername().equals(username)
                    && rent.getMovie().getMovieName().equals(movieName)
                    && rent.getRentDate().equals(rentDate)) {
                return rent;
            }
        }
        return null;
    }
}
