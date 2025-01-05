<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	function menuOnClick(id) {
		if (id === 'logout') {
			window.location.href = 'login.jsp';
		} else if (id === 'mpareS03') {
			window.location.href = "${pageContext.request.contextPath}/parent/new_parent.jsp";
		}
	}
</script>
