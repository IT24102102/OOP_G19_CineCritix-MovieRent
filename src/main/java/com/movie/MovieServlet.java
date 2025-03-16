package com.movie;

import com.movie.Movie;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/movies")
public class MovieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movies = new ArrayList<>();
        movies.add(new Movie("Inception", "images/Inception.jpg"));
       /* movies.add(new Movie("Interstellar", "images/intersteller.jpg"));
        movies.add(new Movie("The Dark Knight", "images/darkknight.jpg"));
        movies.add(new Movie("Avatar", "images/avatar.jpg"));
        movies.add(new Movie("Titanic", "images/titanic.jpg"));
        movies.add(new Movie("The Avengers", "images/avengers.jpg"));*/

        request.setAttribute("movies", movies);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
