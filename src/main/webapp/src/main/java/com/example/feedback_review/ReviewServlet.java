package com.example.feedback_review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ReviewServlet extends HttpServlet {
    private List<Review> reviewList;

    @Override
    public void init() {
        reviewList = (List<Review>) getServletContext().getAttribute("reviewList");
        if (reviewList == null) {
            reviewList = new ArrayList<>();
            getServletContext().setAttribute("reviewList", reviewList);
            log("Initialized new reviewList in ServletContext.");
        } else {
            log("Retrieved existing reviewList from ServletContext with size: " + reviewList.size());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log("Handling GET request for ReviewServlet.");
        request.setAttribute("reviewList", getServletContext().getAttribute("reviewList"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/review.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log("Handling POST request for ReviewServlet.");
        try {
            String name = request.getParameter("name");
            String feedback = request.getParameter("feedback");
            String ratingStr = request.getParameter("rating");
            String userid = request.getParameter("userid");

            log("Received parameters: name=" + name + ", userid=" + userid + ", feedback=" + feedback + ", rating=" + ratingStr);

            // Server-side validation
            if (name.length() == 1 || name.trim().isEmpty() || name.length() > 50) {
                log("Validation failed: Name must be between 1 and 50 characters.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Name must be between 1 and 50 characters.");
                return;
            }
            if (userid.length() == 5 || userid.trim().isEmpty() || userid.length() > 15) {
                log("Validation failed: User ID must be between 5 and 15 characters.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID must be between 5 and 15 characters.");
                return;
            }
            if (feedback.trim().length() <= 10 || feedback.trim().length() >= 100) {
                log("Validation failed: Feedback must be between 10 and 100 characters.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Feedback must be between 10 and 100 characters.");
                return;
            }

            int rating;
            try {
                rating = Integer.parseInt(ratingStr);
                if (rating < 1 || rating > 5) {
                    log("Validation failed: Rating must be between 1 and 5.");
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Rating must be between 1 and 5.");
                    return;
                }
            } catch (NumberFormatException e) {
                log("Validation failed: Invalid rating value - " + e.getMessage());
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid rating value.");
                return;
            }

            // Create and add new review
            Review newReview = new Review(name.trim(), feedback.trim(), rating, userid.trim());
            synchronized (reviewList) {
                reviewList.add(0, newReview);
                getServletContext().setAttribute("reviewList", reviewList); // Ensure context is updated
            }
            log("Review added successfully: " + newReview + ", new list size: " + reviewList.size());

            // Store userid in session and redirect to thankYou.jsp
            HttpSession session = request.getSession();
            session.setAttribute("userid", userid);
            log("Redirecting to thankYou.jsp");
            response.sendRedirect("thankYou.jsp");
        } catch (Exception e) {
            log("Error in ReviewServlet doPost: " + e.getMessage(), e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your review: " + e.getMessage());
        }
    }
}
