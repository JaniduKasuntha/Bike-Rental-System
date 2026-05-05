package com.bikerental.pgno55_bikerentalsystem.servlet;

import com.bikerental.pgno55_bikerentalsystem.dao.ActivityLogDAO;
import com.bikerental.pgno55_bikerentalsystem.model.AdminUser;
import com.bikerental.pgno55_bikerentalsystem.model.User;
import com.bikerental.pgno55_bikerentalsystem.model.ActivityLog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/logs")
public class ActivityLogServlet extends HttpServlet {
    private ActivityLogDAO activityLogDAO;

    @Override
    public void init() throws ServletException {
        activityLogDAO = new ActivityLogDAO(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !(user instanceof AdminUser)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            List<ActivityLog> logs = activityLogDAO.getAllLogs();
            request.setAttribute("logs", logs);
            request.getRequestDispatcher("/admin/viewActivityLog.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Failed to load activity logs: " + e.getMessage());
            request.getRequestDispatcher("/admin/viewActivityLog.jsp").forward(request, response);
        }
    }
}
