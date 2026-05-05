package com.bikerental.pgno55_bikerentalsystem.dao;

import com.bikerental.pgno55_bikerentalsystem.model.Review;
import jakarta.servlet.ServletContext;

import java.io.*;
import java.time.LocalDateTime;
import java.util.*;

public class ReviewDAO {
    private final String filePath;

    public ReviewDAO(ServletContext context) {
        this.filePath = context.getRealPath("/WEB-INF/data/reviews.txt");
        initializeFile();
    }

    private void initializeFile() {
        File file = new File(filePath);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return reviews;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4) {
                    reviews.add(new Review(
                            Integer.parseInt(parts[0]),
                            parts[1],
                            Integer.parseInt(parts[2]),
                            parts[3]
                    ));
                }
            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public void addReview(Review review) throws IOException {
        List<Review> reviews = getAllReviews();
        int newId = reviews.isEmpty() ? 1 : reviews.get(reviews.size() - 1).getReviewId() + 1;
        review.setReviewId(newId);
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(String.format("%d,%s,%d,%s",
                    review.getReviewId(),
                    review.getBikeId(),
                    review.getRating(),
                    review.getText().replace(",", ";")));
            writer.newLine();
        }
    }

    public void deleteReview(int reviewId) throws IOException {
        List<Review> reviews = getAllReviews();
        reviews.removeIf(r -> r.getReviewId() == reviewId);
        saveAll(reviews);
    }

    private void saveAll(List<Review> reviews) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Review review : reviews) {
                writer.write(String.format("%d,%s,%d,%s",
                        review.getReviewId(),
                        review.getBikeId(),
                        review.getRating(),
                        review.getText().replace(",", ";")));
                writer.newLine();
            }
        }
    }
}
