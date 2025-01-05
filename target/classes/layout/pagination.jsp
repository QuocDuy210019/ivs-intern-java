<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<ul class="pagination">
    <%
        int currentPage = (Integer) request.getAttribute("currentPage");
        int totalPages = (Integer) request.getAttribute("totalPages");
        int pageWindow = 3; // Hiển thị 3 trang xung quanh trang hiện tại

        // Hiển thị nút "Previous"
        if (currentPage > 1) {
    %>
    <li>
        <a href="student?astudS03=student_list&page=<%= currentPage - 1 %>" aria-label="Previous">
            <span aria-hidden="true">Previous</span>
        </a>
    </li>
    <%
        } else {
    %>
    <li class="disabled">
        <a aria-label="Previous">
            <span aria-hidden="true">Previous</span>
        </a>
    </li>
    <%
        }

        // Hiển thị trang đầu tiên và dấu "..." nếu cần
        if (currentPage > pageWindow + 1) {
    %>
    <li>
        <a href="student?astudS03=student_list&page=1">1</a>
    </li>
    <%
            // Hiển thị dấu "..." nếu khoảng cách tới trang đầu > 1
            if (currentPage > pageWindow + 2) {
    %>
    <li class="disabled">
        <span>...</span>
    </li>
    <%
            }
        }

        // Hiển thị các trang gần với trang hiện tại
        for (int i = Math.max(1, currentPage - pageWindow); i <= Math.min(totalPages, currentPage + pageWindow); i++) {
    %>
    <li class="<%= (i == currentPage) ? "active" : "" %>">
        <a href="student?astudS03=student_list&page=<%= i %>"><%= i %></a>
    </li>
    <%
        }

        // Hiển thị trang cuối cùng và dấu "..." nếu cần
        if (currentPage < totalPages - pageWindow) {
            // Hiển thị dấu "..." nếu khoảng cách tới trang cuối > 1
            if (currentPage < totalPages - pageWindow - 1) {
    %>
    <li class="disabled">
        <span>...</span>
    </li>
    <%
            }
    %>
    <li>
        <a href="student?astudS03=student_list&page=<%= totalPages %>"><%= totalPages %></a>
    </li>
    <%
        }

        // Hiển thị nút "Next"
        if (currentPage < totalPages) {
    %>
    <li>
        <a href="student?astudS03=student_list&page=<%= currentPage + 1 %>" aria-label="Next">
            <span aria-hidden="true">Next</span>
        </a>
    </li>
    <%
        } else {
    %>
    <li class="disabled">
        <a aria-label="Next">
            <span aria-hidden="true">Next</span>
        </a>
    </li>
    <%
        }
    %>
</ul>
