package dev.studentmanager.model;

/**
 * Lớp này đại diện cho người dùng trong hệ thống. Nó chứa thông tin về tên đầy
 * đủ, tên người dùng, mật khẩu, email và vai trò của người dùng.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
public class User {
    private String fullName;
    private String roleName;
    private String username;
    private String password;
    private String email;
    private int roleId;

    /**
     * Khởi tạo đối tượng User với tên đầy đủ và tên vai trò.
     * 
     * @param fullName Tên đầy đủ của người dùng.
     * @param roleName Tên vai trò của người dùng.
     */
    public User(String fullName, String roleName) {
        this.fullName = fullName;
        this.roleName = roleName;
    }

    /**
     * Khởi tạo đối tượng User với tất cả các thuộc tính.
     * 
     * @param username Tên đăng nhập của người dùng.
     * @param password Mật khẩu của người dùng.
     * @param fullName Tên đầy đủ của người dùng.
     * @param email    Email của người dùng.
     * @param roleId   ID vai trò của người dùng.
     */
    public User(String username, String password, String fullName, String email,
            int roleId) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.roleId = roleId;
    }

    /**
     * Lấy tên đầy đủ của người dùng.
     * 
     * @return Tên đầy đủ của người dùng.
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * Đặt tên đầy đủ cho người dùng.
     * 
     * @param fullName Tên đầy đủ của người dùng.
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * Lấy tên vai trò của người dùng.
     * 
     * @return Tên vai trò của người dùng.
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * Đặt tên vai trò cho người dùng.
     * 
     * @param roleName Tên vai trò của người dùng.
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * Lấy tên đăng nhập của người dùng.
     * 
     * @return Tên đăng nhập của người dùng.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Đặt tên đăng nhập cho người dùng.
     * 
     * @param username Tên đăng nhập của người dùng.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Lấy mật khẩu của người dùng.
     * 
     * @return Mật khẩu của người dùng.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Đặt mật khẩu cho người dùng.
     * 
     * @param password Mật khẩu của người dùng.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Lấy email của người dùng.
     * 
     * @return Email của người dùng.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Đặt email cho người dùng.
     * 
     * @param email Email của người dùng.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Lấy ID vai trò của người dùng.
     * 
     * @return ID vai trò của người dùng.
     */
    public int getRoleId() {
        return roleId;
    }

    /**
     * Đặt ID vai trò cho người dùng.
     * 
     * @param roleId ID vai trò của người dùng.
     */
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
