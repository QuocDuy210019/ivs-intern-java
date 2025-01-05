package dev.studentmanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * ParentDAO
 *
 * This servlet handles operations related to parents, such as retrieving a list
 * of parents and fetching detailed information for a specific parent.
 * @version 1.0 17 Dec 2024
 * @author Vo Hong Vu
 */
@WebServlet("/parent_list")
public class ParentDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests to retrieve a list of parents.
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

        try {Connection connection = DatabaseConnection.getConnection();
            String query = "SELECT p.Id, p.ParentSurNameEnglish, p.ParentFirstNameEnglish, p.JrcoNo, p.JasNo, "
                    + "p.CompanyId, p.CellPhone, c.Name " + "FROM parent p "
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("parentList", parentLists);
        request.setAttribute("activeMenu", "parent");
        request.setAttribute("activeSubMenu", "parent_list");
        request.getRequestDispatcher("/WEB-INF/views/parent/parent_list.jsp")
                .forward(request, response);
    }

    /**
     * Retrieves detailed information about a parent based on the parent ID.
     *
     * @param parentId ID of the parent
     * @return An array of strings containing parent details
     * @throws SQLException in case of database error
     */
    public String[] getParentDetailsById(int parentId) throws SQLException {
        String[] parentDetails = new String[6];
        Connection connection = DatabaseConnection.getConnection();

        String query = "SELECT p.ParentSurNameEnglish, p.ParentFirstNameEnglish, p.ParentSurNameKana, p.ParentFirstNameKana, "
                + "p.ResidenceAddress1, c.Name AS CompanyId, p.JrcoNo, p.JasNo "
                + "FROM parent p "
                + "LEFT JOIN company c ON p.CompanyId = c.id "
                + "WHERE p.Id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, parentId);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String parentFullNameAlpha = result
                        .getString("ParentFirstNameEnglish") + " "
                        + result.getString("ParentSurNameEnglish");
                String parentFullNameKana = result
                        .getString("ParentFirstNameKana") + " "
                        + result.getString("ParentSurNameKana");

                parentDetails[0] = parentFullNameAlpha;
                parentDetails[1] = parentFullNameKana;
                parentDetails[2] = result.getString("ResidenceAddress1");
                parentDetails[3] = result.getString("CompanyId");
                parentDetails[4] = result.getString("JrcoNo");
                parentDetails[5] = result.getString("JasNo");
            }
        }

        return parentDetails;
    }
}
