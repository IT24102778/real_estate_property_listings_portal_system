package org.example.model;

import java.time.LocalDateTime;
import java.util.UUID;

public class Property {
    private String id;
    private String title;
    private String description;
    private double price;
    private String location;
    private String status;
    private User owner;
    private LocalDateTime createdAt;

    public Property(String title, String description, double price, String location, User owner) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.description = description;
        this.price = price;
        this.location = location;
        this.status = "PENDING";
        this.owner = owner;
        this.createdAt = LocalDateTime.now();
    }

    public Property() {
        // Default constructor for Jackson
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
} 