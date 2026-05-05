<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Bike | Bike Sharing Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --glass-bg: rgba(255, 255, 255, 0.95);
        }

        body {
            background: #f0f2f5;
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
        }

        .navbar-premium {
            background: var(--primary-gradient);
            padding: 1rem 0;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .card-premium {
            background: var(--glass-bg);
            border: none;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .card-header-premium {
            background: var(--primary-gradient);
            color: white;
            padding: 2rem;
            text-align: center;
            border: none;
        }

        .form-label {
            font-weight: 600;
            color: #4a5568;
        }

        .form-control, .form-select {
            padding: 0.75rem 1rem;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
        }

        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn-premium {
            background: var(--primary-gradient);
            border: none;
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-premium:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(118, 75, 162, 0.3);
            color: white;
        }

        .input-icon-group {
            position: relative;
        }

        .input-icon-group i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
        }

        .input-icon-group input, .input-icon-group select {
            padding-left: 2.8rem;
        }

        .type-toggle-card {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 1rem;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
        }

        .type-toggle-card.active {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
            color: #667eea;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-premium mb-5">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
                <i class="bi bi-bicycle me-2"></i>Bike Sharing Pro
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="ms-auto d-flex gap-2">
                    <a href="${pageContext.request.contextPath}/bikes?action=view" class="btn btn-outline-light btn-sm rounded-pill px-3">
                        <i class="bi bi-list me-1"></i>View Inventory
                    </a>
                    <a href="${pageContext.request.contextPath}/user-management?action=list" class="btn btn-outline-light btn-sm rounded-pill px-3">
                        <i class="bi bi-people me-1"></i>Users
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/logs" class="btn btn-outline-light btn-sm rounded-pill px-3">
                        <i class="bi bi-journal-text me-1"></i>Logs
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card card-premium">
                    <div class="card-header-premium">
                        <h2 class="mb-1">Add New Bike</h2>
                        <p class="mb-0 opacity-75">Expand your fleet with premium quality bikes</p>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show rounded-3 mb-4" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/bikes" method="post">
                            <input type="hidden" name="action" value="add">
                            
                            <!-- Bike ID -->
                            <div class="mb-4">
                                <label for="bikeId" class="form-label">Bike Identifier (Unique)</label>
                                <div class="input-icon-group">
                                    <i class="bi bi-hash"></i>
                                    <input type="text" class="form-control" id="bikeId" name="bikeId" placeholder="e.g. B-101" required>
                                </div>
                            </div>

                            <!-- Bike Type Selector -->
                            <div class="mb-4">
                                <label class="form-label d-block mb-3">Select Bike Category</label>
                                <div class="row g-3">
                                    <div class="col-6">
                                        <div class="type-toggle-card active" onclick="setBikeType('Regular')">
                                            <i class="bi bi-bicycle fs-4 d-block mb-1"></i>
                                            <span class="fw-bold">Regular</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="type-toggle-card" onclick="setBikeType('Electric')">
                                            <i class="bi bi-lightning-charge fs-4 d-block mb-1"></i>
                                            <span class="fw-bold">Electric</span>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="bikeType" name="bikeType" value="Regular">
                            </div>

                            <!-- Location -->
                            <div class="mb-4">
                                <label for="location" class="form-label">Station Location</label>
                                <div class="input-icon-group">
                                    <i class="bi bi-geo-alt"></i>
                                    <input type="text" class="form-control" id="location" name="location" placeholder="e.g. Central Park North" required>
                                </div>
                            </div>

                            <!-- Price Per Hour -->
                            <div class="mb-4">
                                <label for="pricePerHour" class="form-label">Price per Hour ($)</label>
                                <div class="input-icon-group">
                                    <i class="bi bi-currency-dollar"></i>
                                    <input type="number" step="0.01" class="form-control" id="pricePerHour" name="pricePerHour" placeholder="0.00" required>
                                </div>
                            </div>

                            <!-- Conditional Fields: Battery Range -->
                            <div id="electricFields" class="mb-4" style="display: none;">
                                <label for="batteryRange" class="form-label">Battery Range (Kilometers)</label>
                                <div class="input-icon-group">
                                    <i class="bi bi-battery-half"></i>
                                    <input type="number" class="form-control" id="batteryRange" name="batteryRange" placeholder="e.g. 50">
                                </div>
                            </div>

                            <!-- Conditional Fields: Gear Type -->
                            <div id="regularFields" class="mb-4">
                                <label for="gearType" class="form-label">Gear Configuration</label>
                                <div class="input-icon-group">
                                    <i class="bi bi-gear-wide-connected"></i>
                                    <input type="text" class="form-control" id="gearType" name="gearType" placeholder="e.g. 7-Speed Shimano" required>
                                </div>
                            </div>

                            <!-- Availability -->
                            <div class="mb-4">
                                <div class="form-check form-switch p-0 ms-0">
                                    <div class="d-flex align-items-center justify-content-between bg-light p-3 rounded-3 border">
                                        <div>
                                            <label class="form-check-label fw-bold" for="isAvailable">Set as Available</label>
                                            <p class="small text-muted mb-0">Immediately list this bike for rentals</p>
                                        </div>
                                        <input class="form-check-input ms-0 fs-4" type="checkbox" id="isAvailable" name="isAvailable" value="true" checked>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-premium w-100 py-3">
                                <i class="bi bi-plus-lg me-2"></i>Register Bike in System
                            </button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function setBikeType(type) {
            document.getElementById('bikeType').value = type;
            
            // Toggle visual classes
            const cards = document.querySelectorAll('.type-toggle-card');
            cards.forEach(card => card.classList.remove('active'));
            event.currentTarget.classList.add('active');

            // Toggle field visibility
            const electricFields = document.getElementById('electricFields');
            const regularFields = document.getElementById('regularFields');
            const batteryInput = document.getElementById('batteryRange');
            const gearInput = document.getElementById('gearType');

            if (type === 'Electric') {
                electricFields.style.display = 'block';
                regularFields.style.display = 'none';
                batteryInput.required = true;
                gearInput.required = false;
            } else {
                electricFields.style.display = 'none';
                regularFields.style.display = 'block';
                batteryInput.required = false;
                gearInput.required = true;
            }
        }
    </script>
</body>
</html>