package servlets;

import service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteReview")
public class DeleteReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String movieName = request.getParameter("movieName");

        // Call the ReviewService to delete the review
        ReviewService reviewService = new ReviewService();
        reviewService.deleteReview(username, movieName);

        // After deletion, redirect to showreviews.jsp
        response.sendRedirect("ShowReviews.jsp");
    }
}
