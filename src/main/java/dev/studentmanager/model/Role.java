package dev.studentmanager.model;

/**
 * Lớp này đại diện cho một vai trò trong hệ thống. Nó chứa thông tin về ID và
 * tên của vai trò.
 * 
 * @version 1.0 17 Dec 2024
 * @author Nguyen Quoc Duy
 */
public class Role {
    private int id;
    private String roleName;

    /**
     * Khởi tạo đối tượng Role với ID và tên vai trò.
     * 
     * @param id       ID của vai trò.
     * @param roleName Tên của vai trò.
     */
    public Role(int id, String roleName) {
        this.id = id;
        this.roleName = roleName;
    }

    /**
     * Lấy ID của vai trò.
     * 
     * @return ID của vai trò.
     */
    public int getId() {
        return id;
    }

    /**
     * Đặt ID cho vai trò.
     * 
     * @param id ID của vai trò.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Lấy tên của vai trò.
     * 
     * @return Tên của vai trò.
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * Đặt tên cho vai trò.
     * 
     * @param roleName Tên của vai trò.
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
