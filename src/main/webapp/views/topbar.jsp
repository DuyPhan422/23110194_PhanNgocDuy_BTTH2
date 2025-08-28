<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%> <!-- Thêm JSTL để xử lý ${alert} -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <!-- Thêm Bootstrap và Font Awesome để hỗ trợ giao diện -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .login-input { margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Đăng Nhập</h2> <!-- Tiêu đề -->
        <c:if test="${alert != null}">
            <h3 class="alert alert-danger">${alert}</h3> <!-- Hiển thị thông báo lỗi -->
        </c:if>
        <form action="login" method="post"> <!-- Form gửi đến servlet /login -->
            <section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
                    </div>
                </label>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
                    </div>
                </label>
                <label>
                    <input type="checkbox" name="remember"> Nhớ mật khẩu
                </label>
                <button type="submit" class="btn btn-primary">Đăng Nhập</button>
            </section>
        </form>
    </div>
</body>
</html>