package com.example.feedback_review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class EditReviewServlet extends HttpServlet {
    private List<Review> reviewList = new ArrayList<>();

    @Override
    public void init() {
        reviewList = (List<Review>) getServletContext().getAttribute("reviewList");
        if (reviewList == null) {
            reviewList = new ArrayList<>();
            getServletContext().setAttribute("reviewList", reviewList);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET if needed, but typically redirect to edit page is handled by review.jsp form
        response.sendRedirect("review.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        String feedback = request.getParameter("feedback");
        String ratingStr = request.getParameter("rating");

        // Server-side validation
        if (feedback == null || feedback.trim().length() < 10) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Feedback must be at least 10 characters long.");
            return;
        }
        int rating;
        try {
            rating = Integer.parseInt(ratingStr);
            if (rating < 1 || rating > 5) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Rating must be between 1 and 5.");
                return;
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid rating value.");
            return;
        }

        // Update review
        synchronized (reviewList) {
            if (index >= 0 && index < reviewList.size()) {
                Review r = reviewList.get(index);
                r.setFeedback(feedback.trim());
                r.setRating(rating);
            }
        }

        response.sendRedirect("review.jsp");
    }
}
