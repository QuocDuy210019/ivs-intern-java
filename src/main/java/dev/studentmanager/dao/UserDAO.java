package dev.studentmanager.dao;

import dev.studentmanager.model.User; // Thêm User model để lưu thông tin người dùng.
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Lớp này thực hiện các thao tác với bảng "user" trong cơ sở dữ liệu. Lớp này
 * cung cấp các phương thức để xác thực người dùng, lấy thông tin chi tiết người
 * dùng, và thêm người dùng mới.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Van Trong, Nguyen Quoc Duy, Nguyen Chi Nhan
 */
public class UserDAO {

    /**
     * Kiểm tra tính hợp lệ của thông tin đăng nhập người dùng. Phương thức này
     * kiểm tra xem người dùng với tên đăng nhập và mật khẩu đã cho có tồn tại
     * trong cơ sở dữ liệu hay không.
     * 
     * @param username Tên đăng nhập của người dùng.
     * @param password Mật khẩu của người dùng.
     * @return true nếu thông tin đăng nhập hợp lệ, false nếu không hợp lệ.
     */
    public boolean validateUser(String username, String password) {
        String query = "SELECT * FROM user WHERE BINARY username = ? AND BINARY password = ?";
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query)) {

            statement.setString(1, username);
            // Sử dụng BINARY để kiểm tra phân biệt chữ hoa thường
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            return resultSet.next(); // Nếu có kết quả, người dùng hợp lệ
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Nếu có lỗi, trả về false
        }
    }

    /**
     * Lấy thông tin chi tiết của người dùng theo tên đăng nhập. Phương thức này
     * truy vấn cơ sở dữ liệu để lấy thông tin chi tiết người dùng bao gồm tên
     * đầy đủ và vai trò của người dùng.
     * 
     * @param username Tên đăng nhập của người dùng.
     * @return Đối tượng User chứa thông tin người dùng hoặc null nếu không tìm
     *         thấy người dùng.
     */
    public User getUserDetails(String username) {
        String query = """
                    SELECT
                        u.FullName AS fullName,
                        COALESCE(r.RoleName, 'No Role') AS roleName
                    FROM
                        user u
                    LEFT JOIN
                        role r ON u.RoleId = r.id
                    WHERE
                        u.UserName = ?;
                """;

        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query)) {

            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Lấy thông tin từ kết quả truy vấn
                String fullName = resultSet.getString("fullName");
                // Trả về 'No Role' nếu không có vai trò
                String roleName = resultSet.getString("roleName");

                // Tạo và trả về đối tượng User với thông tin đã lấy
                return new User(fullName, roleName);
            }
        } catch (SQLException e) {
            System.err
                    .println("Error fetching user details: " + e.getMessage());
        }
        return null; // Trả về null nếu không tìm thấy người dùng
    }

    /**
     * Thêm một người dùng mới vào cơ sở dữ liệu. Phương thức này thực hiện một
     * câu lệnh SQL để thêm người dùng mới vào bảng "user".
     * 
     * @param user Đối tượng User chứa thông tin người dùng cần thêm.
     * @return true nếu người dùng được thêm thành công, false nếu có lỗi xảy
     *         ra.
     */
    public boolean addUser(User user) {
        String query = "INSERT INTO User (Username, Password, FullName, Email, RoleId) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection
                        .prepareStatement(query)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setString(4, user.getEmail());
            statement.setInt(5, user.getRoleId());

            // Kiểm tra nếu câu lệnh thực thi thành công
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }
}
