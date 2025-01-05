package dev.studentmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dev.studentmanager.dao.DropdownOptionsDAO;
import dev.studentmanager.dao.ParentDAO;
import dev.studentmanager.dao.StudentDAO;
import dev.studentmanager.util.DateUtils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * StudentController
 * 
 * This servlet handles all requests related to student management, including
 * creating, updating, deleting, and listing students.
 * 
 * @version 1.0 17 Dec 2024
 * @author Vo Hong Vu
 */
@WebServlet("/student")
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final StudentDAO studentDAO = new StudentDAO(); // Khởi tạo DAO

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        // Ngăn bộ nhớ đệm trình duyệt
        response.setHeader("Cache-Control",
                "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        String step = request.getParameter("astudS03");

        String targetPage;
        String activeMenu = "student";
        String activeSubMenu = null;

        switch (step) {
        case "step1":
            targetPage = "/WEB-INF/views/student/new_student_step1.jsp";
            activeSubMenu = "new_student";
            break;
        case "step2":
            request.setAttribute("activeSubMenu", "new_student");
            targetPage = "/WEB-INF/views/student/new_student_step2.jsp";
            activeSubMenu = "new_student";
            break;
        case "step3":
            ParentDAO parentDAO = new ParentDAO();
            try {
                String selectParent = request.getParameter("selectParent");
                if (selectParent != null && !selectParent.isEmpty()) {
                    int parentId = Integer.parseInt(selectParent);
                    String[] parentDetailsArray = parentDAO
                            .getParentDetailsById(parentId);
                    request.setAttribute("parentDetailsArray",
                            parentDetailsArray);
                } else {
                    System.out.println("No parent selected.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Error fetching parent list");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.getWriter().write("Invalid parent ID");
            }
            targetPage = "/WEB-INF/views/student/new_student_step3.jsp";
            activeSubMenu = "new_student";
            break;
        case "student_list":
            int currentPage = 1;
            int recordsPerPage = 10; // Số bản ghi mỗi trang
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                try {
                    currentPage = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    currentPage = 1;
                    // Nếu tham số không hợp lệ thì quay về trang đầu
                }
            }

            int totalStudents = studentDAO.getTotalStudents();
            int totalPages = (int) Math
                    .ceil((double) totalStudents / recordsPerPage);

            // Kiểm tra nếu trang được yêu cầu không hợp lệ
            if (currentPage < 1 || currentPage > totalPages) {
                response.sendRedirect(request.getContextPath()
                        + "/student?astudS03=student_list");
                return;
            }

            // Lấy danh sách sinh viên cho trang hiện tại
            List<String[]> paginatedStudentList = studentDAO
                    .getStudentData(currentPage, recordsPerPage);

            // Thiết lập các thuộc tính để gửi tới JSP
            request.setAttribute("result_StudentList", paginatedStudentList);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalStudents", totalStudents);

            targetPage = "/WEB-INF/views/student/student_list.jsp";
            activeSubMenu = "student_list";
            break;

        case "student_detail":
            String studentNo = request.getParameter("studentNo");
            String[] studentDetails = studentDAO.getStudentDetails(studentNo);

            if (studentDetails == null) {
                // Nếu không tìm thấy sinh viên, chuyển hướng về trang
                // student_list
                response.sendRedirect(request.getContextPath()
                        + "/student?astudS03=student_list");
                return;
            }

            // Nếu tìm thấy, hiển thị chi tiết sinh viên
            request.setAttribute("studentDetails", studentDetails);
            targetPage = "/WEB-INF/views/student/student_details.jsp";
            activeSubMenu = "student_list";
            break;

        case "delete_student":
            String studentNoToDelete = request.getParameter("studentNo");
            boolean isDeleted = studentDAO.deleteStudentByNo(studentNoToDelete);

            if (isDeleted) {
                // Gán thông báo vào session
                String deleteMessage = "Student No: " + studentNoToDelete
                        + " was deleted.";
                request.getSession().setAttribute("deleteMessage",
                        deleteMessage);
                response.sendRedirect(request.getContextPath()
                        + "/student?astudS03=student_list");
                activeSubMenu = "student_list";
                return; // Thoát sớm để tránh lỗi
            } else {
                request.setAttribute("errorMessage",
                        "Failed to delete student.");
                targetPage = "/WEB-INF/views/student/student_details.jsp";
                activeSubMenu = "student_list";
            }
            break;

        case "edit_student":
            String studentNoToEdit = request.getParameter("studentNo");
            String[] studentDetailsToEdit = studentDAO
                    .getStudentDetails(studentNoToEdit);

            if (studentDetailsToEdit == null) {
                response.sendRedirect(request.getContextPath()
                        + "/student?astudS03=student_list");
                return;
            }
            request.setAttribute("studentDetails", studentDetailsToEdit);
            targetPage = "/WEB-INF/views/student/edit_student.jsp";

            activeSubMenu = "student_list";
            break;

        default:
            targetPage = "/errorPage.jsp";
            activeMenu = null;
        }
        request.setAttribute("activeMenu", activeMenu);
        request.setAttribute("activeSubMenu", activeSubMenu);
        request.getRequestDispatcher(targetPage).forward(request, response);
    }

    /**
     * Handles POST requests for saving or updating student data.
     *
     * @param request  HttpServletRequest object
     * @param response HttpServletResponse object
     * @throws IOException      in case of I/O errors
     * @throws ServletException in case of servlet errors
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String step = request.getParameter("astudS03");

        if ("save_student".equals(step)) {
            getData(request, response);
        }

        if ("update_student".equals(step)) {
            String studentNo = request.getParameter("StudentNo");
            String surNameEnglish = request.getParameter("SurNameEnglish");
            String firstNameEnglish = request.getParameter("FirstNameEnglish");

            String surNameKanji = request.getParameter("SurNameKanji");
            String firstNameKanji = request.getParameter("FirstNameKanji");

            String surNameKana = request.getParameter("SurNameKana");
            String firstNameKana = request.getParameter("FirstNameKana");

            String birthday = request.getParameter("Birthday");

            String gender = request.getParameter("Gender");

            String languageAbilityName = request
                    .getParameter("LanguageAbility");

            String internalTransferDate = request
                    .getParameter("InternalTransferDate");

            String nationality1Name = request.getParameter("Nationality1");
            String nationality2Name = request.getParameter("Nationality2");

            String passportNo = request.getParameter("PassportNo");

            String visaTypeName = request.getParameter("VisaType");

            String visaNo = request.getParameter("VisaNo");

            String visaExpiryDate = request.getParameter("VisaExpiryDate");

            String previousSchoolName = request
                    .getParameter("PreviousSchoolName");
            String telephoneNo = request.getParameter("TelephoneNo");
            String previousSchoolAddress = request
                    .getParameter("PreviousSchoolAddress");
            String officeRemark = request.getParameter("OfficeRemark");

            String giroValue = request.getParameter("Giro");

            // Lấy các giá trị checkbox từ form
            List<String> selectedDocuments = new ArrayList<>();

            if ("true".equals(request.getParameter("prevSchoolDocYroku"))) {
                selectedDocuments.add("Yoroku");
            }
            if ("true".equals(request.getParameter("prevSchoolDocHealth"))) {
                selectedDocuments.add("Doc Health");
            }
            if ("true".equals(request.getParameter("prevSchoolDocTeeth"))) {
                selectedDocuments.add("Doc Teeth");
            }
            if ("true".equals(request.getParameter("prevSchoolDocKyokasho"))) {
                selectedDocuments.add("Soshina");
            }
            if ("true".equals(request.getParameter("prevSchoolDocZaisho"))) {
                selectedDocuments.add("Zaisho");
            }

            // Chuyển đổi ngày từ dd/MM/yyyy sang yyyy-MM-dd String
            String formattedBirthday = DateUtils.parseDate(birthday);

            // Lấy ID của Language Ability từ tên ngôn ngữ
            DropdownOptionsDAO languageAbilityDAO = new DropdownOptionsDAO();
            int languageAbilityId = languageAbilityDAO
                    .getLanguageAbilityIdByName(languageAbilityName);

            String formattedInternalTransferDate = DateUtils
                    .parseDate(internalTransferDate);

            // Kiểm tra nếu giá trị rỗng thì đặt ID = 0 (hoặc giá trị NULL)
            Integer nationality1Id = null;
            if (nationality1Name != null
                    && !nationality1Name.trim().isEmpty()) {
                DropdownOptionsDAO nationality1DAO = new DropdownOptionsDAO();
                nationality1Id = nationality1DAO
                        .getNationalityIdByName(nationality1Name);
            }

            Integer nationality2Id = null;
            if (nationality2Name != null
                    && !nationality2Name.trim().isEmpty()) {
                DropdownOptionsDAO nationality2DAO = new DropdownOptionsDAO();
                nationality2Id = nationality2DAO
                        .getNationalityIdByName(nationality2Name);
            }

            // Lấy ID của visa từ tên
            DropdownOptionsDAO visaTypeDAO = new DropdownOptionsDAO();
            int visaTypeId = visaTypeDAO.getVisaTypeIdByName(visaTypeName);

            String formattedVisaExpiryDate = DateUtils
                    .parseDate(visaExpiryDate);

            // Ghép các giá trị checkbox thành chuỗi
            String document = String.join(", ", selectedDocuments);

            boolean hasError = false;

            // Xử lý giá trị null bằng cách gán chuỗi rỗng
            surNameEnglish = (surNameEnglish == null) ? ""
                    : surNameEnglish.trim();
            firstNameEnglish = (firstNameEnglish == null) ? ""
                    : firstNameEnglish.trim();
            surNameKanji = (surNameKanji == null) ? "" : surNameKanji.trim();
            firstNameKanji = (firstNameKanji == null) ? ""
                    : firstNameKanji.trim();
            birthday = (birthday == null) ? "" : birthday.trim();
            passportNo = (passportNo == null) ? "" : passportNo.trim();

            // Kiểm tra nếu Surname (English) để trống
            if (surNameEnglish.isEmpty()) {
                request.setAttribute("surnameError", "This field is required.");
                hasError = true;
            }

            // Kiểm tra nếu First Name (English) để trống
            if (firstNameEnglish.isEmpty()) {
                request.setAttribute("firstnameError",
                        "This field is required."); // Thông báo lỗi
                hasError = true;
            }

            // Kiểm tra nếu Surname (Kanji) để trống
            if (surNameKanji.isEmpty()) {
                request.setAttribute("surnameKanjiError",
                        "This field is required.");
                hasError = true;
            }

            // Kiểm tra nếu First Name (Kanji) để trống
            if (firstNameKanji.isEmpty()) {
                request.setAttribute("firstnameKanjiError",
                        "This field is required.");
                hasError = true;
            }

            // Kiểm tra nếu Birthday để trống
            if (birthday.isEmpty()) {
                request.setAttribute("birthdayError",
                        "This field is required.");
                hasError = true;
            } else {
                try {
                    // Chuyển đổi ngày từ chuỗi sang đối tượng LocalDate
                    SimpleDateFormat dateFormat = new SimpleDateFormat(
                            "dd/MM/yyyy");
                    Date parsedDate = dateFormat.parse(birthday);
                    Date currentDate = new Date(); // Ngày hiện tại

                    // Kiểm tra nếu ngày sinh lớn hơn ngày hiện tại
                    if (parsedDate.after(currentDate)) {
                        request.setAttribute("birthdayError",
                                "Birthday cannot be a future date.");
                        hasError = true;
                    }
                } catch (ParseException e) {
                    request.setAttribute("birthdayError",
                            "Invalid date format. Please use dd/MM/yyyy.");
                    hasError = true;
                }
            }

            // Kiểm tra nếu Passport No để trống
            if (passportNo.isEmpty()) {
                request.setAttribute("passportNoError",
                        "This field is required.");
                hasError = true;
            } else {
                // Kiểm tra nếu Passport No chứa ký tự đặc biệt
                if (!passportNo.matches("^[a-zA-Z0-9]+$")) {
                    request.setAttribute("passportNoError",
                            "Passport number contains invalid characters.");
                    hasError = true;
                }
            }

            // chỉ cho phép a-z A-Z 0-9
            String invalidCharacterRegex = "[^a-zA-Z0-9]";

            if (surNameEnglish.matches(".*" + invalidCharacterRegex + ".*")) {
                request.setAttribute("surnameError",
                        "Name is included invalid character.");
                hasError = true;
            }

            if (firstNameEnglish.matches(".*" + invalidCharacterRegex + ".*")) {
                request.setAttribute("firstnameError",
                        "Name is included invalid character.");
                hasError = true;
            }

            if (hasError) {
                request.setAttribute("Birthday", birthday);
                // Ghi đè giá trị mới (bao gồm các giá trị rỗng hoặc lỗi)
                String[] studentDetails = studentDAO
                        .getStudentDetails(studentNo);
                studentDetails[10] = surNameEnglish;
                studentDetails[11] = firstNameEnglish;
                studentDetails[12] = surNameKanji;
                studentDetails[13] = firstNameKanji;
                studentDetails[16] = birthday;
                studentDetails[22] = passportNo;

                request.setAttribute("studentDetails", studentDetails);
                request.getRequestDispatcher(
                        "/WEB-INF/views/student/edit_student.jsp")
                        .forward(request, response);
                return;
            }

            // Gọi phương thức DAO để cập nhật thông tin
            boolean isUpdated = studentDAO.updateStudent(studentNo,
                    surNameEnglish, firstNameEnglish, surNameKanji,
                    firstNameKanji, surNameKana, firstNameKana,
                    formattedBirthday, gender, languageAbilityId,
                    formattedInternalTransferDate, nationality1Id,
                    nationality2Id, passportNo, visaTypeId, visaNo,
                    formattedVisaExpiryDate, previousSchoolName, telephoneNo,
                    previousSchoolAddress, officeRemark, giroValue, document);

            if (isUpdated) {
                // Gán thông báo vào session
                String updateMessage = "Student Information has been updated successfully.";
                request.getSession().setAttribute("updateMessage",
                        updateMessage);
                response.sendRedirect(request.getContextPath()
                        + "/student?astudS03=student_detail&studentNo="
                        + studentNo);
            } else {
                request.setAttribute("errorMessage",
                        "Failed to update student.");
                request.getRequestDispatcher(
                        "/WEB-INF/views/student/edit_student.jsp")
                        .forward(request, response);
            }
        }
    }

    // Phương thức tiện ích để chuyển đổi an toàn
    private Integer safeParseInt(String value) {
        try {
            return (value != null && !value.trim().isEmpty())
                    ? Integer.parseInt(value)
                    : null;
        } catch (NumberFormatException e) {
            return null; // Trả về null nếu không chuyển đổi được
        }
    }

    public void getData(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String applicationDate = request.getParameter("applicationDate");
        String admissionDate = request.getParameter("admissionDate");
        String admissionSchool = request.getParameter("admissionSchool");
        String admissionGrade = request.getParameter("admissionGrade");

        String studentAlphaSurName = request
                .getParameter("studentAlphaSurName");
        String studentAlphaFirstName = request
                .getParameter("studentAlphaFirstName");
        String surNameKanji = request.getParameter("studentKanjiSurName");
        String firstNameKanji = request.getParameter("studentKanjiFirstName");
        String surNameKana = request.getParameter("studentKanaSurName");
        String firstNameKana = request.getParameter("studentKanaFirstName");
        String birthday = request.getParameter("birthDay");
        String gender;
        if ("true".equals(request.getParameter("gender"))) {
            gender = "Male";
        } else {
            gender = "Female"; // Lỗi chính tả trước đó, "Femal" -> "Female"
        }
        String languageAbility = request.getParameter("languageAbility");
        String internalTransferDate = request.getParameter("transferDate");
        String nationality1 = request.getParameter("nationality1");
        String nationality2 = request.getParameter("nationality2");
        String passportNo = request.getParameter("passportNo");
        String visaType = request.getParameter("visaType");
        String visaNo = request.getParameter("visaN0");
        String expiryDate = request.getParameter("visaExpiryDate");
        String previousSchoolName = request.getParameter("prevSchoolName");
        String telephoneNo = request.getParameter("prevSchoolTel");
        String previousSchoolAddress = request
                .getParameter("previousSchoolAddress");
        String officeRemark = request.getParameter("officeRemark");
        String giro = request.getParameter("giro");
        String document = request.getParameter("document");
        String selectParentIDStr = request.getParameter("selectParent");

        // Xử lý ngày tháng
        String formattedApplicationDate = DateUtils.parseDate(applicationDate);
        String formattedAdmissionDate = DateUtils.parseDate(admissionDate);
        String formattedBirthday = DateUtils.parseDate(birthday);
        String formattedInternalTransferDate = DateUtils
                .parseDate(internalTransferDate);
        String formattedExpiryDate = DateUtils.parseDate(expiryDate);

        // Chuyển đổi an toàn các trường có thể null
        Integer parsedAdmissionSchool = safeParseInt(admissionSchool);
        Integer parsedAdmissionGrade = safeParseInt(admissionGrade);
        Integer parsedLanguageAbility = safeParseInt(languageAbility);
        Integer parsedNationality1 = safeParseInt(nationality1);
        Integer parsedNationality2 = safeParseInt(nationality2);
        Integer parsedVisaType = safeParseInt(visaType);
        Integer selectParentID = safeParseInt(selectParentIDStr);

        boolean isAdd = studentDAO.addStudent(formattedApplicationDate,
                formattedAdmissionDate,
                parsedAdmissionSchool != null ? parsedAdmissionSchool : 1,
                parsedAdmissionGrade != null ? parsedAdmissionGrade : 1,
                studentAlphaSurName, studentAlphaFirstName, surNameKanji,
                firstNameKanji, surNameKana, firstNameKana, formattedBirthday,
                gender,
                parsedLanguageAbility != null ? parsedLanguageAbility : 1,
                formattedInternalTransferDate,
                parsedNationality1 != null ? parsedNationality1 : 1,
                parsedNationality2 != null ? parsedNationality2 : 1, passportNo,
                parsedVisaType != null ? parsedVisaType : 1, visaNo,
                formattedExpiryDate, previousSchoolName, telephoneNo,
                previousSchoolAddress, officeRemark, giro, document,
                selectParentID);
        if (isAdd) {
            int studentNo = studentDAO.getLatestStudentNo();
            request.getSession().setAttribute("studentNo", studentNo);
            request.getSession().setAttribute("isAdd", true);
            response.sendRedirect(request.getContextPath()
                    + "/student?astudS03=student_list");
        } else {
            request.setAttribute("errorMessage", "Failed to add student.");
            request.getRequestDispatcher(
                    "/WEB-INF/views/student/new_student_step3.jsp")
                    .forward(request, response);
        }

    }
}