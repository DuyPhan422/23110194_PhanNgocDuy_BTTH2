<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hệ thống Quản lý</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
.login-container {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-header {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.input-group-text {
	background: #f8f9fa;
	border-right: none;
}

.form-control {
	border-left: none;
}

.input-group .form-control:focus {
	border-color: #86b7fe;
	box-shadow: none;
}

.remember-forgot {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.register-link {
	text-align: center;
	margin-top: 15px;
}

.register-link a {
	color: #007bff;
	text-decoration: none;
}

.register-link a:hover {
	text-decoration: underline;
}

.register-form {
	display: none;
}

.error {
	color: red;
	font-size: 0.9em;
}
</style>
</head>
<body>
	<div class="container login-container">
		<div class="login-header">
			<h2 id="formTitle">Đăng Nhập Vào Hệ Thống</h2>
		</div>

		<!-- Form Đăng Nhập (mặc định hiển thị) -->
		<div id="login" class="login-form">
			<c:if test="${alert != null}">
				<div class="alert alert-danger error">${alert}</div>
			</c:if>
			<form action="login" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-user"></i></span> <input
							type="text" class="form-control" placeholder="Tài khoản"
							name="username" value="${rememberedUser}" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
							type="password" class="form-control" placeholder="Mật khẩu"
							name="password" required>
					</div>
				</div>
				<div class="remember-forgot">
					<div class="form-check">
						<input type="checkbox" name="rememberMe" class="form-check-input">
						<label class="form-check-label">Nhớ mật khẩu</label>
					</div>
					<a href="forget" class="forgot">Quên mật khẩu?</a>
				</div>
				<button type="submit" class="btn btn-primary w-100">Đăng
					Nhập</button>
			</form>
			<div class="register-link">
				Nếu bạn chưa có tài khoản trên hệ thống, thì hãy <a href="#"
					id="registerLink">Đăng ký</a>
			</div>
		</div>

		<!-- Form Đăng Ký (ẩn ban đầu) -->
		<div id="register" class="login-form register-form">
			<c:if test="${alert != null}">
				<div class="alert alert-danger error">${alert}</div>
			</c:if>
			<form action="register" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-user"></i></span> <input
							type="text" class="form-control" placeholder="Tài khoản"
							name="username" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-user"></i></span> <input
							type="text" class="form-control" placeholder="Họ tên"
							name="fullname" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-envelope"></i></span>
						<input type="email" class="form-control" placeholder="Nhập Email"
							name="email" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-phone"></i></span>
						<input type="text" class="form-control"
							placeholder="Số điện thoại" name="phone" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
							type="password" class="form-control" placeholder="Mật khẩu"
							name="password" required>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
							type="password" class="form-control"
							placeholder="Nhập lại mật khẩu" name="confirm" required>
					</div>
				</div>
				<button type="submit" class="btn btn-primary w-100">Tạo Tài
					Khoản</button>
			</form>
			<div class="register-link">
				<a href="#" id="backToLogin">Quay lại Đăng Nhập</a>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Chuyển đổi giữa Đăng Nhập và Đăng Ký
        document.getElementById('registerLink').addEventListener('click', function(e) {
    	e.preventDefault();
    	document.getElementById('login').style.display = 'none';
  		document.getElementById('register').style.display = 'block';
    	document.getElementById('formTitle').textContent = 'Tạo Tài Khoản Mới'; 
	});

     // Quay lại form Đăng Nhập
        document.getElementById('backToLogin').addEventListener('click', function(e) {
            e.preventDefault();
            document.getElementById('register').style.display = 'none';
            document.getElementById('login').style.display = 'block';
            document.getElementById('formTitle').textContent = 'Đăng Nhập Vào Hệ Thống'; 
        });
    </script>
</body>
</html>