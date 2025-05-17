package com.model;

public class Property implements Comparable<Property> {
    private String id;
    private String title;
    private String location;
    private double price;

    public Property(String id, String title, String location, double price) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.price = price;
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    // Parse pipe-delimited string: id|title|location|price
    public static Property fromFileString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length != 4) {
            throw new IllegalArgumentException("Invalid property format: " + line);
        }
        return new Property(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]));
    }

    // Convert to pipe-delimited string for saving
    public String toFileString() {
        return id + "|" + title + "|" + location + "|" + price;
    }

    @Override
    public int compareTo(Property other) {
        return Double.compare(this.price, other.price);
    }

    @Override
    public String toString() {
        return "Property{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", location='" + location + '\'' +
                ", price=" + price +
                '}';
    }
}