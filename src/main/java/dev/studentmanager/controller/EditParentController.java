package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import dev.studentmanager.dao.DatabaseConnection;

/**
 * UpdateParentServlet
 *
 * @version  1.0 17 Dec 2024
 * @author   Doan Manh Chien
 */
@WebServlet("/parent/parentedit")
public class EditParentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Xử lý các yêu cầu POST để cập nhật dữ liệu.
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        // Truy xuất và xác thực Parent ID.
        String parentIdParam = request.getParameter("Id");
        if (parentIdParam == null || parentIdParam.isEmpty()) {
            response.getWriter().write("Error: ParentId is required.");
            return;
        }
        int parentId = Integer.parseInt(parentIdParam);

        // Lấy tham số biểu mẫu.
        String parentSurNameEnglish = request
                .getParameter("ParentSurNameEnglish");
        String parentFirstNameEnglish = request
                .getParameter("ParentFirstNameEnglish");
        String parentSurNameKanji = request.getParameter("ParentSurNameKanji");
        String parentFirstNameKanji = request
                .getParameter("ParentFirstNameKanji");
        String parentSurNameKana = request.getParameter("ParentSurNameKana");
        String parentFirstNameKana = request
                .getParameter("ParentFirstNameKana");
        String jrcoNo = request.getParameter("JrcoNo");
        int jasTypeId = parseInteger(request.getParameter("JasTypeId"));
        String jasNo = request.getParameter("JasNo");
        int visaTypeId = parseInteger(request.getParameter("VisaTypeId"));
        String visaNo = request.getParameter("VisaNo");
        String visaExpiryDate = formatDate(
                request.getParameter("VisaExpiryDate"), response,
                "VisaExpiryDate");

        String residenceZip = request.getParameter("ResidenceZip");
        String residenceAddress1 = request.getParameter("ResidenceAddress1");
        String residenceAddress2 = request.getParameter("ResidenceAddress2");
        String mailingZip = request.getParameter("MailingZip");
        String mailingAddress1 = request.getParameter("MailingAddress1");
        String mailingAddress2 = request.getParameter("MailingAddress2");
        String residencePhone = request.getParameter("ResidencePhone");
        String cellPhone = request.getParameter("CellPhone");
        String email = request.getParameter("Email");

        String birthday = formatDate(request.getParameter("Birthday"), response,
                "Birthday");
        String passportNo = request.getParameter("PassportNo");

        Integer nationalityId = parseNullableInteger(
                request.getParameter("NationalityId"));
        Integer companyId = parseNullableInteger(
                request.getParameter("CompanyId"));

        String spouseSurNameEnglish = request
                .getParameter("SpouseSurNameEnglish");
        String spouseFirstNameEnglish = request
                .getParameter("SpouseFirstNameEnglish");
        String spouseSurNameKanji = request.getParameter("SpouseSurNameKanji");
        String spouseFirstNameKanji = request
                .getParameter("SpouseFirstNameKanji");
        String spouseSurNameKana = request.getParameter("SpouseSurNameKana");
        String spouseFirstNameKana = request
                .getParameter("SpouseFirstNameKana");

        String siblingsName1 = request.getParameter("SiblingsName1");
        String siblingsName2 = request.getParameter("SiblingsName2");
        String siblingsName3 = request.getParameter("SiblingsName3");
        String siblingsName4 = request.getParameter("SiblingsName4");

        // Truy vấn cập nhật SQL.
        String sql = "UPDATE parent SET ParentSurNameEnglish = ?, ParentFirstNameEnglish = ?, ParentSurNameKanji = ?, "
                + "ParentFirstNameKanji = ?, ParentSurNameKana = ?, ParentFirstNameKana = ?, JrcoNo = ?, JasTypeId = ?, "
                + "JasNo = ?, VisaTypeId = ?, VisaNo = ?, VisaExpiryDate = ?, ResidenceZip = ?, ResidenceAddress1 = ?, "
                + "ResidenceAddress2 = ?, MailingZip = ?, MailingAddress1 = ?, MailingAddress2 = ?, ResidencePhone = ?, "
                + "CellPhone = ?, Email = ?, Birthday = ?, PassportNo = ?, NationalityId = ?, CompanyId = ?, "
                + "SpouseSurNameEnglish = ?, SpouseFirstNameEnglish = ?, SpouseSurNameKanji = ?, SpouseFirstNameKanji = ?, "
                + "SpouseSurNameKana = ?, SpouseFirstNameKana = ?, SiblingsName1 = ?, SiblingsName2 = ?, SiblingsName3 = ?, "
                + "SiblingsName4 = ? WHERE Id = ?";

        // Thực hiện cập nhật.
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(sql)) {

            setStatementParameters(statement, parentSurNameEnglish,
                    parentFirstNameEnglish, parentSurNameKanji,
                    parentFirstNameKanji, parentSurNameKana,
                    parentFirstNameKana, jrcoNo, jasTypeId, jasNo, visaTypeId,
                    visaNo, visaExpiryDate, residenceZip, residenceAddress1,
                    residenceAddress2, mailingZip, mailingAddress1,
                    mailingAddress2, residencePhone, cellPhone, email, birthday,
                    passportNo, nationalityId, companyId, spouseSurNameEnglish,
                    spouseFirstNameEnglish, spouseSurNameKanji,
                    spouseFirstNameKanji, spouseSurNameKana,
                    spouseFirstNameKana, siblingsName1, siblingsName2,
                    siblingsName3, siblingsName4, parentId);

            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("successMessage",
                        "Parent information has been updated successfully.");
                response.sendRedirect("parentdetails?Id=" + parentId);
            } else {
                response.getWriter().write("Update failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    /**
     * Phân tích tham số số nguyên từ một chuỗi.
     */
    private int parseInteger(String value) {
        return (value != null && !value.trim().isEmpty())
                ? Integer.parseInt(value)
                : 0;
    }

    /**
     * Phân tích giá trị số nguyên có thể chấp nhận giá trị null từ một chuỗi.
     */
    private Integer parseNullableInteger(String value) {
        return (value != null && !value.trim().isEmpty())
                ? Integer.parseInt(value)
                : null;
    }

    /**
     * Định dạng ngày từ "dd/MM/yyyy" thành "yyyy-MM-dd".
     */
    private String formatDate(String inputDate, HttpServletResponse response,
            String fieldName) throws IOException {
        if (inputDate == null || inputDate.trim().isEmpty()) {
            return null;
        }
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = inputFormat.parse(inputDate);
            return outputFormat.format(date);
        } catch (ParseException e) {
            response.getWriter().println(
                    "Error: Invalid date format for " + fieldName + ".");
            return null;
        }
    }

    /**
     * Đặt giá trị cho PreparedStatement, xử lý giá trị null.
     */
    private void setStatementParameters(PreparedStatement statement,
            Object... values) throws SQLException {
        for (int i = 0; i < values.length; i++) {
            if (values[i] == null) {
                statement.setNull(i + 1, java.sql.Types.NULL);
            } else {
                statement.setObject(i + 1, values[i]);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        int parentId = Integer.parseInt(request.getParameter("Id"));
        String currentJasTypeId = "";
        String currentVisaTypeId = "";
        String currentNationalityId = "";
        String currentCompanyId = "";

        StringBuilder jasTypeDropdown = new StringBuilder();
        StringBuilder visaTypeDropdown = new StringBuilder();
        StringBuilder nationalityDropdown = new StringBuilder();
        StringBuilder companyDropdown = new StringBuilder();

        try (Connection connection = DatabaseConnection.getConnection()) {

            // Lấy lại hồ sơ parent để hiện tại.
            String parentQuery = "SELECT JasTypeId, VisaTypeId, NationalityId, CompanyId FROM parent WHERE Id = ?";
            try (PreparedStatement parentStmt = connection
                    .prepareStatement(parentQuery)) {
                parentStmt.setInt(1, parentId);
                ResultSet parentRs = parentStmt.executeQuery();
                if (parentRs.next()) {
                    currentJasTypeId = parentRs.getString("JasTypeId");
                    currentVisaTypeId = parentRs.getString("VisaTypeId");
                    currentNationalityId = parentRs
                            .getString("NationalityId") != null
                                    ? parentRs.getString("NationalityId")
                                    : "0";
                    currentCompanyId = parentRs.getString("CompanyId") != null
                            ? parentRs.getString("CompanyId")
                            : "0";
                }
            }

            // Tạo danh sách thả xuống cho jas_type.
            String jasTypeQuery = "SELECT * FROM jas_type";
            try (PreparedStatement jasStmt = connection
                    .prepareStatement(jasTypeQuery);
                    ResultSet rs = jasStmt.executeQuery()) {
                while (rs.next()) {
                    jasTypeDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\"")
                            .append(rs.getInt("Id") == Integer
                                    .parseInt(currentJasTypeId) ? " selected"
                                            : "")
                            .append(">").append(rs.getString("Name"))
                            .append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho visa_type.
            String visaTypeQuery = "SELECT * FROM visa_type";
            try (PreparedStatement visaStmt = connection
                    .prepareStatement(visaTypeQuery);
                    ResultSet rs = visaStmt.executeQuery()) {
                while (rs.next()) {
                    visaTypeDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\"")
                            .append(rs.getInt("Id") == Integer
                                    .parseInt(currentVisaTypeId) ? " selected"
                                            : "")
                            .append(">").append(rs.getString("Name"))
                            .append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho nationality.
            String nationalityQuery = "SELECT * FROM nationality";
            try (PreparedStatement naStmt = connection
                    .prepareStatement(nationalityQuery);
                    ResultSet rs = naStmt.executeQuery()) {
                while (rs.next()) {
                    nationalityDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\"")
                            .append(currentNationalityId.equals("0") ? ""
                                    : (rs.getInt("Id") == Integer
                                            .parseInt(currentNationalityId)
                                                    ? " selected"
                                                    : ""))
                            .append(">").append(rs.getString("Name"))
                            .append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho company.
            String companyQuery = "SELECT * FROM company";
            try (PreparedStatement compStmt = connection
                    .prepareStatement(companyQuery);
                    ResultSet rs = compStmt.executeQuery()) {
                while (rs.next()) {
                    companyDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\"")
                            .append(currentCompanyId.equals("0") ? ""
                                    : (rs.getInt("Id") == Integer
                                            .parseInt(currentCompanyId)
                                                    ? " selected"
                                                    : ""))
                            .append(">").append(rs.getString("Name"))
                            .append("</option>");
                }
            }

            // Đặt thuộc tính cho việc hiển thị JSP.
            request.setAttribute("jasTypeDropdown", jasTypeDropdown.toString());
            request.setAttribute("visaTypeDropdown",
                    visaTypeDropdown.toString());
            request.setAttribute("nationalityDropdown",
                    nationalityDropdown.toString());
            request.setAttribute("companyDropdown", companyDropdown.toString());

            // Chuyển tiếp đến trang JSP
            request.getRequestDispatcher("/WEB-INF/views/parent/parent-edit.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
