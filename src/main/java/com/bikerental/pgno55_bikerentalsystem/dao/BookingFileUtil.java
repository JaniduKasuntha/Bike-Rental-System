package com.bikerental.pgno55_bikerentalsystem.dao;

import com.bikerental.pgno55_bikerentalsystem.model.Booking;
import com.bikerental.pgno55_bikerentalsystem.model.RideBooking;
import com.bikerental.pgno55_bikerentalsystem.model.RentalBooking;
import jakarta.servlet.ServletContext;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BookingFileUtil {
    private final String filePath;
    private final ServletContext context;

    public BookingFileUtil(ServletContext context) {
        this.context = context;
        this.filePath = context.getRealPath("/WEB-INF/data/bookings.txt");
        initializeFile();
    }

    private void initializeFile() {
        File file = new File(filePath);
        File directory = file.getParentFile();
        if (directory != null && !directory.exists()) {
            directory.mkdirs();
        }
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException("Failed to create bookings file: " + e.getMessage(), e);
            }
        }
    }

    public void writeBooking(Booking booking) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(booking.getBookingId() + "," + booking.getUserId() + "," + booking.getBikeId() + "," +
                    booking.getType() + "," + booking.getTime() + "," +
                    (booking instanceof RideBooking ? ((RideBooking) booking).getDestination() + "," + ((RideBooking) booking).getDistanceKm() : ((RentalBooking) booking).getDurationHours()) + "," +
                    booking.calculatePrice());
            writer.newLine();
        } catch (IOException e) {
            throw new IOException("Failed to create booking due to file access issue: " + e.getMessage(), e);
        }
    }

    public List<Booking> readAllBookings() throws IOException {
        List<Booking> bookings = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return bookings;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split(",");
                if (parts.length < 7) continue;
                
                String bookingId = parts[0];
                String userId = parts[1];
                String bikeId = parts[2];
                String type = parts[3];
                String time = parts[4];
                if (type.equals("Ride")) {
                    String destination = parts[5];
                    double distanceKm = Double.parseDouble(parts[6]);
                    bookings.add(new RideBooking(bookingId, userId, bikeId, time, destination, distanceKm));
                } else {
                    int durationHours = Integer.parseInt(parts[5]);
                    bookings.add(new RentalBooking(bookingId, userId, bikeId, time, durationHours));
                }
            }
        } catch (IOException e) {
            throw new IOException("Failed to read all bookings due to file access issue: " + e.getMessage(), e);
        }
        return bookings;
    }

    public void updateBooking(Booking updatedBooking) throws IOException {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split(",");
                if (parts[0].equals(updatedBooking.getBookingId())) {
                    String newLine = updatedBooking.getBookingId() + "," + updatedBooking.getUserId() + "," +
                            updatedBooking.getBikeId() + "," + updatedBooking.getType() + "," +
                            updatedBooking.getTime() + "," +
                            (updatedBooking instanceof RideBooking ? ((RideBooking) updatedBooking).getDestination() + "," + ((RideBooking) updatedBooking).getDistanceKm() : ((RentalBooking) updatedBooking).getDurationHours()) + "," +
                            updatedBooking.calculatePrice();
                    lines.add(newLine);
                } else {
                    lines.add(line);
                }
            }
        } catch (IOException e) {
            throw new IOException("Failed to update booking due to file access issue: " + e.getMessage(), e);
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            throw new IOException("Failed to write updated booking due to file access issue: " + e.getMessage(), e);
        }
    }

    public void deleteBooking(String bookingId) throws IOException {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.startsWith(bookingId + ",")) {
                    lines.add(line);
                }
            }
        } catch (IOException e) {
            throw new IOException("Failed to delete booking due to file access issue: " + e.getMessage(), e);
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            throw new IOException("Failed to write after deleting booking due to file access issue: " + e.getMessage(), e);
        }
    }
}
