package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Điều khiển quá trình định tuyến các yêu cầu liên quan đến sinh viên. Servlet
 * này xử lý các yêu cầu GET dựa trên các đường dẫn con và chuyển hướng đến các
 * trang JSP tương ứng. Cụ thể: - /student/new/step1: Hiển thị trang tạo sinh
 * viên bước 1. - /student/new/step2: Hiển thị trang tạo sinh viên bước 2. -
 * /student/new/step3: Hiển thị trang tạo sinh viên bước 3. - /student/list:
 * Hiển thị danh sách sinh viên.
 *
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
@WebServlet("/student/*")
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý yêu cầu GET. Kiểm tra đường dẫn và phân biệt các hành động liên
     * quan đến sinh viên.
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
        String path = request.getPathInfo(); // Lấy phần sau "/student" từ URL

        // Dựa trên đường dẫn (path), điều hướng yêu cầu đến phương thức xử lý
        // phù hợp
        switch (path) {
        case "/new/step1":
            handleNewStudentStep1(request, response); // Xử lý bước 1 trong tạo
                                                      // mới sinh viên
            break;
        case "/new/step2":
            handleNewStudentStep2(request, response); // Xử lý bước 2 trong tạo
                                                      // mới sinh viên
            break;
        case "/new/step3":
            handleNewStudentStep3(request, response); // Xử lý bước 3 trong tạo
                                                      // mới sinh viên
            break;
        case "/list":
            handleListStudent(request, response); // Xử lý yêu cầu liệt kê sinh
                                                  // viên
            break;
        default:
            // Nếu không tìm thấy endpoint, trả về lỗi 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "Endpoint not found");
        }
    }

    /**
     * Điều hướng yêu cầu đến trang tạo sinh viên mới, bước 1.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    private void handleNewStudentStep1(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang tạo sinh viên bước 1
        request.getRequestDispatcher(
                "/WEB-INF/views/student/new-student-step-1.jsp")
                .forward(request, response);
    }

    /**
     * Điều hướng yêu cầu đến trang tạo sinh viên mới, bước 2.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    private void handleNewStudentStep2(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang tạo sinh viên bước 2
        request.getRequestDispatcher(
                "/WEB-INF/views/student/new-student-step-2.jsp")
                .forward(request, response);
    }

    /**
     * Điều hướng yêu cầu đến trang tạo sinh viên mới, bước 3.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    private void handleNewStudentStep3(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang tạo sinh viên bước 3
        request.getRequestDispatcher(
                "/WEB-INF/views/student/new-student-step-3.jsp")
                .forward(request, response);
    }

    /**
     * Điều hướng yêu cầu đến trang liệt kê danh sách sinh viên.
     * 
     * @param request  Đối tượng HTTP request.
     * @param response Đối tượng HTTP response.
     * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
     * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu
     *                          cầu.
     */
    private void handleListStudent(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang liệt kê sinh viên
        request.getRequestDispatcher("/WEB-INF/views/student/student-list.jsp")
                .forward(request, response);
    }
}
