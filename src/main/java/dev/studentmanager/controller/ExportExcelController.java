package dev.studentmanager.controller;

import dev.studentmanager.dao.DatabaseConnection;
/*import jakarta.servlet.Servlet;*/
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletOutputStream;  // Thêm import cho ServletOutputStream
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.sql.*;

@WebServlet("/parent/exportExcel")
public class ExportExcelController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=students_data.xlsx");

        exportDataToExcel(response);
    }

    public void exportDataToExcel(HttpServletResponse response) {
        String query = "SELECT * FROM parent"; 

        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query);
             Workbook workbook = new XSSFWorkbook()) {

            Sheet sheet = workbook.createSheet("Parent Data");
            createHeaderRow(sheet);

            int rowNum = 1; 
            while (resultSet.next()) {
                Row row = sheet.createRow(rowNum++);
                fillRowWithData(row, resultSet);
            }

            try (ServletOutputStream out = response.getOutputStream()) {  // Ghi dữ liệu vào response OutputStream
                workbook.write(out);  
                out.flush();  
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createHeaderRow(Sheet sheet) {
        Row headerRow = sheet.createRow(0);
        String[] columns = {
                "ID", "ParentSurNameEnglish", "ParentFirstNameEnglish", "ParentSurNameKanji",
                "ParentFirstNameKanji", "ParentSurNameKana", "ParentFirstNameKana", "JrcoNo", "JasTypeId",
                "JasNo", "VisaTypeId", "VisaNo", "VisaExpiryDate", "ResidenceZip", "ResidenceAddress1",
                "ResidenceAddress2", "MailingZip", "MailingAddress1", "MailingAddress2", "ResidencePhone",
                "CellPhone", "Email", "Birthday", "PassportNo", "NationalityId", "CompanyId", "SpouseSurNameEnglish",
                "SpouseFirstNameEnglish", "SpouseSurNameKanji", "SpouseFirstNameKanji", "SpouseSurNameKana", "SpouseFirstNameKana",
                "SiblingsName1", "SiblingsName2", "SiblingsName3", "SiblingsName4"
        };

        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
        }
    }


    private void fillRowWithData(Row row, ResultSet resultSet) throws SQLException {
        row.createCell(0).setCellValue(resultSet.getInt("Id"));
        row.createCell(1).setCellValue(resultSet.getString("ParentSurNameEnglish"));
        row.createCell(2).setCellValue(resultSet.getString("ParentFirstNameEnglish"));
        row.createCell(3).setCellValue(resultSet.getString("ParentSurNameKanji"));
        row.createCell(4).setCellValue(resultSet.getString("ParentFirstNameKanji"));
        row.createCell(5).setCellValue(resultSet.getString("ParentSurNameKana"));
        row.createCell(6).setCellValue(resultSet.getString("ParentFirstNameKana"));
        row.createCell(7).setCellValue(resultSet.getString("JrcoNo"));
        row.createCell(8).setCellValue(resultSet.getInt("JasTypeId"));
        row.createCell(9).setCellValue(resultSet.getString("JasNo"));
        row.createCell(10).setCellValue(resultSet.getInt("VisaTypeId"));
        row.createCell(11).setCellValue(resultSet.getString("VisaNo"));
        row.createCell(12).setCellValue(resultSet.getDate("VisaExpiryDate").toString());
        row.createCell(13).setCellValue(resultSet.getString("ResidenceZip"));
        row.createCell(14).setCellValue(resultSet.getString("ResidenceAddress1"));
        row.createCell(15).setCellValue(resultSet.getString("ResidenceAddress2"));
        row.createCell(16).setCellValue(resultSet.getString("MailingZip"));
        row.createCell(17).setCellValue(resultSet.getString("MailingAddress1"));
        row.createCell(18).setCellValue(resultSet.getString("MailingAddress2"));
        row.createCell(19).setCellValue(resultSet.getString("ResidencePhone"));
        row.createCell(20).setCellValue(resultSet.getString("CellPhone"));
        row.createCell(21).setCellValue(resultSet.getString("Email"));
        row.createCell(22).setCellValue(resultSet.getDate("Birthday") != null ? resultSet.getDate("Birthday").toString() : "");
        row.createCell(23).setCellValue(resultSet.getString("PassportNo"));
        row.createCell(24).setCellValue(resultSet.getInt("NationalityId"));
        row.createCell(25).setCellValue(resultSet.getInt("CompanyId"));
        row.createCell(26).setCellValue(resultSet.getString("SpouseSurNameEnglish"));
        row.createCell(27).setCellValue(resultSet.getString("SpouseFirstNameEnglish"));
        row.createCell(28).setCellValue(resultSet.getString("SpouseSurNameKanji"));
        row.createCell(29).setCellValue(resultSet.getString("SpouseFirstNameKanji"));
        row.createCell(30).setCellValue(resultSet.getString("SpouseSurNameKana"));
        row.createCell(31).setCellValue(resultSet.getString("SpouseFirstNameKana"));
        row.createCell(32).setCellValue(resultSet.getString("SiblingsName1"));
        row.createCell(33).setCellValue(resultSet.getString("SiblingsName2"));
        row.createCell(34).setCellValue(resultSet.getString("SiblingsName3"));
        row.createCell(35).setCellValue(resultSet.getString("SiblingsName4"));
    }


    public static void main(String[] args) {
        new ExportExcelController().exportDataToExcel(null);
    }
}
