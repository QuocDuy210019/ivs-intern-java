package dev.studentmanager.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dev.studentmanager.dao.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * DeleteParentServlet
 *
 * @version  1.0 17 Dec 2024
 * @author   Doan Manh Chien
 */
@WebServlet("/parent/delete")
public class DeleteParentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý các yêu cầu POST để xóa Parent.
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String parentId = request.getParameter("Id");

        if (parentId != null && !parentId.trim().isEmpty()) {
            String query = "DELETE FROM parent WHERE Id = ?";

            try (Connection connection = DatabaseConnection.getConnection();
                    PreparedStatement ps = connection.prepareStatement(query)) {

                ps.setString(1, parentId);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    request.getSession().setAttribute("message",
                            "Parent deleted successfully.");
                } else {
                    request.getSession().setAttribute("message",
                            "Failed to delete parent. Parent may not exist.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("message",
                        "An error occurred while deleting the parent.");
            }
        } else {
            request.getSession().setAttribute("message", "Invalid parent ID.");
        }

        // Chuyển hướng trở lại trang parent list
        response.sendRedirect("/student_manager/parent/list");
    }
}
