<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bikerental.pgno55_bikerentalsystem.model.Booking" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Booking Confirmation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <% Booking booking = (Booking) request.getAttribute("booking"); %>
  <% if (booking != null) { %>
  <div class="card shadow-sm p-4 mb-4">
    <h2 class="text-success"><i class="bi bi-check-circle-fill"></i> Booking Confirmed</h2>
    <hr>
    <div class="booking-details">
        <%= booking.getDetails() %>
    </div>
    <div class="mt-4">
        <a href="${pageContext.request.contextPath}/bookingHistory?userId=<%= booking.getUserId() %>" class="btn btn-primary">View My Bookings</a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary">Back to Home</a>
    </div>
  </div>
  <% } else if (request.getAttribute("bookings") != null) { %>
  <h2>Booking History</h2>
  <% List<Booking> bookings = (List<Booking>) request.getAttribute("bookings"); %>
  <% if (bookings != null && !bookings.isEmpty()) { %>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>Booking ID</th>
      <th>Type</th>
      <th>Bike ID</th>
      <th>Time</th>
      <th>Details</th>
      <th>Price</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Booking b : bookings) { %>
    <tr>
      <td><%= b.getBookingId() %></td>
      <td><%= b.getType() %></td>
      <td><%= b.getBikeId() %></td>
      <td><%= b.getTime() %></td>
      <td><%= b.getDetails() %></td>
      <td>Rs.<%= String.format("%.2f", b.calculatePrice()) %></td>
      <td>
        <a href="${pageContext.request.contextPath}/booking?action=edit&bookingId=<%= b.getBookingId() %>" class="btn btn-sm btn-warning">Edit</a>
        <form action="${pageContext.request.contextPath}/booking" method="post" style="display:inline;">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>">
          <button type="submit" class="btn btn-sm btn-danger">Cancel</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } else { %>
  <p>No bookings found.</p>
  <% } %>
  <% } else { %>
  <div class="alert alert-danger" role="alert">
    <h4 class="alert-heading">Processing Error</h4>
    <p>We encountered an issue while retrieving your booking details. This could be due to a session timeout or a server-side error.</p>
    <hr>
    <a href="${pageContext.request.contextPath}/booking" class="btn btn-primary">Return to Booking</a>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-link">Back to Home</a>
  </div>
  <% } %>
</div>
</body>
</html>