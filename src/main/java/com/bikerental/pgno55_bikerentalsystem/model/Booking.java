package com.bikerental.pgno55_bikerentalsystem.model;

public interface Booking {
    String getBookingId();
    String getUserId();
    String getBikeId();
    String getType();
    String getTime();
    double calculatePrice();
    String getDetails();
}
