<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-teal-200 min-h-screen flex items-center justify-center">
    <div class="max-w-2xl w-full bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Payment Confirmation</h2>
        <div class="text-green-600 text-center text-lg mb-6">
            Booking Successful!
        </div>
        <div class="space-y-2">
            <p><strong>Transaction ID:</strong> ${transaction.transactionId}</p>
            <p><strong>Property ID:</strong> ${transaction.propertyId}</p>
            <p><strong>User ID:</strong> ${transaction.userId}</p>
            <p><strong>Amount:</strong> ${transaction.amount}</p>
            <p><strong>Status:</strong> ${transaction.status}</p>
            <p><strong>Date:</strong> ${transaction.bookingDate}</p>
        </div>
        <a href="transactions">
            <button class="mt-6 w-full bg-indigo-600 text-white p-3 rounded-md hover:bg-indigo-700 transition duration-300">
                View Transaction History
            </button>
        </a>
    </div>
</body>
</html>