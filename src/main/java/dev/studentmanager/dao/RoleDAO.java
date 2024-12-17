package dev.studentmanager.dao;

import dev.studentmanager.model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Lớp này thực hiện các thao tác với bảng "role" trong cơ sở dữ liệu. Lớp này
 * cung cấp phương thức để lấy tất cả các vai trò (roles) từ cơ sở dữ liệu.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
public class RoleDAO {

    /**
     * Lấy tất cả các vai trò từ cơ sở dữ liệu. Phương thức này thực hiện một
     * truy vấn SQL để lấy các vai trò từ bảng "role" và trả về danh sách các
     * đối tượng Role.
     * 
     * @return Danh sách các vai trò (roles) từ cơ sở dữ liệu.
     */
    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        // Truy vấn SQL để lấy Id và RoleName từ bảng role
        String query = "SELECT Id, RoleName FROM role";
        // Lấy kết nối từ DatabaseConnection
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query); // Chuẩn bị câu lệnh SQL
                // Thực thi câu lệnh và nhận kết quả
                ResultSet resultSet = statement.executeQuery()) {

            // Duyệt qua các kết quả trả về từ cơ sở dữ liệu
            while (resultSet.next()) {
                // Tạo đối tượng Role từ dữ liệu kết quả truy vấn và thêm vào
                // danh sách roles
                roles.add(new Role(resultSet.getInt("Id"),
                        resultSet.getString("RoleName")));
            }
        } catch (SQLException e) {
            // In thông báo lỗi nếu có lỗi xảy ra trong quá trình truy vấn cơ sở
            // dữ liệu
            e.printStackTrace();
        }
        return roles; // Trả về danh sách các vai trò
    }
}
