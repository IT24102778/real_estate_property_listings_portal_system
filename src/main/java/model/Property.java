package model;

public class Property {
    protected String id;
    protected String title;
    protected String location;
    protected double price;
    protected String description;

    public String getImageUrl() {
        return imagePath;
    }

    public void setImageUrl(String imagePath) {
        this.imagePath = imagePath;
    }

    protected String imagePath;


    public Property(String id, String title, String location, double price, String description,String imagePath) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.price = price;
        this.description = description;
        this.imagePath=imagePath;
    }

    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getLocation() { return location; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }

    public void setTitle(String title) { this.title = title; }
    public void setLocation(String location) { this.location = location; }
    public void setPrice(double price) { this.price = price; }
    public void setDescription(String description) { this.description = description; }

    public String toFileString() {
        return id + "|" + title + "|" + location + "|" + price + "|" + description+"|"+ imagePath;
    }

    public static Property fromFileString(String line) {
        String[] parts = line.split("\\|");
        return new Property(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4],parts[5]);
    }
}
