<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phong Cách Trang Trí - Cinema Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        /* Header Styles */
        header {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .top-header {
            background-color: #1a237e;
            padding: 15px 0;
            color: white;
        }

        .logo {
            height: 50px;
            margin-right: 10px;
        }

        .logo-text {
            display: flex;
            flex-direction: column;
        }

        .top-header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .auth-button {
            background-color: white;
            color: #1a237e;
            padding: 8px 15px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .auth-button:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .auth-button i {
            margin-right: 5px;
        }

        /* Navigation Styles - Modern Horizontal Menu with Hover Effect */
        .main-nav {
            background-color: white;
            padding: 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .nav-links {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            justify-content: center;
        }

        .nav-item {
            position: relative;
            margin: 0 5px;
        }

        .nav-item a {
            display: flex;
            align-items: center;
            padding: 18px 20px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 0;
        }

        .nav-item a i {
            margin-right: 8px;
            font-size: 16px;
        }

        .nav-item.active a {
            color: #1a237e;
            font-weight: bold;
        }

        .nav-item.active::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #1a237e;
        }

        .nav-item a:hover {
            color: #1a237e;
            background-color: rgba(26, 35, 126, 0.05);
        }

        /* Mobile Navigation */
        .mobile-menu-toggle {
            display: none;
            background: none;
            border: none;
            color: #1a237e;
            font-size: 24px;
            cursor: pointer;
            padding: 10px;
        }

        @media (max-width: 768px) {
            .mobile-menu-toggle {
                display: block;
            }

            .nav-links {
                display: none;
                flex-direction: column;
                width: 100%;
            }

            .nav-links.active {
                display: flex;
            }

            .nav-item {
                margin: 0;
                width: 100%;
            }

            .nav-item a {
                padding: 15px;
                justify-content: flex-start;
            }

            .nav-item.active::after {
                display: none;
            }

            .nav-item.active a {
                background-color: rgba(26, 35, 126, 0.1);
            }

            .top-header .container {
                flex-direction: column;
                text-align: center;
            }

            .top-header .container > div {
                margin-bottom: 10px;
            }

            .main-nav .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 15px;
            }
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Page specific styles */
        .page-header {
            text-align: center;
            margin: 40px 0;
        }

        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }

        .page-description {
            font-size: 18px;
            color: #666;
            max-width: 700px;
            margin: 0 auto;
        }

        .decoration-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 50px;
        }

        .decoration-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .decoration-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .decoration-image {
            height: 220px;
            width: 100%;
            object-fit: cover;
        }

        .decoration-details {
            padding: 20px;
        }

        .decoration-name {
            font-size: 22px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }

        .decoration-description {
            color: #666;
            margin-bottom: 15px;
            font-size: 14px;
            line-height: 1.6;
        }

        .decoration-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .btn-book {
            background-color: #1a237e;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .btn-book i {
            margin-right: 5px;
        }

        .btn-book:hover {
            background-color: #0e1442;
            color: white;
            text-decoration: none;
        }

        .no-decorations {
            text-align: center;
            padding: 50px 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .no-decorations i {
            font-size: 48px;
            color: #ccc;
            margin-bottom: 20px;
        }

        .no-decorations h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .no-decorations p {
            color: #666;
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<header>
    <div class="top-header">
        <div class="container">
            <div style="display: flex; align-items: center;">
                <div class="logo-text">
                    <h1>Cinema Booking</h1>
                    <span>Đặt phòng tiệc sinh nhật tại rạp chiếu phim</span>
                </div>
            </div>
            <div>
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/login" class="auth-button">
                            <i class="fas fa-user"></i> Đăng nhập
                        </a>
                        <a href="${pageContext.request.contextPath}/register" class="auth-button" style="margin-left: 10px;">
                            <i class="fas fa-user-plus"></i> Đăng ký
                        </a>
                    </c:when>
                    <c:otherwise>
                        <span style="margin-right: 15px;">Xin chào, ${sessionScope.user.fullName}</span>
                        <a href="${pageContext.request.contextPath}/user/bookings" class="auth-button">
                            <i class="fas fa-ticket-alt"></i> Đặt phòng của tôi
                        </a>
                        <a href="${pageContext.request.contextPath}/logout" class="auth-button" style="margin-left: 10px;">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <nav class="main-nav">
        <div class="container">
            <button class="mobile-menu-toggle">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="nav-links">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/"><i class="fas fa-home"></i> Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-door-open"></i> Phòng tiệc</a>
                </li>
                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/decoration-styles"><i class="fas fa-paint-roller"></i> Phong cách trang trí</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> Về chúng tôi</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/contact"><i class="fas fa-envelope"></i> Liên hệ</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<div class="container">
    <div class="page-header">
        <h1 class="page-title">Phong Cách Trang Trí</h1>
        <p class="page-description">Khám phá các phong cách trang trí độc đáo cho buổi tiệc sinh nhật của bạn tại Cinema Booking.</p>
    </div>

    <c:choose>
        <c:when test="${empty decorationStyles}">
            <div class="no-decorations">
                <i class="fas fa-paint-brush"></i>
                <h3>Không có phong cách trang trí nào hiện tại</h3>
                <p>Chúng tôi đang cập nhật danh sách phong cách trang trí. Vui lòng quay lại sau.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="decoration-grid">
                <c:forEach items="${decorationStyles}" var="style">
                    <div class="decoration-card">
                        <img src="${pageContext.request.contextPath}${not empty style.imageUrl ? style.imageUrl : '/resources/images/anhvu.png'}"
                             alt="${style.name}"
                             class="decoration-image"
                             onerror="this.src='${pageContext.request.contextPath}/resources/images/anhvu.png'">
                        <div class="decoration-details">
                            <h2 class="decoration-name">${style.name}</h2>
                            <p class="decoration-description">${style.description}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Mobile menu toggle functionality
        const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
        const navLinks = document.querySelector('.nav-links');

        mobileMenuToggle.addEventListener('click', function() {
            navLinks.classList.toggle('active');
            const icon = mobileMenuToggle.querySelector('i');
            if (navLinks.classList.contains('active')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-times');
            } else {
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
            }
        });
    });
</script>
</body>
</html> 