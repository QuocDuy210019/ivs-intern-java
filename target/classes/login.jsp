<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>SM-Login</title>
<%@ include file="layout/head.jsp"%>

<body class="hold-transition login-page"
    style="font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;">

    <!-- Form đăng nhập -->
    <form id="index" name="index" action="login" method="post">
        <fieldset>
            <div class="login-box">
                <div class="login-logo">THE JAPANESE SCHOOL SINGAPORE</div>
                <div class="login-box-body">

                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                    %>
                    <div class="alert alert-danger">
                        <%=errorMessage%>
                    </div>
                    <%
                    }
                    %>

                    <!-- Hiển thị câu "Login to start your session" nếu không có lỗi -->
                    <%
                    if (errorMessage == null) {
                    %>
                    <p class="login-box-msg">Login to start your session</p>
                    <%
                    }
                    %>

                    <!-- Nhập tên đăng nhập -->
                    <div class="form-group has-feedback <%=(request.getAttribute("usernameError") != null) ? "has-error" : ""%>">
                        <div class="controls">
                            <input type="text" name="username"
                                value="<%=request.getParameter("username") != null
                                ? request.getParameter("username")
                                : ""%>"
                                id="login_username" class="form-control" placeholder="Username">

                            <!-- Hiển thị lỗi nếu có -->
                            <%
                            if (request.getAttribute("usernameError") != null) {
                            %>
                            <span class="help-block alert-danger"><%=request.getAttribute("usernameError")%></span>
                            <%
                            }
                            %>
                        </div>
                    </div>

                    <!-- Nhập mật khẩu -->
                    <div class="form-group has-feedback <%=(request.getAttribute("passwordError") != null) ? "has-error" : ""%>">
                        <div class="controls">
                            <input type="password" name="password" id="login_password"
                                class="form-control" placeholder="Password">
                            <!-- Hiển thị lỗi nếu có -->
                            <%
                            if (request.getAttribute("passwordError") != null) {
                            %>
                            <span class="help-block alert-danger"><%=request.getAttribute("passwordError")%></span>
                            <%
                            }
                            %>
                        </div>
                    </div>

                    <!-- Nút đăng nhập -->
                    <div class="row">
                        <div class="col-xs-4 pull-right">
                            <input type="submit" value="Login"
                                class="btn btn-primary btn-block btn-flat" />
                        </div>
                    </div>

                </div>
            </div>
        </fieldset>
    </form>
</body>

</html>
