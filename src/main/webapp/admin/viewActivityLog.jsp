<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bikerental.pgno55_bikerentalsystem.model.ActivityLog" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Activity Logs | Bike Sharing Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #1a2a6c 0%, #b21f1f 50%, #fdbb2d 100%);
            --glass-bg: rgba(255, 255, 255, 0.95);
        }

        body {
            background: #f8f9fa;
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
        }

        .navbar-premium {
            background: #1a1a1a;
            padding: 1rem 0;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .header-section {
            background: #1a1a1a;
            color: white;
            padding: 4rem 0;
            margin-bottom: -4rem;
        }

        .log-container {
            background: var(--glass-bg);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
        }

        .table thead th {
            background: #f1f5f9;
            color: #475569;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
            padding: 1rem;
            border: none;
        }

        .table tbody td {
            padding: 1.25rem 1rem;
            vertical-align: middle;
            color: #1e293b;
            border-bottom: 1px solid #f1f5f9;
        }

        .action-badge {
            padding: 0.4rem 0.8rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .badge-create { background: #dcfce7; color: #166534; }
        .badge-update { background: #fef9c3; color: #854d0e; }
        .badge-delete { background: #fee2e2; color: #991b1b; }
        .badge-system { background: #e0e7ff; color: #3730a3; }

        .user-avatar {
            width: 32px;
            height: 32px;
            background: #e2e8f0;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            color: #64748b;
            margin-right: 0.75rem;
        }

        .timestamp {
            font-family: 'Monaco', 'Consolas', monospace;
            font-size: 0.85rem;
            color: #64748b;
        }

        .details-text {
            max-width: 400px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: #475569;
        }

        .search-box {
            position: relative;
            margin-bottom: 2rem;
        }

        .search-box i {
            position: absolute;
            left: 1.25rem;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .search-box input {
            padding-left: 3rem;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            height: 50px;
        }

        .empty-state {
            padding: 5rem;
            text-align: center;
            color: #94a3b8;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark navbar-premium">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
                <i class="bi bi-bicycle me-2"></i>Bike Sharing Pro
            </a>
            <div class="ms-auto">
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-light btn-sm rounded-pill px-3">
                    <i class="bi bi-house me-1"></i> Dashboard
                </a>
            </div>
        </div>
    </nav>

    <div class="header-section text-center">
        <div class="container">
            <h1 class="display-5 fw-bold mb-2">Activity Logs</h1>
            <p class="lead opacity-75">Track every system event and administrative action</p>
        </div>
    </div>

    <div class="container pb-5">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                
                <div class="search-box">
                    <i class="bi bi-search"></i>
                    <input type="text" id="logSearch" class="form-control" placeholder="Search by user, action, or details...">
                </div>

                <div class="log-container">
                    <div class="table-responsive">
                        <table class="table mb-0" id="logsTable">
                            <thead>
                                <tr>
                                    <th style="width: 80px;">ID</th>
                                    <th style="width: 200px;">Timestamp</th>
                                    <th>Performed By</th>
                                    <th>Action</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<ActivityLog> logs = (List<ActivityLog>) request.getAttribute("logs");
                                    if (logs != null && !logs.isEmpty()) {
                                        for (ActivityLog log : logs) {
                                            String badgeClass = "badge-system";
                                            String action = log.getAction().toLowerCase();
                                            if (action.contains("create") || action.contains("add")) badgeClass = "badge-create";
                                            else if (action.contains("update") || action.contains("edit")) badgeClass = "badge-update";
                                            else if (action.contains("delete")) badgeClass = "badge-delete";
                                            
                                            String initial = log.getPerformedBy().substring(0, 1).toUpperCase();
                                %>
                                <tr>
                                    <td class="fw-bold text-muted">#<%= log.getId() %></td>
                                    <td class="timestamp"><%= log.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("MMM dd, HH:mm:ss")) %></td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="user-avatar"><%= initial %></div>
                                            <span class="fw-medium"><%= log.getPerformedBy() %></span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="action-badge <%= badgeClass %>"><%= log.getAction() %></span>
                                    </td>
                                    <td>
                                        <div class="details-text" title="<%= log.getDetails() %>">
                                            <%= log.getDetails() %>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="5" class="empty-state">
                                        <i class="bi bi-inbox fs-1 d-block mb-3"></i>
                                        <h5>No activities recorded yet</h5>
                                        <p class="mb-0">Logs will appear here once administrative actions are performed.</p>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-4 rounded-4 shadow-sm">
                        <i class="bi bi-exclamation-circle me-2"></i> ${error}
                    </div>
                </c:if>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('logSearch').addEventListener('keyup', function() {
            const value = this.value.toLowerCase();
            const rows = document.querySelectorAll('#logsTable tbody tr');
            
            rows.forEach(row => {
                if(row.classList.contains('empty-state')) return;
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(value) ? '' : 'none';
            });
        });
    </script>
</body>
</html>
