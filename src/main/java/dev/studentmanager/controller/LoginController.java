package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dev.studentmanager.dao.UserDAO;
import dev.studentmanager.model.User;

/**
 * Điều khiển quá trình đăng nhập của người dùng. Servlet này xử lý yêu cầu GET
 * và POST cho việc đăng nhập của người dùng. Nếu thông tin đăng nhập hợp lệ,
 * người dùng sẽ được chuyển đến trang chủ. Nếu thông tin không hợp lệ, một
 * thông báo lỗi sẽ được hiển thị.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    /**
     * Khởi tạo servlet và khởi tạo đối tượng UserDAO.
     * 
     * @throws ServletException Nếu có lỗi trong quá trình khởi tạo servlet.
     */
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(); // Khởi tạo UserDAO
    }

    /**
     * Xử lý yêu cầu GET. Hiển thị form đăng nhập.
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
        // Hiển thị form đăng nhập
        request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                .forward(request, response);
    }

    /**
     * Xử lý yêu cầu POST. Kiểm tra thông tin đăng nhập và xử lý các lỗi nếu có.
     * Nếu thông tin đăng nhập hợp lệ, chuyển hướng đến trang home.jsp. Nếu
     * thông tin sai, hiển thị thông báo lỗi.
     * 
     * @param request  Đối tượng HTTP request chứa dữ liệu form.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Biến để lưu lỗi của từng field
        String usernameError = null;
        String passwordError = null;

        // Kiểm tra xem user đã nhập username và password chưa
        if (username == null || username.trim().isEmpty()) {
            usernameError = "This field is required.";
        }

        if (password == null || password.trim().isEmpty()) {
            passwordError = "This field is required.";
        }

        // Nếu có lỗi, trả về form đăng nhập cùng với thông báo lỗi
        if (usernameError != null || passwordError != null) {
            request.setAttribute("usernameError", usernameError);
            request.setAttribute("passwordError", passwordError);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(request, response);
            return;
        }

        // Kiểm tra thông tin đăng nhập
        if (userDAO.validateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Lấy thông tin người dùng
            User user = userDAO.getUserDetails(username);
            if (user != null) {
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("roleName", user.getRoleName());
            }

            // Chuyển hướng đến trang home.jsp nếu login thành công
            response.sendRedirect("home");
        } else {
            // Thêm messageError vào request nếu thông tin đăng nhập sai
            request.setAttribute("errorMessage",
                    "Username or password is incorrect.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(request, response);
        }
    }
}
