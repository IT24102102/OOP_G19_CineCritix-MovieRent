package com.cinecritix.servlet;
import com.cinecritix.model.WatchedMovie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/watched-list")
public class WatchedListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Sample data if none exists
        List<WatchedMovie> watchedList = (List<WatchedMovie>) session.getAttribute("watchedList");
        if (watchedList == null) {
            watchedList = new ArrayList<>();
            watchedList.add(new WatchedMovie(1, "Inception", "Christopher Nolan", "inception.jpg", "2025-05-01"));
            watchedList.add(new WatchedMovie(2, "The Matrix", "Wachowski Sisters", "matrix.jpg", "2025-05-15"));
            session.setAttribute("watchedList", watchedList);
        }

        request.setAttribute("watchedList", watchedList);
        request.getRequestDispatcher("watched-list.jsp").forward(request, response);
    }
}
