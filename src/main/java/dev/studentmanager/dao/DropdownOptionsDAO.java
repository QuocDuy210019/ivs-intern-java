package dev.studentmanager.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * DropdownOptionsDAO
 * 
 * This DAO class provides methods to retrieve dropdown options such as
 * admission schools, grades, language abilities, nationalities, visa types, and
 * Giro options from the database.
 * @version 1.0 17 Dec 2024
 * @author Vo Hong Vu
 */
public class DropdownOptionsDAO {

    /**
     * Retrieves all admission schools.
     * 
     * @return List of admission school names.
     */
    public List<String> getAllAdmissionSchool() {
        List<String> admissionSchool = new ArrayList<>();
        String query = "SELECT Id, Name FROM admission_school";

        try (Connection connection = DatabaseConnection.getConnection();
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                admissionSchool.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admissionSchool;
    }

    /**
     * Retrieves the ID of an admission school based on its name.
     * 
     * @param admissionSchoolName Name of the admission school.
     * @return ID of the admission school, or -1 if not found.
     */
    public int getAdmissionSchoolIdByName(String admissionSchoolName) {
        String query = "SELECT Id FROM admission_school WHERE Name = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, admissionSchoolName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * Retrieves all admission grades.
     * 
     * @return List of admission grade names.
     */
    public List<String> getAllAdmissionGrade() {
        List<String> admissionGrade = new ArrayList<>();
        String query = "SELECT Id, Name FROM admission_grade";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                admissionGrade.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admissionGrade;
    }

    /**
     * Retrieves all language abilities.
     * 
     * @return List of language ability names.
     */
    public List<String> getAllLanguageAbility() {
        List<String> languageAbility = new ArrayList<>();
        String query = "SELECT Id, Name FROM language_ability";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                languageAbility.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return languageAbility;
    }

    /**
     * Retrieves the ID of a language ability based on its name.
     * 
     * @param languageAbilityName Name of the language ability.
     * @return ID of the language ability, or -1 if not found.
     */
    public int getLanguageAbilityIdByName(String languageAbilityName) {
        String query = "SELECT Id FROM language_ability WHERE Name = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, languageAbilityName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * Retrieves all nationalities.
     * 
     * @return List of nationality names.
     */
    public List<String> getAllNationalities() {
        List<String> nationalities = new ArrayList<>();
        String query = "SELECT Id, Name FROM nationality";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                nationalities.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nationalities;
    }

    /**
     * Retrieves the ID of a nationality based on its name.
     * 
     * @param nationalityName Name of the nationality.
     * @return ID of the nationality, or -1 if not found.
     */
    public int getNationalityIdByName(String nationalityName) {
        String query = "SELECT Id FROM nationality WHERE Name = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, nationalityName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * Retrieves all visa types.
     * 
     * @return List of visa type names.
     */
    public List<String> getAllVisaType() {
        List<String> visaType = new ArrayList<>();
        String query = "SELECT Id, Name FROM visa_type";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                visaType.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return visaType;
    }

    /**
     * Retrieves the ID of a visa type based on its name.
     * 
     * @param visaTypeName Name of the visa type.
     * @return ID of the visa type, or -1 if not found.
     */
    public int getVisaTypeIdByName(String visaTypeName) {
        String query = "SELECT Id FROM visa_type WHERE Name = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, visaTypeName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * Retrieves Giro options.
     * 
     * @return List containing Giro options ("Giro" and "Non Giro").
     */
    public List<String> getAllGiro() {
        List<String> giroList = new ArrayList<>();
        giroList.add("Giro");
        giroList.add("Non Giro");
        return giroList;
    }
}
