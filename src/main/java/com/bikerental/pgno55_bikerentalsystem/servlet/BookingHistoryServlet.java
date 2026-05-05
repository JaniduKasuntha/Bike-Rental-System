package com.bikerental.pgno55_bikerentalsystem.servlet;

import com.bikerental.pgno55_bikerentalsystem.dao.BookingManager;
import com.bikerental.pgno55_bikerentalsystem.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import java.util.stream.Collectors;

@WebServlet("/bookingHistory")
public class BookingHistoryServlet extends HttpServlet {
    private BookingManager bookingManager;

    @Override
    public void init() throws ServletException {
        bookingManager = new BookingManager(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get search parameter if exists
        String userId = request.getParameter("userId");

        List<Booking> bookings;
        if (userId != null && !userId.isEmpty()) {
            // Search for bookings by userId
            bookings = bookingManager.readBookings().stream()
                    .filter(b -> b.getUserId() != null && b.getUserId().equals(userId))
                    .collect(Collectors.toList());
            System.out.println("Searching for userId: " + userId + ", found " + bookings.size() + " bookings");
        } else {
            // Get all bookings
            bookings = bookingManager.readBookings();
            System.out.println("No search parameter, total bookings: " + bookings.size());
        }

        if (bookings == null) {
            System.out.println("Bookings list is null from BookingManager.readBookings()");
        }
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/AllBookings.jsp").forward(request, response);
    }
}
