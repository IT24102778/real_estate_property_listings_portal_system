package com.booking.servlet;

import com.booking.model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet("/com/booking")
public class BookingServlet extends HttpServlet {
    private static final String FILE_NAME = "transactions.txt";

    private String getFilePath(HttpServletRequest request) {
        String webInfPath = request.getServletContext().getRealPath("/WEB-INF");
        File file = new File(webInfPath, FILE_NAME);
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return file.getAbsolutePath();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String propertyId = request.getParameter("propertyId");
        String userId = request.getParameter("userId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = "PENDING";
        String transactionId = UUID.randomUUID().toString();
        String bookingDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        Transaction transaction = new Transaction(transactionId, propertyId, userId, amount, status, bookingDate);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(request), true))) {
            writer.write(transaction.toString());
            writer.newLine();
        }

        request.setAttribute("transaction", transaction);
        request.getRequestDispatcher("/paymentConfirmation.jsp").forward(request, response);
    }
}