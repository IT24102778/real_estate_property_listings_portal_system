package com.booking.servlet;

import com.booking.model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();
        File file = new File(getFilePath(request));
        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length == 6) {
                        transactions.add(new Transaction(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4], parts[5]));
                    }
                }
            }
        }
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("/transactionHistory.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String transactionId = request.getParameter("transactionId");

        if ("update".equals(action)) {
            String newStatus = request.getParameter("status");
            updateTransaction(request, transactionId, newStatus);
        } else if ("delete".equals(action)) {
            deleteTransaction(request, transactionId);
        }

        response.sendRedirect("transactions");
    }

    private void updateTransaction(HttpServletRequest request, String transactionId, String newStatus) throws IOException {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(request)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.startsWith(transactionId + ",")) {
                    String[] parts = line.split(",");
                    line = parts[0] + "," + parts[1] + "," + parts[2] + "," + parts[3] + "," + newStatus + "," + parts[5];
                }
                lines.add(line);
            }
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(request)))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }
    }

    private void deleteTransaction(HttpServletRequest request, String transactionId) throws IOException {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(request)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.startsWith(transactionId + ",")) {
                    lines.add(line);
                }
            }
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(request)))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }
    }
}