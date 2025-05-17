package com.booking.model;

public class Transaction {
    private String transactionId;
    private String propertyId;
    private String userId;
    private double amount;
    private String status;
    private String bookingDate;

    public Transaction(String transactionId, String propertyId, String userId, double amount, String status, String bookingDate) {
        this.transactionId = transactionId;
        this.propertyId = propertyId;
        this.userId = userId;
        this.amount = amount;
        this.status = status;
        this.bookingDate = bookingDate;
    }

    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }
    public String getPropertyId() { return propertyId; }
    public void setPropertyId(String propertyId) { this.propertyId = propertyId; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }

    @Override
    public String toString() {
        return transactionId + "," + propertyId + "," + userId + "," + amount + "," + status + "," + bookingDate;
    }
}