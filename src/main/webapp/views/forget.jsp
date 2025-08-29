<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .login-input { margin-bottom: 15px; }
        .container { max-width: 400px; margin-top: 50px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quên Mật Khẩu</h2>
        <c:if test="${alert != null}">
            <div class="alert alert-danger">${alert}</div>
        </c:if>
        <c:if test="${message != null}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <form action="forget-password" method="post">
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                    <input type="email" class="form-control" placeholder="Nhập Email" name="email" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi Yêu Cầu</button>
        </form>
        <p class="text-center mt-3"><a href="login">Quay lại Đăng Nhập</a></p>
    </div>
</body>
</html>