package dev.studentmanager.dao;

import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * StudentDAO
 * 
 * This servlet handles operations related to student data such as adding,
 * updating, deleting students, retrieving student details, and pagination of
 * student lists.
 * @version 1.0 17 Dec 2024
 * @author Vo Hong Vu
 */
@WebServlet("/new_student_step1")
public class StudentDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests to display parent information.
     *
     * @param request  HttpServletRequest object
     * @param response HttpServletResponse object
     * @throws ServletException in case of servlet error
     * @throws IOException      in case of input/output error
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

       
        ArrayList<String[]> parentLists = new ArrayList<>();

        try { Connection connection = DatabaseConnection.getConnection();
            String query = "SELECT p.Id, p.ParentSurNameEnglish, p.ParentFirstNameEnglish, p.JrcoNo, "
                    + "p.JasNo, p.CompanyId, p.CellPhone, c.Name "
                    + "FROM parent p "
                    + "LEFT JOIN company c ON p.CompanyId = c.id";
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                String companyName = result.getString("Name");
                String[] parentList = {
                        result.getString("ParentFirstNameEnglish") + " "
                                + result.getString("ParentSurNameEnglish"),
                        result.getString("JrcoNo"), result.getString("JasNo"),
                        companyName, result.getString("CellPhone"),
                        result.getString("Id") };
                parentLists.add(parentList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("parentList", parentLists);
        request.setAttribute("activeMenu", "student");
        request.setAttribute("activeSubMenu", "new_student");
        request.getRequestDispatcher(
                "/WEB-INF/views/student/new_student_step1.jsp")
                .forward(request, response);
    }

    /**
     * Retrieves paginated student data.
     *
     * @param currentPage    the current page number
     * @param recordsPerPage the number of records per page
     * @return a list of students' data
     */
    public List<String[]> getStudentData(Integer currentPage,
            Integer recordsPerPage) {
        List<String[]> resultStudentList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder(
                """
                        SELECT stu.StudentNo, CONCAT(stu.SurNameEnglish, ' ', stu.FirstNameEnglish) AS FullName,
                        ads.Name AS AdmissionSchool, adg.Name AS AdmissionGrade, stu.GlobalClass, stu.Gender, stu.AdmissionDate
                        FROM student stu
                        LEFT JOIN admission_school ads ON stu.AdmissionSchool = ads.Id
                        LEFT JOIN admission_grade adg ON stu.AdmissionGrade = adg.Id
                        """);

        if (currentPage != null && recordsPerPage != null) {
            queryBuilder.append(" LIMIT ? OFFSET ?");
        }

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn
                        .prepareStatement(queryBuilder.toString())) {

            if (currentPage != null && recordsPerPage != null) {
                int offset = (currentPage - 1) * recordsPerPage;
                stmt.setInt(1, recordsPerPage);
                stmt.setInt(2, offset);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String studentNo = String.valueOf(rs.getInt("StudentNo"));
                    String fullName = rs.getString("FullName").toUpperCase();
                    String admissionSchool = rs.getString("AdmissionSchool")
                            .toUpperCase();
                    String admissionGrade = rs.getString("AdmissionGrade")
                            .toUpperCase();
                    String globalClass = rs.getBoolean("GlobalClass") ? "GLOBAL"
                            : "";
                    String gender = rs.getString("Gender").toUpperCase();
                    String admissionDate = rs.getString("AdmissionDate");
                    String formattedAdmissionDate = "";

                    if (admissionDate != null) {
                        try {
                            SimpleDateFormat originalFormat = new SimpleDateFormat(
                                    "yyyy-MM-dd");
                            Date date = originalFormat.parse(admissionDate);
                            SimpleDateFormat newFormat = new SimpleDateFormat(
                                    "dd/MM/yyyy");
                            formattedAdmissionDate = newFormat.format(date);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    }

                    resultStudentList.add(new String[] { studentNo, fullName,
                            admissionSchool, admissionGrade, globalClass,
                            gender, admissionGrade, "", formattedAdmissionDate,
                            "" });
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultStudentList;
    }

    /**
     * Retrieves detailed student information by student number.
     *
     * @param studentNo the student number
     * @return an array containing the student's details
     */
    public String[] getStudentDetails(String studentNo) {
        String[] studentDetails = null;
        String query = """
                SELECT stu.StudentNo, stu.ApplicationDate, '', stu.AdmissionDate,
                ads.Name AS AdmissionSchool, IF(stu.GlobalClass, 'Yes', 'No') AS GlobalClass,
                adg.Name AS AdmissionGrade, adg.Name AS AdmissionGradeDuplicate, '', '',
                stu.SurNameEnglish, stu.FirstNameEnglish, stu.SurNameKanji, stu.FirstNameKanji,
                stu.SurNameKana, stu.FirstNameKana, stu.Birthday, stu.Gender,
                la.Name AS LanguageAbility, stu.InternalTransferDate,
                na1.Name AS Nationality1, na2.Name AS Nationality2,
                stu.PassportNo, visa.Name AS VisaType, stu.VisaNo, stu.VisaExpiryDate,
                stu.PreviousSchoolName, stu.PreviousSchoolAddress, stu.TelephoneNo, stu.OfficeRemark,
                stu.Giro, stu.Document,
                CONCAT(par.ParentSurNameEnglish, ' ', par.ParentFirstNameEnglish) AS ParentNameEnglish,
                CONCAT(par.ParentSurNameKana, ' ', par.ParentFirstNameKana) AS ParentNameKana,
                CONCAT(par.ResidenceAddress1, ', ', par.ResidenceAddress2) AS ResidenceAddress,
                com.Name AS CompanyName, par.JrcoNo, par.JasNo
                FROM student stu
                LEFT JOIN admission_school ads ON stu.AdmissionSchool = ads.Id
                LEFT JOIN admission_grade adg ON stu.AdmissionGrade = adg.Id
                LEFT JOIN language_ability la ON stu.LanguageAbility = la.Id
                LEFT JOIN nationality na1 ON stu.Nationality1 = na1.Id
                LEFT JOIN nationality na2 ON stu.Nationality2 = na2.Id
                LEFT JOIN visa_type visa ON stu.VisaType = visa.Id
                LEFT JOIN parent par ON par.Id = stu.ParentId
                LEFT JOIN company com ON par.CompanyId = com.Id
                WHERE stu.StudentNo = ?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, studentNo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int columnCount = rs.getMetaData().getColumnCount();
                    studentDetails = new String[columnCount];
                    for (int i = 0; i < columnCount; i++) {
                        studentDetails[i] = rs.getString(i + 1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentDetails;
    }

    /**
     * Retrieves the total number of students.
     *
     * @return the total number of students
     */
    public int getTotalStudents() {
        String query = "SELECT COUNT(*) AS TotalStudents FROM student";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("TotalStudents");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Retrieves the total number of parents.
     *
     * @return the total number of parents
     */
    public int getTotalParents() {
        String query = "SELECT COUNT(*) AS TotalParents FROM parent";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("TotalParents");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Deletes a student by their student number.
     *
     * @param studentNo the student number
     * @return true if the student was deleted successfully, otherwise false
     */
    public boolean deleteStudentByNo(String studentNo) {
        String query = "DELETE FROM student WHERE StudentNo = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, studentNo);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Updates a student's information.
     *
     * @param studentNo               the student number
     * @param surNameEnglish          the student's surname in English
     * @param firstNameEnglish        the student's first name in English
     * @param surNameKanji            the student's surname in Kanji
     * @param firstNameKanji          the student's first name in Kanji
     * @param surNameKana             the student's surname in Kana
     * @param firstNameKana           the student's first name in Kana
     * @param formattedBirthday       the student's birthday in a formatted
     *                                string
     * @param gender                  the student's gender
     * @param languageAbilityId       the ID of the student's language ability
     * @param internalTransferDate    the date of internal transfer
     * @param nationality1            the ID of the student's nationality 1
     * @param nationality2            the ID of the student's nationality 2
     * @param passportNo              the student's passport number
     * @param visaTypeId              the ID of the student's visa type
     * @param visaNo                  the student's visa number
     * @param formattedVisaExpiryDate the student's visa expiry date
     * @param previousSchoolName      the student's previous school name
     * @param telephoneNo             the student's telephone number
     * @param previousSchoolAddress   the student's previous school address
     * @param officeRemark            any office remark for the student
     * @param giroValue               the giro value
     * @param document                any relevant document for the student
     * @return true if the student was updated successfully, otherwise false
     */
    public boolean updateStudent(String studentNo, String surNameEnglish,
            String firstNameEnglish, String surNameKanji, String firstNameKanji,
            String surNameKana, String firstNameKana, String formattedBirthday,
            String gender, int languageAbilityId, String internalTransferDate,
            Integer nationality1, Integer nationality2, String passportNo,
            int visaTypeId, String visaNo, String formattedVisaExpiryDate,
            String previousSchoolName, String telephoneNo,
            String previousSchoolAddress, String officeRemark, String giroValue,
            String document) {

        String query = """
                UPDATE student
                SET SurNameEnglish = ?, FirstNameEnglish = ?, SurNameKanji = ?, FirstNameKanji = ?, SurNameKana = ?,
                FirstNameKana = ?, Birthday = ?, Gender = ?, LanguageAbility = ?, InternalTransferDate = ?,
                Nationality1 = ?, Nationality2 = ?, PassportNo = ?, VisaType = ?, VisaNo = ?, VisaExpiryDate = ?,
                PreviousSchoolName = ?, TelephoneNo = ?, PreviousSchoolAddress = ?, OfficeRemark = ?, Giro = ?, Document = ?
                WHERE StudentNo = ?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, surNameEnglish);
            stmt.setString(2, firstNameEnglish);
            stmt.setString(3, surNameKanji);
            stmt.setString(4, firstNameKanji);
            stmt.setString(5, surNameKana);
            stmt.setString(6, firstNameKana);
            stmt.setString(7, formattedBirthday);
            stmt.setString(8, gender);
            stmt.setInt(9, languageAbilityId);
            stmt.setString(10, internalTransferDate);

            if (nationality1 != null) {
                stmt.setInt(11, nationality1);
            } else {
                stmt.setNull(11, java.sql.Types.INTEGER);
            }

            if (nationality2 != null) {
                stmt.setInt(12, nationality2);
            } else {
                stmt.setNull(12, java.sql.Types.INTEGER);
            }

            stmt.setString(13, passportNo);
            stmt.setInt(14, visaTypeId);
            stmt.setString(15, visaNo);
            stmt.setString(16, formattedVisaExpiryDate);
            stmt.setString(17, previousSchoolName);
            stmt.setString(18, telephoneNo);
            stmt.setString(19, previousSchoolAddress);
            stmt.setString(20, officeRemark);
            stmt.setString(21, giroValue);
            stmt.setString(22, document);
            stmt.setString(23, studentNo);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Adds a new student to the database.
     *
     * @param applicationDate       the application date
     * @param admissionDate         the admission date
     * @param admissionSchool       the ID of the admission school
     * @param admissionGrade        the ID of the admission grade
     * @param surNameEnglish        the student's surname in English
     * @param firstNameEnglish      the student's first name in English
     * @param surNameKanji          the student's surname in Kanji
     * @param firstNameKanji        the student's first name in Kanji
     * @param surNameKana           the student's surname in Kana
     * @param firstNameKana         the student's first name in Kana
     * @param birthday              the student's birthday
     * @param gender                the student's gender
     * @param languageAbility       the student's language ability ID
     * @param internalTransferDate  the student's internal transfer date
     * @param nationality1          the student's nationality 1 ID
     * @param nationality2          the student's nationality 2 ID
     * @param passportNo            the student's passport number
     * @param visaType              the student's visa type ID
     * @param visaNo                the student's visa number
     * @param visaExpiryDate        the student's visa expiry date
     * @param previousSchoolName    the student's previous school name
     * @param telephoneNo           the student's telephone number
     * @param previousSchoolAddress the student's previous school address
     * @param officeRemark          any office remarks for the student
     * @param giroValue             the student's giro value
     * @param document              any document associated with the student
     * @param ParentId              the ID of the student's parent
     * @return true if the student was added successfully, otherwise false
     */
    public boolean addStudent(String applicationDate, String admissionDate,
            int admissionSchool, int admissionGrade, String surNameEnglish,
            String firstNameEnglish, String surNameKanji, String firstNameKanji,
            String surNameKana, String firstNameKana, String birthday,
            String gender, int languageAbility, String internalTransferDate,
            int nationality1, int nationality2, String passportNo, int visaType,
            String visaNo, String visaExpiryDate, String previousSchoolName,
            String telephoneNo, String previousSchoolAddress,
            String officeRemark, String giroValue, String document,
            int ParentId) {

        System.out.println("DAO đã được gọi");

        String query = """
                INSERT INTO student (
                    ApplicationDate, AdmissionDate, AdmissionSchool, AdmissionGrade, SurNameEnglish, FirstNameEnglish,
                    SurNameKanji, FirstNameKanji, SurNameKana, FirstNameKana, Birthday, Gender, LanguageAbility,
                    InternalTransferDate, Nationality1, Nationality2, PassportNo, VisaType, VisaNo, VisaExpiryDate,
                    PreviousSchoolName, TelephoneNo, PreviousSchoolAddress, OfficeRemark, Giro, Document, ParentId
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, applicationDate);
            stmt.setString(2, admissionDate);
            stmt.setInt(3, admissionSchool);
            stmt.setInt(4, admissionGrade);
            stmt.setString(5, surNameEnglish);
            stmt.setString(6, firstNameEnglish);
            stmt.setString(7, surNameKanji);
            stmt.setString(8, firstNameKanji);
            stmt.setString(9, surNameKana);
            stmt.setString(10, firstNameKana);
            stmt.setString(11, birthday);
            stmt.setString(12, gender);
            stmt.setInt(13, languageAbility);
            stmt.setString(14, internalTransferDate);
            stmt.setInt(15, nationality1);
            stmt.setInt(16, nationality2);
            stmt.setString(17, passportNo);
            stmt.setInt(18, visaType);
            stmt.setString(19, visaNo);
            stmt.setString(20, visaExpiryDate);
            stmt.setString(21, previousSchoolName);
            stmt.setString(22, telephoneNo);
            stmt.setString(23, previousSchoolAddress);
            stmt.setString(24, officeRemark);
            stmt.setString(25, giroValue);
            stmt.setString(26, document);
            stmt.setInt(27, ParentId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Retrieves the latest student number.
     *
     * @return the latest student number
     */
    public int getLatestStudentNo() {
        String sql = "SELECT StudentNo FROM student ORDER BY StudentNo DESC LIMIT 1";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("StudentNo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
