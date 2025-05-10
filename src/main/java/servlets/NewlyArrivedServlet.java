package servlets;

import com.google.gson.Gson;
import models.Movie;
import utils.MovieFileUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/newly-arrived")
public class NewlyArrivedServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Movie> newMovies = MovieFileUtil.getNewlyArrivedMovies();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String json = gson.toJson(newMovies);
        out.print(json);
        out.flush();
    }
}
