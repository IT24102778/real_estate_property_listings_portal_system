<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% int index = Integer.parseInt(request.getParameter("index")); %>
<%@ page import="com.example.feedback_review.Review" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Review</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .error-msg { display: none; color: #ef4444; font-size: 0.75rem; margin-top: 0.25rem; }
    </style>
    <script>
        function validateField(fieldId) {
            const feedback = document.getElementsByName("feedback")[0].value.trim();
            const rating = parseInt(document.getElementsByName("rating")[0].value);
            let isValid = true;

            // Validate Feedback
            if (fieldId === 'feedback' || fieldId === 'all') {
                if (feedback.length < 10) {
                    document.getElementById('feedback-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('feedback-error').style.display = 'none';
                }
            }

            // Validate Rating
            if (fieldId === 'rating' || fieldId === 'all') {
                if (isNaN(rating) || rating < 1 || rating > 5) {
                    document.getElementById('rating-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('rating-error').style.display = 'none';
                }
            }

            return isValid;
        }

        function validateForm(event) {
            const isValid = validateField('all');
            if (!isValid) {
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-gray-50 text-gray-800 font-sans p-6">
<div class="max-w-xl mx-auto bg-white shadow-md rounded-2xl p-6 mt-10">
    <div class="flex items-center mb-6">
        <i data-lucide="edit" class="w-6 h-6 text-blue-500 mr-2"></i>
        <h2 class="text-2xl font-semibold text-gray-700">Edit Your Review</h2>
    </div>
    <%
        List<Review> reviewList = (List<Review>) application.getAttribute("reviewList");
        if (reviewList != null && index >= 0 && index < reviewList.size()) {
            Review r = reviewList.get(index);
    %>
    <form action="editReview" method="post" class="space-y-5" onsubmit="return validateForm(event)">
        <input type="hidden" name="index" value="<%= index %>">
        <div>
            <label class="block text-gray-600 mb-1">Feedback <span class="text-gray-400">( 10 - 100 characters)</span></label>
            <textarea name="feedback" rows="4" required class="w-full p-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-300" oninput="validateField('feedback')"><%= r.getFeedback() %></textarea>
            <span id="feedback-error" class="error-msg">Feedback must be between 10 and 100 characters.</span>
        </div>
        <div>
            <label class="block text-gray-600 mb-1">New Rating (1-5)</label>
            <input type="number" name="rating" min="1" max="5" required class="w-full p-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-300" value="<%= r.getRating() %>" oninput="validateField('rating')">
            <span id="rating-error" class="error-msg">Rating must be between 1 and 5.</span>
        </div>
        <div class="flex justify-end">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-5 py-2 rounded-xl shadow inline-flex items-center">
                <i data-lucide="save" class="w-5 h-5 mr-2"></i>
                Edit Review
            </button>
        </div>
    </form>
    <% } else { %>
    <p class="text-red-500">Review not found.</p>
    <% } %>
</div>
<script>lucide.createIcons();</script>
</body>
</html>


