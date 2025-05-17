<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thank You</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gray-50 text-gray-800 font-sans p-6">
<div class="max-w-md mx-auto bg-white shadow-md rounded-2xl p-8 mt-20 text-center">
    <div class="flex justify-center mb-4">
        <i data-lucide="smile" class="w-10 h-10 text-green-500"></i>
    </div>
    <h2 class="text-2xl font-semibold text-gray-700 mb-2">Thank You!</h2>
    <p class="text-gray-600 mb-6">Your review has been submitted successfully.</p>
    <a href="review.jsp" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-xl shadow">
        <i data-lucide="arrow-left" class="w-4 h-4 mr-2"></i>
        Back to Reviews
    </a>
</div>
<script>lucide.createIcons();</script>
</body>
</html>

