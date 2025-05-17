package com.model;

public class ResidentialProperty extends Property {
    private String description;
    private String imageUrl;
    private int bedrooms;

    public ResidentialProperty(String id, String title, String location, double price,
                               String description, String imageUrl, int bedrooms) {
        super(id, title, location, price);
        this.description = description;
        this.imageUrl = imageUrl;
        this.bedrooms = bedrooms;
    }

    // Getters and setters
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public int getBedrooms() { return bedrooms; }
    public void setBedrooms(int bedrooms) { this.bedrooms = bedrooms; }

    // Parse pipe-delimited string: id|title|location|price|description|imageUrl|bedrooms
    public static ResidentialProperty fromFileString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length != 7) {
            throw new IllegalArgumentException("Invalid residential property format: " + line);
        }
        return new ResidentialProperty(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]),
                parts[4], parts[5], Integer.parseInt(parts[6]));
    }

    // Convert to pipe-delimited string for saving
    @Override
    public String toFileString() {
        return super.toFileString() + "|" + description + "|" + imageUrl + "|" + bedrooms;
    }

    @Override
    public String toString() {
        return "ResidentialProperty{" +
                "id='" + getId() + '\'' +
                ", title='" + getTitle() + '\'' +
                ", location='" + getLocation() + '\'' +
                ", price=" + getPrice() +
                ", description='" + description + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", bedrooms=" + bedrooms +
                '}';
    }
}