package service;

import models.Rent;
import models.User;
import models.Movie;
import utils.RentFileUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class RentService {

    private String rentFilePath;

    public RentService(String rentFilePath) {
        this.rentFilePath = rentFilePath;
    }

    // Add a new rent entry and save to file
    public Rent addRent(String username, String movieName) throws IOException {
        List<Rent> rents = RentFileUtil.loadRents(rentFilePath);
        String nextId = generateNextRentId(rents);

        User user = new User(username);
        Movie movie = new Movie(movieName);
        Rent rent = new Rent(nextId, user, movie, LocalDate.now());

        RentFileUtil.saveRent(rent, rentFilePath);
        return rent;
    }

    // Generate next rent ID like R001, R002
    private String generateNextRentId(List<Rent> rentList) {
        int max = 0;
        for (Rent rent : rentList) {
            String idNum = rent.getRentId().replaceAll("[^0-9]", "");
            int num = Integer.parseInt(idNum);
            if (num > max) max = num;
        }
        return String.format("R%03d", max + 1);
    }
    public List<Rent> getAllRents() {
        return RentFileUtil.loadRents(rentFilePath);
    }


}
