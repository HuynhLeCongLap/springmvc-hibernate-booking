<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Cinema Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #1a237e;
            --accent-color: #e91e63;
            --secondary-color: #f8f9fa;
            --text-color: #333;
            --light-color: #ffffff;
            --border-color: #d1d5db;
        }
        
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--secondary-color);
            line-height: 1.6;
            color: var(--text-color);
            background-image: url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
        }
        
        .page-overlay {
            background-color: rgba(0, 0, 0, 0.7);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .auth-container {
            max-width: 450px;
            margin: 0 auto;
            background-color: var(--light-color);
            border-radius: 10px;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            position: relative;
            overflow: hidden;
        }
        
        .auth-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
        }
        
        .auth-logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .auth-title {
            text-align: center;
            color: var(--primary-color);
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .auth-subtitle {
            text-align: center;
            color: #666;
            font-size: 16px;
            margin-bottom: 25px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-color);
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 15px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.15);
            outline: none;
        }
        
        .auth-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }
        
        .auth-btn:hover {
            background-color: #0e1561;
        }
        
        .error-message {
            color: #e11d48;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
            padding: 10px;
            background-color: #fef2f2;
            border-radius: 6px;
            border: 1px solid #fee2e2;
        }
        
        .success-message {
            color: #16a34a;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
            padding: 10px;
            background-color: #f0fdf4;
            border-radius: 6px;
            border: 1px solid #dcfce7;
        }
        
        .auth-links {
            text-align: center;
            margin-top: 25px;
            font-size: 15px;
            color: #666;
        }
        
        .auth-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .auth-links a:hover {
            color: var(--accent-color);
            text-decoration: underline;
        }
        
        .auth-separator {
            display: flex;
            align-items: center;
            margin: 25px 0;
        }
        
        .auth-separator::before,
        .auth-separator::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e5e7eb;
        }
        
        .auth-separator span {
            padding: 0 10px;
            color: #6b7280;
            font-size: 14px;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #f3f4f6;
            color: #333;
            border: 1px solid #e5e7eb;
            transition: all 0.3s;
        }
        
        .social-btn:hover {
            background-color: #e5e7eb;
        }
        
        .forgot-password {
            text-align: right;
            margin-bottom: 20px;
        }
        
        .forgot-password a {
            color: #6b7280;
            font-size: 14px;
            text-decoration: none;
        }
        
        .forgot-password a:hover {
            color: var(--accent-color);
            text-decoration: underline;
        }
        
        .back-to-home {
            display: inline-block;
            margin-top: 20px;
            color: var(--light-color);
            text-decoration: none;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .back-to-home:hover {
            color: var(--accent-color);
        }
        
        .back-to-home i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="page-overlay">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="back-to-home">
                <i class="bi bi-arrow-left"></i> Quay lại trang chủ
            </a>
            
            <div class="auth-container">
                <div class="auth-logo">
                    <div style="display: flex; flex-direction: column; align-items: center;">
                        <i class="bi bi-film" style="font-size: 40px; color: #1a237e;"></i>
                        <span style="font-size: 28px; font-weight: bold; color: #1a237e;">Cinema Booking</span>
                        <span style="font-size: 14px; color: #666;">ĐẶT PHÒNG SINH NHẬT TẠI RẠP PHIM</span>
                    </div>
                </div>
                
                <h1 class="auth-title">Đăng nhập</h1>
                <p class="auth-subtitle">Đăng nhập để đặt phòng và quản lý tài khoản của bạn</p>
                
                <c:if test="${not empty error}">
                    <div class="error-message">${error}</div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="success-message">${success}</div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <input type="hidden" name="redirectUrl" value="${not empty redirectUrl ? redirectUrl : param.redirectUrl}" />
                    
                    <div class="form-group">
                        <label for="numberPhone" class="form-label">Số điện thoại</label>
                        <input type="text" id="numberPhone" name="numberPhone" class="form-control" placeholder="Nhập số điện thoại của bạn" required />
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu của bạn" required />
                    </div>
                    
                    <div class="forgot-password">
                        <a href="#">Quên mật khẩu?</a>
                    </div>
                    
                    <button type="submit" class="auth-btn">Đăng nhập</button>
                </form>
                
                <div class="auth-links">
                    Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>