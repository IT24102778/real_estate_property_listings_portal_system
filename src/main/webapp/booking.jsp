<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book a Property</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-teal-200 min-h-screen flex items-center justify-center">
    <div class="max-w-2xl w-full bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Book a Property</h2>
        <form action="booking" method="post" class="space-y-4">
            <input type="text" name="propertyId" placeholder="Property ID" required
                   class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <input type="text" name="userId" placeholder="User ID" required
                   class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <input type="number" name="amount" placeholder="Amount" step="0.01" required
                   class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <button type="submit"
                    class="w-full bg-indigo-600 text-white p-3 rounded-md hover:bg-indigo-700 transition duration-300">
                Book Now
            </button>
        </form>
    </div>
</body>
</html>