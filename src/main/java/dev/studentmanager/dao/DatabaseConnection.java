package dev.studentmanager.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Lớp kết nối đến cơ sở dữ liệu MySQL. Lớp này cung cấp phương thức để thiết
 * lập kết nối với cơ sở dữ liệu MySQL sử dụng thông tin cấu hình sẵn có.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
public class DatabaseConnection {
//    private static final String URL = "jdbc:mysql://192.168.0.115:3306/ivs_school";
//    private static final String USER = "pnvan";
//    private static final String PASSWORD = "pnvan";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/ivs_school";
    private static final String USER = "root";
    private static final String PASSWORD = "Duy31082003@";
    /**
     * Lấy kết nối đến cơ sở dữ liệu MySQL. Phương thức này sẽ tải driver MySQL
     * và thiết lập kết nối với cơ sở dữ liệu theo thông tin cấu hình sẵn có.
     * Nếu kết nối thành công, phương thức sẽ trả về đối tượng Connection. Nếu
     * có lỗi, một SQLException sẽ được ném ra.
     * 
     * @return Đối tượng Connection đại diện cho kết nối đến cơ sở dữ liệu
     *         MySQL.
     * @throws SQLException Nếu có lỗi trong quá trình kết nối đến cơ sở dữ
     *                      liệu.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Tải driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Thiết lập kết nối đến cơ sở dữ liệu MySQL
            Connection connection = DriverManager.getConnection(URL, USER,
                    PASSWORD);
            System.out.println("Kết nối đến MySQL thành công!");
            return connection;
        } catch (ClassNotFoundException e) {
            // Nếu driver không tìm thấy, ném ngoại lệ SQLException
            System.err.println("MySQL Driver không được tìm thấy");
            throw new SQLException("MySQL Driver không được tìm thấy", e);
        } catch (SQLException e) {
            // Nếu kết nối thất bại, ném lại ngoại lệ SQLException
            System.err.println("Kết nối đến MySQL thất bại: " + e.getMessage());
            throw e;
        }
    }
}
