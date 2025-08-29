<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hệ thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .login-container { max-width: 400px; margin-top: 50px; }
        .nav-tabs .nav-link { cursor: pointer; }
        .tab-content { padding: 20px; border: 1px solid #dee2e6; border-top: none; }
        .login-input { margin-bottom: 15px; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="container login-container">
        <h2 class="text-center">Đăng Nhập / Đăng Ký</h2>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab">Đăng Nhập</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab">Đăng Ký</button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <!-- Tab Đăng Nhập -->
            <div class="tab-pane fade show active" id="login" role="tabpanel">
                <c:if test="${alert != null}">
                    <div class="alert alert-danger">${alert}</div>
                </c:if>
                <form action="login" method="post">
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control login-input" placeholder="Tài khoản" name="username" value="${rememberedUser}" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control login-input" placeholder="Mật khẩu" name="password" required>
                        </div>
                    </div>
                    <div class="mb-3 form-check">
                        <label class="form-check-label">
                            <input type="checkbox" name="rememberMe" class="form-check-input"> Nhớ mật khẩu
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đăng Nhập</button>
                </form>
                <p class="text-center mt-3"><a href="forget-password">Quên mật khẩu?</a></p>
            </div>

            <!-- Tab Đăng Ký -->
            <div class="tab-pane fade" id="register" role="tabpanel">
                <c:if test="${alert != null}">
                    <div class="alert alert-danger">${alert}</div>
                </c:if>
                <form action="register" method="post">
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control login-input" placeholder="Tài khoản" name="username" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control login-input" placeholder="Họ tên" name="fullname" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                            <input type="email" class="form-control login-input" placeholder="Nhập Email" name="email" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-phone"></i></span>
                            <input type="text" class="form-control login-input" placeholder="Số điện thoại" name="phone" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control login-input" placeholder="Mật khẩu" name="password" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control login-input" placeholder="Nhập lại mật khẩu" name="confirm" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Tạo Tài Khoản</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>