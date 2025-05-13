package servlets;

import models.Review;
import service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {

    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Review> sortedReviews = reviewService.getSortedReviewsByRating();
        request.setAttribute("sortedReviews", sortedReviews);
        request.getRequestDispatcher("reviews.jsp").forward(request, response);
    }
}
