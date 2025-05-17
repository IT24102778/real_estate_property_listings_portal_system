<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.feedback_review.Review" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Summary</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .bar { background-color: #facc15; transition: height 0.3s ease; }
    </style>
</head>
<body class="bg-gray-50 text-gray-800 font-sans p-8">
<div class="max-w-4xl mx-auto bg-white shadow-xl rounded-3xl p-10 mt-12">
    <div class="flex items-center mb-8">
        <i data-lucide="bar-chart-2" class="w-8 h-8 text-blue-500 mr-3"></i>
        <h2 class="text-3xl font-extrabold text-gray-900">Feedback Summary</h2>
    </div>
    <%
        List<Review> reviewList = (List<Review>) application.getAttribute("reviewList");
        int totalSubmissions = (reviewList != null) ? reviewList.size() : 0;
        double averageRating = 0.0;
        int[] ratingCounts = new int[5]; // For ratings 1 to 5
        if (reviewList != null && !reviewList.isEmpty()) {
            int totalRating = 0;
            for (Review r : reviewList) {
                int rating = r.getRating();
                totalRating += rating;
                if (rating >= 1 && rating <= 5) {
                    ratingCounts[rating - 1]++;
                }
            }
            averageRating = (double) totalRating / reviewList.size();
        }
    %>
    <p class="text-gray-600 mb-4 text-xl"><strong>Total Submissions:</strong> <%= totalSubmissions %></p>
    <p class="text-gray-600 mb-8 text-xl"><strong>Average Rating:</strong> <%= totalSubmissions > 0 ? String.format("%.1f", averageRating) : "N/A" %> / 5</p>
    <div class="flex justify-between items-end h-48 mb-8">
        <% for (int i = 0; i < 5; i++) {
            int height = (totalSubmissions > 0) ? (ratingCounts[i] * 100 / totalSubmissions) : 0;
        %>
        <div class="flex flex-col items-center">
            <div class="bar w-12 rounded-t" style="height: <%= height %>px;"></div>
            <span class="text-lg text-gray-600 mt-3"><%= (i + 1) %></span>
        </div>
        <% } %>
    </div>
    <div class="flex justify-center">
        <a href="review.jsp" class="inline-flex items-center px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-xl shadow-lg text-lg font-semibold">
            <i data-lucide="arrow-left" class="w-5 h-5 mr-2"></i>
            Back to Reviews
        </a>
    </div>
</div>
<script>lucide.createIcons();</script>
</body>
</html>

