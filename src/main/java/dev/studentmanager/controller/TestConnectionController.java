package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dev.studentmanager.dao.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Servlet kiểm tra kết nối đến cơ sở dữ liệu MySQL.
 * Servlet này xử lý yêu cầu GET và kiểm tra kết nối đến cơ sở dữ liệu.
 * Nếu kết nối thành công, thông báo sẽ được gửi đến người dùng; nếu thất bại, thông báo lỗi sẽ được hiển thị.
 *
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebServlet("/testConnection")
public class TestConnectionController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý yêu cầu GET. Kiểm tra kết nối đến cơ sở dữ liệu MySQL và gửi thông báo đến người dùng.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất xảy ra trong quá trình xử lý yêu cầu.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try (Connection connection = DatabaseConnection.getConnection()) {
            response.getWriter().println("Kết nối đến MySQL thành công!");
        } catch (SQLException e) {
            response.getWriter().println("Kết nối thất bại: " + e.getMessage());
        }
    }
}
