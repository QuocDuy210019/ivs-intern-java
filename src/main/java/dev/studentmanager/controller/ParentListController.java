package dev.studentmanager.controller;

import dev.studentmanager.dao.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * ParentListServlet
 *
 * @version  1.0 17 Dec 2024
 * @author   Doan Manh Chien
 */
@WebServlet("/parent/list")
public class ParentListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Xử lý các yêu cầu GET để hiển thị danh sách parent được phân trang.
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        ArrayList<String[]> parentLists = new ArrayList<>();
        int totalEntries = 0;
        int currentPage = 1;
        int totalPages = 0;
        int itemsPerPage = 20;
        int currentItems = 0;

        try (Connection connection = DatabaseConnection.getConnection()) {

            // Truy vấn cơ sở để lấy bản ghi parent.
            String query = "SELECT p.Id, p.ParentSurNameEnglish, p.ParentFirstNameEnglish, "
                    + "p.JrcoNo, p.JasNo, p.CompanyId, p.CellPhone, c.Name "
                    + "FROM parent p "
                    + "LEFT JOIN company c ON p.CompanyId = c.id";

            // Lấy tổng số bản ghi.
            try (PreparedStatement stmt = connection.prepareStatement(query,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY)) {

                ResultSet result = stmt.executeQuery();
                result.last();
                totalEntries = result.getRow();
                result.beforeFirst();
            }

            // Xác định trang hiện tại.
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                currentPage = Integer.parseInt(pageParam);
            }

            totalPages = (int) Math.ceil(totalEntries * 1.0 / itemsPerPage);
            int offset = (currentPage - 1) * itemsPerPage;

            // Lấy các bản ghi được phân trang.
            query += " LIMIT " + offset + ", " + itemsPerPage;

            try (PreparedStatement stmt = connection.prepareStatement(query,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
                    ResultSet result = stmt.executeQuery()) {

                while (result.next()) {
                    String companyName = result.getString("Name");
                    String[] parentRecord = {
                            result.getString("ParentFirstNameEnglish") + " "
                                    + result.getString("ParentSurNameEnglish"),
                            result.getString("JrcoNo"),
                            result.getString("JasNo"), companyName,
                            result.getString("CellPhone"),
                            result.getString("Id") };
                    parentLists.add(parentRecord);
                }
            }

            currentItems = parentLists.size();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đặt thuộc tính cho việc hiển thị JSP.
        request.setAttribute("parentList", parentLists);
        request.setAttribute("totalEntries", totalEntries);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("itemsPerPage", itemsPerPage);
        request.setAttribute("currentItems", currentItems);

        // Chuyển tiếp đến trang JSP.
        request.getRequestDispatcher("/WEB-INF/views/parent/parent-list.jsp").forward(request,
                response);
    }
}
