package utils;

import models.Rent;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class RentFileUtil {

    // Save single rent entry to file (append mode)
    public static void saveRent(Rent rent, String filePath) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            String line = rent.getRentId() + "," + rent.getUser().getUsername() + "," + rent.getMovie().getMovieName() + "," + rent.getRentDate();
            bw.write(line);
            bw.newLine();
        }
    }

    // Load all rents from file
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

                    rents.add(new Rent(rentId, new models.User(username), new models.Movie(movieName), rentDate));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return rents;
    }
}
