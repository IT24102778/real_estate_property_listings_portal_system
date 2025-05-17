<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-teal-200 min-h-screen p-6">
    <div class="max-w-4xl mx-auto bg-white p-8 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Transaction History</h2>
        <div class="overflow-x-auto">
            <table class="w-full table-auto border-collapse">
                <thead>
                    <tr class="bg-blue-600 text-white">
                        <th class="p-3 text-left">Transaction ID</th>
                        <th class="p-3 text-left">Property ID</th>
                        <th class="p-3 text-left">User ID</th>
                        <th class="p-3 text-left">Amount</th>
                        <th class="p-3 text-left">Status</th>
                        <th class="p-3 text-left">Date</th>
                        <th class="p-3 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr class="hover:bg-gray-50">
                            <td class="p-3 border-b">${transaction.transactionId}</td>
                            <td class="p-3 border-b">${transaction.propertyId}</td>
                            <td class="p-3 border-b">${transaction.userId}</td>
                            <td class="p-3 border-b">${transaction.amount}</td>
                            <td class="p-3 border-b">${transaction.status}</td>
                            <td class="p-3 border-b">${transaction.bookingDate}</td>
                            <td class="p-3 border-b flex space-x-2">
                                <form action="transactions" method="post" class="inline">
                                    <input type="hidden" name="transactionId" value="${transaction.transactionId}">
                                    <input type="hidden" name="action" value="update">
                                    <select name="status" class="p-2 border border-gray-300 rounded-md">
                                        <option value="PENDING">Pending</option>
                                        <option value="CONFIRMED">Confirmed</option>
                                        <option value="CANCELLED">Cancelled</option>
                                    </select>
                                    <button type="submit"
                                            class="ml-2 bg-indigo-600 text-white px-3 py-2 rounded-md hover:bg-indigo-700">
                                        Update
                                    </button>
                                </form>
                                <form action="transactions" method="post" class="inline">
                                    <input type="hidden" name="transactionId" value="${transaction.transactionId}">
                                    <input type="hidden" name="action" value="delete">
                                    <button type="submit"
                                            class="bg-red-600 text-white px-3 py-2 rounded-md hover:bg-red-700">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>