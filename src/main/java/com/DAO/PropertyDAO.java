package com.DAO;

import com.model.Property;
import com.model.ResidentialProperty;
import com.util.PropertyBST;
import com.util.PropertyQuickSort;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PropertyDAO {
    private final String filePath;
    private PropertyBST propertyBST;

    public PropertyDAO(String filePath) {
        this.filePath = filePath;
        this.propertyBST = new PropertyBST();
    }

    public List<Property> getAllProperties() throws IOException {
        List<Property> properties = new ArrayList<>();
        File file = new File(filePath);

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\|");
                    if (parts.length == 7) {
                        ResidentialProperty prop = ResidentialProperty.fromFileString(line);
                        properties.add(prop);
                        propertyBST.insert(prop);
                    } else if (parts.length == 4) {
                        Property prop = Property.fromFileString(line);
                        properties.add(prop);
                        propertyBST.insert(prop);
                    }
                }
            }
        }
        return properties;
    }

    public void saveProperties(List<Property> properties) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Property property : properties) {
                writer.write(property.toFileString());
                writer.newLine();
            }
        }
    }

    public List<Property> searchByTitle(String title) {
        List<Property> result = new ArrayList<>();
        propertyBST.inOrderTraversal(result);

        List<Property> searchResults = new ArrayList<>();
        for (Property prop : result) {
            if (prop.getTitle().toLowerCase().contains(title.toLowerCase())) {
                searchResults.add(prop);
            }
        }
        return searchResults;
    }

    public List<Property> sortByPrice(List<Property> properties) {
        // Call quickSort with sortBy="price" and sortOrder="asc" (or "desc" if preferred)
        PropertyQuickSort.quickSort(properties, "price", "asc");
        return properties;
    }
}