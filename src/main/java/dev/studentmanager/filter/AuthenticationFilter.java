package dev.studentmanager.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;
import java.util.HashSet;

/**
 * Bộ lọc xác thực người dùng. Servlet filter này kiểm tra yêu cầu HTTP và xác
 * thực người dùng trước khi truy cập vào các URL yêu cầu đăng nhập. Nó sẽ kiểm
 * tra phiên người dùng và nếu phiên hết hạn hoặc người dùng chưa đăng nhập, sẽ
 * chuyển hướng người dùng về trang đăng nhập.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final Set<String> PUBLIC_URLS = new HashSet<>();
    private static final Set<String> PROTECTED_URLS = new HashSet<>();

    static {
        // Danh sách các URL không yêu cầu đăng nhập
        PUBLIC_URLS.add("/login");
        PUBLIC_URLS.add("/assets/");
        PUBLIC_URLS.add("/testConnection");

        // Danh sách các URL yêu cầu đăng nhập
        PROTECTED_URLS.add("/logout");
        PROTECTED_URLS.add("/home");
        PROTECTED_URLS.add("/student/new/step1");
        PROTECTED_URLS.add("/student/new/step2");
        PROTECTED_URLS.add("/student/new/step3");
        PROTECTED_URLS.add("/student/list");
        PROTECTED_URLS.add("/parent/new");
        PROTECTED_URLS.add("/parent/list");
        PROTECTED_URLS.add("/adduser");
    }

    /**
     * Xử lý yêu cầu HTTP. Kiểm tra và xác thực quyền truy cập vào các URL yêu
     * cầu đăng nhập.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @param chain    Bộ lọc tiếp theo trong chuỗi bộ lọc.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     * @throws ServletException Nếu có lỗi trong quá trình xử lý servlet.
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Lấy URI của yêu cầu
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String relativeURI = requestURI.substring(contextPath.length());

        // Mặc định chạy web form login sẽ hiển thị đầu tiên
        if (relativeURI.equals("/") || relativeURI.equals("")) {
            // Chuyển hướng về trang login nếu URL là gốc
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        // Nếu là URL không yêu cầu đăng nhập, tiếp tục xử lý
        if (PUBLIC_URLS.stream().anyMatch(relativeURI::startsWith)) {
            chain.doFilter(request, response);
            return;
        }

        // Nếu là URL yêu cầu đăng nhập, kiểm tra session
        if (PROTECTED_URLS.stream().anyMatch(relativeURI::startsWith)) {
            HttpSession session = httpRequest.getSession(false);
            if (session == null || session.getAttribute("username") == null) {
                // Chuyển hướng về trang login nếu chưa đăng nhập
                httpResponse.sendRedirect(contextPath + "/login");
                return;
            }

            // KIỂM TRA THỜI GIAN HẾT HẠN CỦA PHIÊN
            // Thời điểm session được truy cập lần cuối
            long lastAccessedTime = session.getLastAccessedTime();
            // Thời điểm hiện tại (tính bằng millisecond)
            long currentTime = System.currentTimeMillis();
            // Timeout của session (từ giây sang millisecond)
            long sessionTimeout = session.getMaxInactiveInterval() * 1000;

            // Kiểm tra nếu thời gian không hoạt động vượt quá session timeout
            if ((currentTime - lastAccessedTime) > sessionTimeout) {
                session.invalidate(); // Hủy session
                // Chuyển hướng người dùng đến trang login
                httpResponse.sendRedirect(contextPath + "/login");
                return;
            }
        } else {
            // Nếu URL không tồn tại trong danh sách hợp lệ, trả về lỗi 404
            httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "Trang không tồn tại");
            return;
        }

        // Tiếp tục xử lý request nếu hợp lệ
        chain.doFilter(request, response);
    }

    /**
     * Khởi tạo bộ lọc. Phương thức này không cần thực hiện thêm hành động gì
     * trong trường hợp này.
     * 
     * @param filterConfig Cấu hình của bộ lọc.
     * @throws ServletException Nếu có lỗi trong quá trình khởi tạo bộ lọc.
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Không cần khởi tạo thêm
    }

    /**
     * Hủy bộ lọc. Phương thức này không cần thực hiện thêm hành động gì trong
     * trường hợp này.
     */
    @Override
    public void destroy() {
        // Không cần hủy tài nguyên
    }
}
