package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Điều khiển quá trình đăng xuất của người dùng. Servlet này xử lý yêu cầu GET
 * để hủy session của người dùng và chuyển hướng về trang đăng nhập.
 * 
 * @version 1.0
 * @author Nguyen Chi Nhan,Huynh Thi Thanh Thuy, Nguyen Quoc Duy
 */
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý yêu cầu GET. Hủy session của người dùng và chuyển hướng về trang
     * đăng nhập.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Hủy session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // Chuyển hướng về trang login, sử dụng đường dẫn tuyệt đối
        response.sendRedirect("/student_manager/login");
    }
}
