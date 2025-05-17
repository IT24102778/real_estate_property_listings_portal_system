<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.feedback_review.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.FileStore" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Reviews</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .star { cursor: pointer; font-size: 1.8rem; transition: color 0.2s ease; }
        .review-text {
            max-height: 150px; /* Increased height for longer reviews */
            overflow-y: auto; /* Scrollable if content exceeds height */
            word-break: break-word; /* Breaks long words to fit */
            padding: 1rem; /* More padding for readability */
            line-height: 1.6; /* Improved line spacing */
            background-color: #f9fafb; /* Light background for contrast */
            border-radius: 0.5rem; /* Rounded corners */
        }
        .table-container {
            max-height: 75vh; /* Increased viewport height for more rows */
            overflow-y: auto; /* Vertical scroll for large datasets */
            border: 1px solid #e5e7eb; /* Subtle border for container */
            border-radius: 0.75rem; /* Rounded container edges */
        }
        th, td {
            vertical-align: middle; /* Align text vertically in cells */
        }
        /* Tooltip styles */
        .tooltip {
            position: relative;
            display: inline-flex;
            align-items: center;
        }
        .tooltip .tooltip-text {
            visibility: hidden;
            width: 60px;
            background-color: #374151;
            color: #fff;
            text-align: center;
            border-radius: 0.25rem;
            padding: 0.25rem 0.5rem;
            position: absolute;
            z-index: 1;
            bottom: 125%; /* Position above the icon */
            left: 50%;
            transform: translateX(-50%);
            font-size: 0.75rem; /* Small text */
            opacity: 0;
            transition: opacity 0.2s ease;
        }
        .tooltip:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-800 font-sans p-6">
<div class="max-w-5xl mx-auto bg-white shadow-2xl rounded-3xl p-10 mt-10">
    <div class="flex items-center mb-10">
        <i data-lucide="star" class="w-10 h-10 text-yellow-500 mr-4"></i>
        <h2 class="text-4xl font-extrabold text-gray-900">Feedback Reviews</h2>
    </div>
    <div class="table-container">
        <table class="w-full text-left border-collapse">
            <thead class="bg-gray-200 sticky top-0">
            <tr class="border-b-4 border-gray-300">
                <th class="px-8 py-6 font-bold text-xl text-gray-800">NO.</th>
                <th class="px-8 py-6 font-bold text-xl text-gray-800">User Name</th>
                <th class="px-8 py-6 font-bold text-xl text-gray-800">Rating</th>
                <th class="px-8 py-6 font-bold text-xl text-gray-800">Review</th>
                <th class="px-8 py-6 font-bold text-xl text-gray-800">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Review> reviewList = (List<Review>) getServletContext().getAttribute("reviewList");
                String userid = (String) session.getAttribute("userid");
                if (reviewList != null && !reviewList.isEmpty()) {
                    for (int i = 0; i < reviewList.size(); i++) {
                        Review r = reviewList.get(i);
            %>
            <tr class="border-b-2 border-gray-200 hover:bg-gray-100 transition-colors duration-200">
                <td class="px-8 py-6 text-2xl text-gray-700"><%= i + 1 %></td>
                <td class="px-8 py-6 text-2xl font-semibold text-gray-700"><%= r.getName() %></td>
                <td class="px-8 py-6 text-2xl text-yellow-500">
                    <% for (int j = 1; j <= 5; j++) { %>
                    <%= (j <= r.getRating()) ? "★" : "☆" %>
                    <% } %>
                </td>
                <td class="px-8 py-6 text-lg text-gray-700 review-text"><%= r.getFeedback() %></td>
                <td class="px-8 py-6">
                    <% if (userid != null && userid.equals(r.getUserid())) { %>
                    <form action="deleteReview" method="post" class="inline mr-6">
                        <input type="hidden" name="index" value="<%= i %>">
                        <button type="submit" class="tooltip text-red-600 hover:text-red-800 font-semibold text-xl" onclick="return confirm('Are you sure you want to delete this review?')">
                            <i data-lucide="trash" class="inline w-7 h-7 mr-2"></i>
                            <span class="tooltip-text">Delete</span>
                        </button>
                    </form>
                    <form action="editReview.jsp" method="post" class="inline">
                        <input type="hidden" name="index" value="<%= i %>">
                        <button type="submit" class="tooltip text-blue-600 hover:text-blue-800 font-semibold text-xl">
                            <i data-lucide="edit" class="inline w-7 h-7 mr-2"></i>
                            <span class="tooltip-text">Edit</span>
                        </button>
                    </form>
                    <% } %>
                </td>
            </tr>
            <%
                }
            } else { %>
            <tr><td colspan="5" class="px-8 py-6 text-center text-2xl text-gray-500">No reviews available.</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <div class="mt-10 flex justify-between">
        <a href="addReview.jsp" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-xl shadow-lg text-xl font-bold">Add Review</a>
        <a href="summary.jsp" class="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl shadow-lg text-xl font-bold">See Summary</a>
    </div>
</div>
<script>lucide.createIcons();</script>
</body>
</html>
<%!
%>