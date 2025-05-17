package com.util;

import com.model.Property;

public class PropertyBST {
    private Node root;

    private class Node {
        Property property;
        Node left, right;

        public Node(Property property) {
            this.property = property;
        }
    }

    public void insert(Property property) {
        root = insert(root, property);
    }

    private Node insert(Node node, Property property) {
        if (node == null) {
            return new Node(property);
        }

        if (property.getTitle().compareToIgnoreCase(node.property.getTitle()) < 0) {
            node.left = insert(node.left, property);
        } else if (property.getTitle().compareToIgnoreCase(node.property.getTitle()) > 0) {
            node.right = insert(node.right, property);
        }

        return node;
    }

    public Property search(String title) {
        return search(root, title);
    }

    private Property search(Node node, String title) {
        if (node == null) {
            return null;
        }

        int cmp = title.compareToIgnoreCase(node.property.getTitle());
        if (cmp < 0) {
            return search(node.left, title);
        } else if (cmp > 0) {
            return search(node.right, title);
        } else {
            return node.property;
        }
    }

    public void inOrderTraversal(java.util.List<Property> result) {
        inOrderTraversal(root, result);
    }

    private void inOrderTraversal(Node node, java.util.List<Property> result) {
        if (node != null) {
            inOrderTraversal(node.left, result);
            result.add(node.property);
            inOrderTraversal(node.right, result);
        }
    }
}