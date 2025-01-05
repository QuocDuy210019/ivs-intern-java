/*
 * package dev.studentmanager.controller;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * import java.io.IOException;
 * 
 *//**
	 * Điều khiển quá trình định tuyến các yêu cầu liên quan đến "Parent" (Phụ
	 * huynh). Servlet này xử lý các yêu cầu GET dựa trên các đường dẫn con và
	 * chuyển hướng đến các trang JSP tương ứng. Cụ thể: - /parent/new: Hiển thị
	 * form để tạo phụ huynh mới. - /parent/list: Hiển thị danh sách các phụ huynh.
	 * 
	 * @version 1.0 17 Dec 2024
	 * @author Nguyen Quoc Duy
	 */
/*
 * @WebServlet("/parent/*") public class ParentController extends HttpServlet {
 * private static final long serialVersionUID = 1L;
 * 
 *//**
	 * Xử lý yêu cầu GET. Kiểm tra đường dẫn được yêu cầu và định tuyến yêu cầu đến
	 * các phương thức xử lý khác nhau.
	 * 
	 * @param request  Đối tượng HTTP request.
	 * @param response Đối tượng HTTP response.
	 * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
	 * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu cầu.
	 */
/*
 * @Override protected void doGet(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException { String
 * path = request.getPathInfo(); // Lấy phần sau "/parent" từ URL
 * 
 * // Dựa trên đường dẫn (path), điều hướng yêu cầu đến phương thức xử lý // phù
 * hợp switch (path) { case "/new": // Xử lý yêu cầu tạo mới phụ huynh
 * handleNewParent(request, response); break;
 * 
 * case "/list": // Xử lý yêu cầu liệt kê phụ huynh handleListParent(request,
 * response); break;
 * 
 * default: // Nếu không tìm thấy endpoint, trả về lỗi 404
 * response.sendError(HttpServletResponse.SC_NOT_FOUND, "Endpoint not found"); }
 * }
 * 
 *//**
	 * Xử lý yêu cầu để tạo mới phụ huynh. Chuyển hướng người dùng đến trang JSP tạo
	 * mới phụ huynh.
	 * 
	 * @param request  Đối tượng HTTP request.
	 * @param response Đối tượng HTTP response.
	 * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
	 * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu cầu.
	 */
/*
 * private void handleNewParent(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { // Chuyển hướng đến trang
 * tạo mới phụ huynh
 * request.getRequestDispatcher("/WEB-INF/views/parent/new-parent.jsp")
 * .forward(request, response); }
 * 
 *//**
	 * Xử lý yêu cầu để liệt kê các phụ huynh. Chuyển hướng người dùng đến trang JSP
	 * liệt kê phụ huynh.
	 * 
	 * @param request  Đối tượng HTTP request.
	 * @param response Đối tượng HTTP response.
	 * @throws ServletException Nếu có lỗi xảy ra trong quá trình xử lý servlet.
	 * @throws IOException      Nếu có lỗi nhập/xuất trong quá trình xử lý yêu cầu.
	 *//*
		 * private void handleListParent(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { // Chuyển hướng đến trang
		 * liệt kê phụ huynh
		 * request.getRequestDispatcher("/WEB-INF/views/parent/parent-list.jsp")
		 * .forward(request, response); } }
		 */