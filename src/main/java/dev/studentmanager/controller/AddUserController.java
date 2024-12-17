package dev.studentmanager.controller;

import dev.studentmanager.dao.UserDAO;
import dev.studentmanager.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Điều khiển quá trình thêm người dùng mới. Servlet này xử lý các yêu cầu GET
 * và POST để thêm người dùng vào hệ thống. Khi nhận yêu cầu GET, nó chuyển
 * hướng đến trang add-user.jsp. Khi nhận yêu cầu POST, nó xử lý dữ liệu từ biểu
 * mẫu, tạo đối tượng User, và lưu vào cơ sở dữ liệu.
 *
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebServlet("/adduser")
public class AddUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý yêu cầu GET. Chuyển hướng yêu cầu đến trang add-user.jsp.
     *
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất xảy ra trong quá trình xử
     *                          lý yêu cầu.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang JSP để hiển thị form thêm người dùng
        request.getRequestDispatcher("/WEB-INF/views/add-user.jsp")
                .forward(request, response);
    }

    /**
     * Xử lý yêu cầu POST. Xử lý dữ liệu biểu mẫu, tạo đối tượng User và thêm
     * vào cơ sở dữ liệu. Nếu người dùng được thêm thành công, chuyển hướng đến
     * trang chủ; nếu thất bại, hiển thị lỗi.
     *
     * @param request  Đối tượng HTTP request chứa dữ liệu biểu mẫu.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất xảy ra trong quá trình xử
     *                          lý yêu cầu.
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ yêu cầu
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        // ID của role từ form
        String roleId = request.getParameter("roleId");

        // Tạo đối tượng User từ dữ liệu biểu mẫu
        User user = new User(username, password, fullName, email,
                Integer.parseInt(roleId));
        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.addUser(user);

        if (success) {
            // Nếu thêm người dùng thành công, chuyển hướng đến trang chủ
            response.sendRedirect("home");
        } else {
            // Nếu thêm người dùng thất bại, hiển thị thông báo lỗi và hiển thị
            // lại form
            request.setAttribute("error", "Thêm người dùng thất bại!");
            request.getRequestDispatcher("/WEB-INF/views/add-user.jsp")
                    .forward(request, response);
        }
    }
}
