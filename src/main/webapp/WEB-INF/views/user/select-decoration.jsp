<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Chọn Trang Trí</title>
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
        
        .navbar {
            background-color: #1a237e;
        }
        
        .navbar-brand {
            font-weight: bold;
            color: white;
        }
        
        .nav-link {
            color: rgba(255, 255, 255, 0.8);
            transition: all 0.2s;
        }
        
        .nav-link:hover {
            color: white;
        }
        
        .booking-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .booking-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .booking-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }
        
        .booking-subtitle {
            font-size: 16px;
            color: #666;
        }
        
        .booking-steps {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        
        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 120px;
            position: relative;
        }
        
        .step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 25px;
            right: -30px;
            width: 60px;
            height: 2px;
            background-color: #ddd;
        }
        
        .step-number {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .step.active .step-number {
            background-color: #1a237e;
            color: white;
        }
        
        .step.completed .step-number {
            background-color: #4caf50;
            color: white;
        }
        
        .step-label {
            font-size: 14px;
            color: #999;
        }
        
        .step.active .step-label, .step.completed .step-label {
            color: #1a237e;
            font-weight: bold;
        }
        
        .booking-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 30px;
        }
        
        .booking-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .booking-info-item:last-child {
            margin-bottom: 0;
        }
        
        .booking-info-item i {
            width: 25px;
            color: #1a237e;
            margin-right: 10px;
            text-align: center;
        }
        
        .form-section {
            margin-bottom: 30px;
        }
        
        .form-section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
            display: flex;
            align-items: center;
        }
        
        .form-section-title i {
            margin-right: 10px;
            color: #1a237e;
        }
        
        .decoration-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .decoration-card {
            border: 2px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;
        }
        
        .decoration-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .decoration-card.selected {
            border-color: #1a237e;
            box-shadow: 0 0 0 2px #1a237e;
        }
        
        .decoration-card.selected::after {
            content: '\f00c';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #1a237e;
            color: white;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }
        
        .decoration-image {
            height: 180px;
            width: 100%;
            object-fit: cover;
        }
        
        .decoration-details {
            padding: 15px;
        }
        
        .decoration-name {
            font-size: 18px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }
        
        .decoration-description {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .decoration-price {
            font-size: 18px;
            font-weight: bold;
            color: #e91e63;
            margin-top: 10px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn-primary {
            background-color: #1a237e;
            border-color: #1a237e;
            padding: 10px 25px;
        }
        
        .btn-primary:hover {
            background-color: #0e1442;
            border-color: #0e1442;
        }
        
        .btn-outline-secondary {
            color: #1a237e;
            border-color: #1a237e;
            padding: 10px 25px;
        }
        
        .btn-outline-secondary:hover {
            background-color: #f0f0f0;
            color: #1a237e;
        }
        
        .booking-summary {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }
        
        .summary-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1a237e;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        
        .summary-item:last-child {
            border-bottom: none;
        }
        
        .summary-label {
            font-weight: 500;
        }
        
        .summary-value {
            font-weight: bold;
        }
        
        .total-price {
            font-size: 20px;
            color: #e91e63;
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
                        <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/rooms">Phòng tiệc</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/decoration-styles">Phong cách trang trí</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/about">Về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/contact">Liên hệ</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="booking-container">
            <div class="booking-header">
                <h1 class="booking-title">Đặt Phòng</h1>
                <p class="booking-subtitle">Chọn phong cách trang trí cho buổi tiệc của bạn</p>
            </div>
            
            <div class="booking-steps">
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn thời gian</div>
                </div>
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn phòng</div>
                </div>
                <div class="step active">
                    <div class="step-number">3</div>
                    <div class="step-label">Chọn trang trí</div>
                </div>
                <div class="step">
                    <div class="step-number">4</div>
                    <div class="step-label">Xác nhận</div>
                </div>
            </div>
            
            <div class="booking-info">
                <div class="booking-info-item">
                    <i class="far fa-calendar-alt"></i>
                    <span>Ngày: <strong><span class="summary-value">${bookingDate}</span></strong></span>
                </div>
                <div class="booking-info-item">
                    <i class="far fa-clock"></i>
                    <span>Khung giờ: <strong>${timeSlot.startTime} - ${timeSlot.endTime}</strong></span>
                </div>
                <div class="booking-info-item">
                    <i class="fas fa-door-open"></i>
                    <span>Phòng: <strong>${room.roomName}</strong> (${room.capacity} người)</span>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath}/user/create-booking" method="post">
                <input type="hidden" name="timeSlotId" value="${timeSlot.id}">
                <input type="hidden" name="roomId" value="${room.id}">
                <input type="hidden" name="bookingDate" value="${bookingDate}">
                <input type="hidden" name="decorationStyleId" id="selectedDecorationId" value="">
                
                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="fas fa-birthday-cake"></i> Chọn phong cách trang trí
                    </h2>
                    
                    <div class="decoration-grid">
                        <c:forEach items="${decorationStyles}" var="style">
                            <div class="decoration-card" data-decoration-id="${style.id}">
                                <img src="${pageContext.request.contextPath}${not empty style.imageUrl ? style.imageUrl : '/resources/images/default-decoration.jpg'}" 
                                     alt="${style.name}" 
                                     class="decoration-image"
                                     onerror="this.src='${pageContext.request.contextPath}/resources/images/default-decoration.jpg'">
                                <div class="decoration-details">
                                    <h3 class="decoration-name">${style.name}</h3>
                                    <p class="decoration-description">${style.description}</p>
                                    
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="booking-summary" id="bookingSummary" style="display: none;">
                    <h3 class="summary-title">Tóm tắt đặt phòng</h3>
                    <div class="summary-item">
                        <span class="summary-label">Phòng:</span>
                        <span class="summary-value">${room.roomName}</span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Ngày:</span>
                        <span class="summary-value"><span class="summary-value">${bookingDate}</span></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Khung giờ:</span>
                        <span class="summary-value">${timeSlot.startTime} - ${timeSlot.endTime}</span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Phong cách trang trí:</span>
                        <span class="summary-value" id="selectedDecorationName"></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Giá phòng:</span>
                        <span class="summary-value"><fmt:formatNumber value="${room.price}" pattern="#,##0 ₫" /></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Tổng cộng:</span>
                        <span class="summary-value total-price"><fmt:formatNumber value="${room.price}" pattern="#,##0 ₫" /></span>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                    <button type="submit" class="btn btn-primary" id="continueBtn" disabled>
                        <i class="fas fa-arrow-right"></i> Tiếp tục
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const decorationCards = document.querySelectorAll('.decoration-card');
            
            decorationCards.forEach(card => {
                card.addEventListener('click', function() {
                    // Remove selected class from all cards
                    decorationCards.forEach(c => c.classList.remove('selected'));
                    
                    // Add selected class to clicked card
                    this.classList.add('selected');
                    
                    // Get decoration ID from data attribute
                    const decorationId = this.getAttribute('data-decoration-id');
                    const decorationName = this.querySelector('.decoration-name').textContent;
                    
                    // Set the decoration ID in hidden input
                    document.getElementById('selectedDecorationId').value = decorationId;
                    
                    // Enable the continue button
                    document.getElementById('continueBtn').disabled = false;
                });
            });
            
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