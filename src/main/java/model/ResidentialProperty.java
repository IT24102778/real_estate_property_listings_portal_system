package model;

public class ResidentialProperty extends Property {
    private int bedrooms;

    public ResidentialProperty(String id, String title, String location, double price, String description, String imagePath,int bedrooms) {
        super(id, title, location, price,description, imagePath);
        this.bedrooms = bedrooms;
    }

    public int getBedrooms() { return bedrooms; }

    @Override
    public String toFileString() {
        return super.toFileString() + "|" + bedrooms;
    }

    public static ResidentialProperty fromFileString(String line) {
        String[] parts = line.split("\\|");
        return new ResidentialProperty(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4],parts[5], Integer.parseInt(parts[6]));
    }
}
