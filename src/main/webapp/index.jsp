<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bike Sharing Application | Premium Rental Experience</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
            <style>
                :root {
                    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    --glass-bg: rgba(255, 255, 255, 0.9);
                    --glass-border: rgba(255, 255, 255, 0.2);
                }

                body {
                    background: #f8f9fa;
                    font-family: 'Inter', system-ui, -apple-system, sans-serif;
                    color: #2d3436;
                    min-height: 100vh;
                }

                .hero-section {
                    background: var(--primary-gradient);
                    padding: 100px 0 150px 0;
                    color: white;
                    clip-path: ellipse(150% 100% at 50% 0%);
                }

                .main-container {
                    margin-top: -80px;
                    padding-bottom: 50px;
                }

                .feature-card {
                    background: var(--glass-bg);
                    backdrop-filter: blur(10px);
                    border: 1px solid var(--glass-border);
                    border-radius: 20px;
                    padding: 30px;
                    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                    height: 100%;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                }

                .feature-card:hover {
                    transform: translateY(-10px);
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                    background: #ffffff;
                }

                .icon-box {
                    width: 70px;
                    height: 70px;
                    background: var(--primary-gradient);
                    border-radius: 18px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-bottom: 20px;
                    color: white;
                    font-size: 30px;
                    box-shadow: 0 10px 20px rgba(118, 75, 162, 0.3);
                }

                .btn-premium {
                    background: var(--primary-gradient);
                    border: none;
                    color: white;
                    padding: 12px 30px;
                    border-radius: 12px;
                    font-weight: 600;
                    transition: all 0.3s;
                    width: 100%;
                    margin-top: auto;
                }

                .btn-premium:hover {
                    opacity: 0.9;
                    transform: scale(1.02);
                    color: white;
                    box-shadow: 0 5px 15px rgba(118, 75, 162, 0.4);
                }

                .section-title {
                    font-weight: 800;
                    margin-bottom: 40px;
                    position: relative;
                    display: inline-block;
                }

                .section-title::after {
                    content: '';
                    position: absolute;
                    bottom: -10px;
                    left: 0;
                    width: 50%;
                    height: 4px;
                    background: var(--primary-gradient);
                    border-radius: 2px;
                }

                .nav-link {
                    font-weight: 600;
                    color: #2d3436;
                }

                .admin-badge {
                    font-size: 10px;
                    background: #ff7675;
                    color: white;
                    padding: 2px 8px;
                    border-radius: 20px;
                    vertical-align: middle;
                    margin-left: 5px;
                }
            </style>
        </head>

        <body>

            <!-- Hero Section -->
            <header class="hero-section text-center">
                <div class="container">
                    <h1 class="display-3 fw-bold mb-3">Bike Sharing <span class="text-warning">Pro</span></h1>
                    <p class="lead mb-0">Experience the future of urban mobility with our premium rental system.</p>
                </div>
            </header>

            <!-- Main Content -->
            <main class="container main-container">

                <!-- Public Access & Auth -->
                <div class="row mb-5">
                    <div class="col-12">
                        <h2 class="section-title">Get Started</h2>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="icon-box"><i class="bi bi-person-plus"></i></div>
                            <h3>Registration</h3>
                            <p class="text-muted">Join our community and start riding today with quick sign-up.</p>
                            <a href="register.jsp" class="btn btn-premium">Register Now</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="icon-box"><i class="bi bi-box-arrow-in-right"></i></div>
                            <h3>Secure Login</h3>
                            <p class="text-muted">Access your account and manage your active rentals.</p>
                            <a href="login" class="btn btn-premium">Login</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="icon-box"><i class="bi bi-bicycle"></i></div>
                            <h3>Our Fleet</h3>
                            <p class="text-muted">Browse our wide range of electric and regular bikes.</p>
                            <a href="bikes?action=view" class="btn btn-premium">View Bikes</a>
                        </div>
                    </div>
                </div>

                <!-- Bookings & Services -->
                <div class="row mb-5">
                    <div class="col-12">
                        <h2 class="section-title">Services</h2>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="feature-card" style="flex-direction: row; text-align: left;">
                            <div class="icon-box me-4" style="flex-shrink: 0;"><i class="bi bi-calendar-check"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h4>New Booking</h4>
                                <p class="text-muted">Reserve a bike for a quick ride or a long-term rental.</p>
                                <a href="booking" class="btn btn-premium" style="width: auto;">Book Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="feature-card" style="flex-direction: row; text-align: left;">
                            <div class="icon-box me-4" style="flex-shrink: 0;"><i class="bi bi-clock-history"></i></div>
                            <div class="flex-grow-1">
                                <h4>Booking History</h4>
                                <p class="text-muted">View and manage all your past and upcoming reservations.</p>
                                <a href="AllBookings.jsp" class="btn btn-premium" style="width: auto;">View All</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Account & Management -->
                <div class="row mb-5">
                    <div class="col-12">
                        <h2 class="section-title">Management</h2>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="feature-card">
                            <div class="icon-box"><i class="bi bi-person-vcard"></i></div>
                            <h5>User Profile</h5>
                            <a href="user-management?action=profile" class="btn btn-premium btn-sm">My Account</a>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="feature-card border-warning">
                            <div class="icon-box bg-warning"><i class="bi bi-gear"></i></div>
                            <h5>User Admin <span class="admin-badge">Admin</span></h5>
                            <a href="user-management?action=list" class="btn btn-premium btn-sm">Manage Users</a>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="feature-card border-warning">
                            <div class="icon-box bg-warning"><i class="bi bi-journal-text"></i></div>
                            <h5>Activity Logs <span class="admin-badge">Admin</span></h5>
                            <a href="admin/viewActivityLog.jsp" class="btn btn-premium btn-sm">View Logs</a>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="feature-card border-warning">
                            <div class="icon-box bg-warning"><i class="bi bi-plus-circle"></i></div>
                            <h5>Inventory <span class="admin-badge">Admin</span></h5>
                            <a href="bikes?action=add" class="btn btn-premium btn-sm">Add New Bike</a>
                        </div>
                    </div>
                </div>

            </main>

            <!-- Footer -->
            <footer class="text-center py-4 bg-white border-top mt-5">
                <p class="text-muted mb-0">&copy; 2026 Bike Sharing Application. All rights reserved.</p>
            </footer>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>