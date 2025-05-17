package com.util;

import com.model.Property;
import com.model.ResidentialProperty;
import java.util.List;

public class PropertyQuickSort {
    public static void quickSort(List<Property> properties, String sortBy, String sortOrder) {
        quickSort(properties, 0, properties.size() - 1, sortBy, sortOrder);
    }

    private static void quickSort(List<Property> properties, int low, int high, String sortBy, String sortOrder) {
        if (low < high) {
            int pi = partition(properties, low, high, sortBy, sortOrder);
            quickSort(properties, low, pi - 1, sortBy, sortOrder);
            quickSort(properties, pi + 1, high, sortBy, sortOrder);
        }
    }

    private static int partition(List<Property> properties, int low, int high, String sortBy, String sortOrder) {
        Property pivot = properties.get(high);
        int i = low - 1;

        for (int j = low; j < high; j++) {
            boolean shouldSwap = false;
            Property current = properties.get(j);

            if ("price".equals(sortBy)) {
                int comparison = Double.compare(current.getPrice(), pivot.getPrice());
                shouldSwap = "desc".equals(sortOrder) ? comparison > 0 : comparison <= 0;
            } else if ("bedrooms".equals(sortBy)) {
                // Only compare bedrooms if both are ResidentialProperty
                if (current instanceof ResidentialProperty && pivot instanceof ResidentialProperty) {
                    int comparison = Integer.compare(
                            ((ResidentialProperty) current).getBedrooms(),
                            ((ResidentialProperty) pivot).getBedrooms()
                    );
                    shouldSwap = "desc".equals(sortOrder) ? comparison > 0 : comparison <= 0;
                } else {
                    int currentBedrooms = (current instanceof ResidentialProperty) ? ((ResidentialProperty) current).getBedrooms() : 0;
                    int pivotBedrooms = (pivot instanceof ResidentialProperty) ? ((ResidentialProperty) pivot).getBedrooms() : 0;
                    int comparison = Integer.compare(currentBedrooms, pivotBedrooms);
                    shouldSwap = "desc".equals(sortOrder) ? comparison > 0 : comparison <= 0;
                }
            }

            if (shouldSwap) {
                i++;
                swap(properties, i, j);
            }
        }

        swap(properties, i + 1, high);
        return i + 1;
    }

    private static void swap(List<Property> properties, int i, int j) {
        Property temp = properties.get(i);
        properties.set(i, properties.get(j));
        properties.set(j, temp);
    }
}