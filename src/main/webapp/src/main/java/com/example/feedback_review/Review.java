package com.example.feedback_review;

public class Review {
    private String name;
    private String feedback;
    private int rating;
    private String userId;  // for identity verification

    public Review(String name, String feedback, int rating, String userId) {
        this.name = name;
        this.feedback = feedback;
        this.rating = rating;
        this.userId = userId;
    }

    public String getName() { return name; }
    public String getFeedback() { return feedback; }
    public int getRating() { return rating; }
    public String getUserId() { return userId; }

    public void setFeedback(String feedback) { this.feedback = feedback; }
    public void setRating(int rating) { this.rating = rating; }

    public String getUserid() { return userId; }

}
