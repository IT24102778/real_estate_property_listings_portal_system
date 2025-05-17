package com.example.feedback_review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class DeleteReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexStr = request.getParameter("index");

        // Validation
        int index;
        try {
            index = Integer.parseInt(indexStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid index.");
            return;
        }

        HttpSession session = request.getSession();
        String sessionUserId = (String) session.getAttribute("userid");
        List<com.example.feedback_review.Review> reviewList = (List<com.example.feedback_review.Review>) getServletContext().getAttribute("reviewList");

        if (reviewList != null && index >= 0 && index < reviewList.size()) {
            Review review = reviewList.get(index);
            if (sessionUserId != null && review.getUserid().equals(sessionUserId)) {
                reviewList.remove(index);
            }
        }
        response.sendRedirect("review");
    }
}
