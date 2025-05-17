package com.example.feedback_review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class SummaryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Review> reviewList = (List<Review>) getServletContext().getAttribute("reviewList");
        request.setAttribute("reviewList", reviewList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("summary.jsp");
        dispatcher.forward(request, response);
    }
}
