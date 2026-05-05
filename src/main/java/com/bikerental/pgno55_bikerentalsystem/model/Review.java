package com.bikerental.pgno55_bikerentalsystem.model;

import java.time.LocalDateTime;

public class Review {
    private int reviewId;
    private String bikeId;
    private int rating;
    private String text;
    private LocalDateTime timestamp;

    public Review() {
        this.timestamp = LocalDateTime.now();
    }

    public Review(int reviewId, String bikeId, int rating, String text) {
        this.reviewId = reviewId;
        this.bikeId = bikeId;
        this.rating = rating;
        this.text = text;
        this.timestamp = LocalDateTime.now();
    }

    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
    public String getBikeId() { return bikeId; }
    public void setBikeId(String bikeId) { this.bikeId = bikeId; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    public String getText() { return text; }
    public void setText(String text) { this.text = text; }
    public LocalDateTime getTimestamp() { return timestamp; }
    public void setTimestamp(LocalDateTime timestamp) { this.timestamp = timestamp; }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId=" + reviewId +
                ", bikeId='" + bikeId + '\'' +
                ", rating=" + rating +
                ", text='" + text + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
