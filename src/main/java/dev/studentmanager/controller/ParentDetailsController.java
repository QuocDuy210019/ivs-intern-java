package dev.studentmanager.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dev.studentmanager.dao.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * ParentDetailsServlet
 *
 * @version  1.0 17 Dec 2024
 * @author   Doan Manh Chien
 */
@WebServlet("/parent/parentdetails")
public class ParentDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý các yêu cầu GET để hiển thị thông tin chi tiết về Parent và Student.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String parentId = request.getParameter("Id");

        if (parentId == null || parentId.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Invalid Parent ID.");
            response.sendRedirect("error.jsp");
            return;
        }

        // Lấy dữ liệu của student.
        List<String[]> resultStudentList = getStudentData(parentId);

        // Đặt thuộc tính cho việc hiển thị JSP.
        request.setAttribute("result_StudentList", resultStudentList);
        RequestDispatcher dispatcher = request
                .getRequestDispatcher("/WEB-INF/views/parent/parentdetails.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Truy xuất dữ liệu student được liên kết với ParentId.
     *
     * @param parentId ID của phụ huynh trong bảng parent.
     * @return Danh sách các mảng dữ liệu student.
     */
    public List<String[]> getStudentData(String parentId) {
        List<String[]> resultStudentList = new ArrayList<>();

        String query = """
                SELECT
                    s.StudentNo,
                    CONCAT(s.SurNameEnglish, ' ', s.FirstNameEnglish) AS FullName,
                    a.Name AS AdmissionSchool,
                    g.Name AS AdmissionGrade,
                    s.AdmissionDate
                FROM student s
                LEFT JOIN admission_school a ON s.AdmissionSchool = a.Id
                LEFT JOIN admission_grade g ON s.AdmissionGrade = g.Id
                WHERE s.ParentId = ?;
                """;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, parentId);

            try (ResultSet rs = stmt.executeQuery()) {
                SimpleDateFormat inputFormat = new SimpleDateFormat(
                        "yyyy-MM-dd");
                SimpleDateFormat outputFormat = new SimpleDateFormat(
                        "dd/MM/yyyy");

                while (rs.next()) {
                    String studentNo = String.valueOf(rs.getInt("StudentNo"));
                    String fullName = rs.getString("FullName");
                    String admissionSchool = rs.getString("AdmissionSchool");
                    String admissionGrade = rs.getString("AdmissionGrade");

                    // Format lại admission date.
                    String admissionDateRaw = rs.getString("AdmissionDate");
                    String formattedAdmissionDate = formatAdmissionDate(
                            admissionDateRaw, inputFormat, outputFormat);

                    // Thêm thông tin chi tiết của student vào trong result
                    // list.
                    resultStudentList.add(new String[] { studentNo, fullName,
                            admissionSchool, admissionGrade, "Not Assigned",
                            formattedAdmissionDate, "" });
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultStudentList;
    }

    /**
     * Định dạng ngày nhập học từ định dạng cơ sở dữ liệu sang định dạng hiển
     * thị.
     *
     * @param dateRaw      Chuỗi dateRaw.
     * @param inputFormat  Định dạng date đầu vào.
     * @param outputFormat Định dạng date đầu ra.
     * @return The formatted date string.
     */
    private String formatAdmissionDate(String dateRaw,
            SimpleDateFormat inputFormat, SimpleDateFormat outputFormat) {
        if (dateRaw == null || dateRaw.isEmpty()) {
            return "";
        }

        try {
            Date date = inputFormat.parse(dateRaw);
            return outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return dateRaw; // Trả về dateRaw nếu phân tích không thành công
        }
    }
}
