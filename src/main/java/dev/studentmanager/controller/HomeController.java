package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession; // Dòng này bị chú thích lại nếu không sử dụng

import java.io.IOException;

/**
 * Điều khiển quá trình xử lý yêu cầu trang chủ. Servlet này xử lý yêu cầu GET
 * và chuyển hướng đến trang home.jsp.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý yêu cầu GET. Chuyển hướng yêu cầu đến trang home.jsp.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất xảy ra trong quá trình xử lý yêu cầu.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang JSP hiển thị trang chủ
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request,
                response);
    }
}
