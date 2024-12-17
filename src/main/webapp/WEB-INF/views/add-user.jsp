<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
</head>
<body>
	<h1>Add New User</h1>
	<form action="adduser" method="post">
		<label for="username">Username:</label><br> <input type="text"
			id="username" name="username" required><br>
		<br> <label for="password">Password:</label><br> <input
			type="password" id="password" name="password" required><br>
		<br> <label for="fullName">Full Name:</label><br> <input
			type="text" id="fullName" name="fullName"><br>
		<br> <label for="email">Email:</label><br> <input
			type="email" id="email" name="email"><br>
		<br> <label for="role">Role:</label><br> <select id="role"
			name="roleId" required>
			<option value="">-- Select Role --</option>
			<%-- Sử dụng scriptlet để hiển thị danh sách roles từ database --%>
			<%
			// Lấy danh sách role từ database
			dev.studentmanager.dao.RoleDAO roleDAO = new dev.studentmanager.dao.RoleDAO();
			java.util.List<dev.studentmanager.model.Role> roles = roleDAO.getAllRoles();
			for (dev.studentmanager.model.Role role : roles) {
			%>
			<option value="<%=role.getId()%>"><%=role.getRoleName()%></option>
			<%
			}
			%>
		</select><br>
		<br>

		<button type="submit">Add User</button>
	</form>
</body>
</html>
