package dev.studentmanager.controller;

import dev.studentmanager.dao.DatabaseConnection;
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

/**
* AddParentServlet
*
* @version  1.0 17 Dec 2024
* @author   Doan Manh Chien
*/
@WebServlet("/parent/new")
public class AddParentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý các yêu cầu POST để thêm bản ghi Parent.
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        // Lấy lại các tham số yêu cầu
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
        int jasTypeId = Integer.parseInt(request.getParameter("JasTypeId"));
        String jasNo = request.getParameter("JasNo");
        int visaTypeId = Integer.parseInt(request.getParameter("VisaTypeId"));
        String visaNo = request.getParameter("VisaNo");

        String visaExpiryDate = request.getParameter("VisaExpiryDate");
        String formattedVisaExpiryDate = null;

        // Format VisaExpiryDate
        try {
            formattedVisaExpiryDate = formatDate(visaExpiryDate);
        } catch (ParseException e) {
            response.getWriter()
                    .println("Error: Invalid date format for VisaExpiryDate.");
            return;
        }

        String residenceZip = request.getParameter("ResidenceZip");
        String residenceAddress1 = request.getParameter("ResidenceAddress1");
        String residenceAddress2 = request.getParameter("ResidenceAddress2");
        String mailingZip = request.getParameter("MailingZip");
        String mailingAddress1 = request.getParameter("MailingAddress1");
        String mailingAddress2 = request.getParameter("MailingAddress2");
        String residencePhone = request.getParameter("ResidencePhone");
        String cellPhone = request.getParameter("CellPhone");
        String email = request.getParameter("Email");

        // Format Birthday
        String birthday = request.getParameter("Birthday");
        String formattedBirthday = null;
        if (birthday != null && !birthday.trim().isEmpty()) {
            try {
                formattedBirthday = formatDate(birthday);
            } catch (ParseException e) {
                response.getWriter()
                        .println("Error: Invalid date format for Birthday.");
                return;
            }
        }

        String passportNo = request.getParameter("PassportNo");

        Integer nationalityId = parseNullableInt(
                request.getParameter("NationalityId"));
        Integer companyId = parseNullableInt(request.getParameter("CompanyId"));

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

        // Câu Sql INSERT để thêm dữ liệu vào database
        String sql = "INSERT INTO parent (ParentSurNameEnglish, ParentFirstNameEnglish, ParentSurNameKanji, "
                + "ParentFirstNameKanji, ParentSurNameKana, ParentFirstNameKana, JrcoNo, JasTypeId, JasNo, VisaTypeId, "
                + "VisaNo, VisaExpiryDate, ResidenceZip, ResidenceAddress1, ResidenceAddress2, MailingZip, MailingAddress1, "
                + "MailingAddress2, ResidencePhone, CellPhone, Email, Birthday, PassportNo, NationalityId, CompanyId, "
                + "SpouseSurNameEnglish, SpouseFirstNameEnglish, SpouseSurNameKanji, SpouseFirstNameKanji, SpouseSurNameKana, "
                + "SpouseFirstNameKana, SiblingsName1, SiblingsName2, SiblingsName3, SiblingsName4) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql,
                        PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Set values trong PreparedStatement
            setStatementValues(statement, parentSurNameEnglish,
                    parentFirstNameEnglish, parentSurNameKanji,
                    parentFirstNameKanji, parentSurNameKana,
                    parentFirstNameKana, jrcoNo, jasTypeId, jasNo, visaTypeId,
                    visaNo, formattedVisaExpiryDate, residenceZip,
                    residenceAddress1, residenceAddress2, mailingZip,
                    mailingAddress1, mailingAddress2, residencePhone, cellPhone,
                    email, formattedBirthday, passportNo, nationalityId,
                    companyId, spouseSurNameEnglish, spouseFirstNameEnglish,
                    spouseSurNameKanji, spouseFirstNameKanji, spouseSurNameKana,
                    spouseFirstNameKana, siblingsName1, siblingsName2,
                    siblingsName3, siblingsName4);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    int newId = rs.getInt(1);
                    HttpSession session = request.getSession();
                    session.setAttribute("successMessage",
                            "New parent information has been created successfully.");
                    response.sendRedirect("parentdetails?Id=" + newId);
                }
            } else {
                response.getWriter().write("Failed to add record.");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    /**
     * Đặt giá trị cho PreparedStatement, xử lý giá trị null.
     */
    private void setStatementValues(PreparedStatement statement,
            Object... values) throws SQLException {
        for (int i = 0; i < values.length; i++) {
            if (values[i] == null) {
                statement.setNull(i + 1, java.sql.Types.VARCHAR);
            } else {
                statement.setObject(i + 1, values[i]);
            }
        }
    }

    /**
     * Định dạng ngày từ "dd/MM/yyyy" thành "yyyy-MM-dd".
     */
    private String formatDate(String inputDate) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = inputFormat.parse(inputDate);
        return outputFormat.format(date);
    }

    /**
     * Phân tích giá trị số nguyên có thể chấp nhận giá trị null từ một chuỗi.
     */
    private Integer parseNullableInt(String value) {
        return (value != null && !value.trim().isEmpty())
                ? Integer.parseInt(value)
                : null;
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        StringBuilder jasTypeDropdown = new StringBuilder();
        StringBuilder visaTypeDropdown = new StringBuilder();
        StringBuilder nationalityDropdown = new StringBuilder();
        StringBuilder companyDropdown = new StringBuilder();

        // Kết nối với cơ sở dữ liệu.
        try (Connection connection = DatabaseConnection.getConnection()) {

            // Tạo danh sách thả xuống cho jas_type
            String jasTypeQuery = "SELECT * FROM jas_type";
            try (PreparedStatement jasStmt = connection
                    .prepareStatement(jasTypeQuery);
                    ResultSet rs = jasStmt.executeQuery()) {
                while (rs.next()) {
                    jasTypeDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\">")
                            .append(rs.getString("Name")).append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho visa_type
            String visaTypeQuery = "SELECT * FROM visa_type";
            try (PreparedStatement visaStmt = connection
                    .prepareStatement(visaTypeQuery);
                    ResultSet rs = visaStmt.executeQuery()) {
                while (rs.next()) {
                    visaTypeDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\">")
                            .append(rs.getString("Name")).append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho nationality.
            String nationalityQuery = "SELECT * FROM nationality";
            try (PreparedStatement naStmt = connection
                    .prepareStatement(nationalityQuery);
                    ResultSet rs = naStmt.executeQuery()) {
                while (rs.next()) {
                    nationalityDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\">")
                            .append(rs.getString("Name")).append("</option>");
                }
            }

            // Tạo danh sách thả xuống cho company.
            String companyQuery = "SELECT * FROM company";
            try (PreparedStatement comStmt = connection
                    .prepareStatement(companyQuery);
                    ResultSet rs = comStmt.executeQuery()) {
                while (rs.next()) {
                    companyDropdown.append("<option value=\"")
                            .append(rs.getInt("Id")).append("\">")
                            .append(rs.getString("Name")).append("</option>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đặt thuộc tính thả xuống cho trang JSP.
        request.setAttribute("jasTypeDropdown", jasTypeDropdown.toString());
        request.setAttribute("visaTypeDropdown", visaTypeDropdown.toString());
        request.setAttribute("nationalityDropdown",
                nationalityDropdown.toString());
        request.setAttribute("companyDropdown", companyDropdown.toString());

        // Chuyển tiếp đến parent.jsp
        request.getRequestDispatcher("/WEB-INF/views/parent/new-parent.jsp").forward(request, response);
    }
}
