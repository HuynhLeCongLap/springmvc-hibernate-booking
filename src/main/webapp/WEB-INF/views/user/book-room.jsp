<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Xác Nhận Đặt Phòng</title>
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
            padding: 10px 0;
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

        .logo-text h1 {
            font-size: 24px;
            margin: 0;
            font-weight: bold;
        }

        .logo-text span {
            font-size: 12px;
            opacity: 0.8;
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
        }

        .auth-button i {
            margin-right: 5px;
        }

        .auth-button:hover {
            background-color: rgba(255, 255, 255, 0.9);
            color: #0d1757;
        }

        /* Navigation Styles */
        .main-nav {
            background-color: white;
        }

        .nav-links {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .nav-item {
            position: relative;
        }

        .nav-item a {
            display: block;
            padding: 15px 20px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
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
        
        .booking-container {
            max-width: 800px;
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
        
        .confirmation-box {
            background-color: #e8f5e9;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
            border-left: 5px solid #4caf50;
        }
        
        .confirmation-icon {
            font-size: 48px;
            color: #4caf50;
            margin-bottom: 15px;
        }
        
        .confirmation-message {
            font-size: 18px;
            font-weight: bold;
            color: #2e7d32;
            margin-bottom: 10px;
        }
        
        .confirmation-details {
            font-size: 14px;
            color: #555;
        }
        
        .booking-details {
            margin-bottom: 30px;
        }
        
        .booking-details-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1a237e;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        
        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .detail-item {
            margin-bottom: 15px;
        }
        
        .detail-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        
        .detail-value {
            font-size: 16px;
            font-weight: 500;
            color: #333;
        }
        
        .payment-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .payment-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1a237e;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        
        .price-breakdown {
            margin-bottom: 20px;
        }
        
        .price-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .price-label {
            color: #666;
        }
        
        .price-value {
            font-weight: 500;
        }
        
        .total-price {
            display: flex;
            justify-content: space-between;
            font-size: 18px;
            font-weight: bold;
            padding-top: 15px;
            border-top: 1px solid #ddd;
        }
        
        .total-price-value {
            color: #1a237e;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: #1a237e;
            color: white;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #0d1757;
        }
        
        .btn-outline-secondary {
            background-color: transparent;
            color: #666;
            border: 1px solid #ddd;
        }
        
        .btn-outline-secondary:hover {
            background-color: #f8f9fa;
            color: #333;
        }
        
        .note-section {
            background-color: #fff8e1;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }
        
        .note-title {
            font-size: 16px;
            font-weight: bold;
            color: #ff8f00;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .note-title i {
            margin-right: 10px;
        }
        
        .note-content {
            font-size: 14px;
            color: #555;
        }
        
        .note-content li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <!-- Header/Navbar -->
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
                <h1 class="booking-title">Xác Nhận Đặt Phòng</h1>
                <p class="booking-subtitle">Thông tin chi tiết về đặt phòng của bạn</p>
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
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn trang trí</div>
                </div>
                <div class="step active">
                    <div class="step-number">4</div>
                    <div class="step-label">Xác nhận</div>
                </div>
            </div>
            
            <div class="confirmation-box">
                <div class="confirmation-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2 class="confirmation-message">Đặt phòng thành công!</h2>
                <p class="confirmation-details">
                    Mã đặt phòng của bạn: <strong>${booking.bookingCode}</strong><br>
                    Vui lòng lưu lại mã này để tra cứu thông tin đặt phòng.
                </p>
            </div>
            
            <div class="booking-details">
                <h3 class="booking-details-title">Thông tin đặt phòng</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <div class="detail-label">Ngày đặt phòng</div>
                        <div class="detail-value"><fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Khung giờ</div>
                        <div class="detail-value">${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Phòng</div>
                        <div class="detail-value">${booking.room.name}</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Sức chứa</div>
                        <div class="detail-value">${booking.room.capacity} người</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Phong cách trang trí</div>
                        <div class="detail-value">${booking.decorationStyle.name}</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Trạng thái</div>
                        <div class="detail-value">
                            <span class="badge bg-success">Đã xác nhận</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="payment-info">
                <h3 class="payment-title">Thông tin thanh toán</h3>
                <div class="price-breakdown">
                    <div class="price-item">
                        <span class="price-label">Giá phòng</span>
                        <span class="price-value"><fmt:formatNumber value="${booking.room.price}" pattern="#,##0 ₫" /></span>
                    </div>
                    <div class="price-item">
                        <span class="price-label">Phí trang trí</span>
                        <span class="price-value"><fmt:formatNumber value="${booking.decorationStyle.price}" pattern="#,##0 ₫" /></span>
                    </div>
                    <div class="price-item">
                        <span class="price-label">Thuế VAT (10%)</span>
                        <span class="price-value"><fmt:formatNumber value="${(booking.room.price + booking.decorationStyle.price) * 0.1}" pattern="#,##0 ₫" /></span>
                    </div>
                </div>
                <div class="total-price">
                    <span>Tổng cộng</span>
                    <span class="total-price-value"><fmt:formatNumber value="${booking.totalPrice}" pattern="#,##0 ₫" /></span>
                </div>
            </div>
            
            <div class="note-section">
                <h4 class="note-title">
                    <i class="fas fa-info-circle"></i> Lưu ý quan trọng
                </h4>
                <div class="note-content">
                    <p>Để đảm bảo dịch vụ tốt nhất cho buổi tiệc của bạn, vui lòng lưu ý những điều sau:</p>
                    <ul>
                        <li>Vui lòng đến trước giờ bắt đầu ít nhất 30 phút để kiểm tra và chuẩn bị.</li>
                        <li>Nếu bạn cần thay đổi hoặc hủy đặt phòng, vui lòng liên hệ với chúng tôi trước ít nhất 24 giờ.</li>
                        <li>Phí hủy đặt phòng sẽ được áp dụng nếu bạn hủy trong vòng 24 giờ trước thời gian bắt đầu.</li>
                        <li>Vui lòng tuân thủ các quy định của chúng tôi về an toàn và vệ sinh.</li>
                    </ul>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/user/bookings" class="btn btn-primary">
                    <i class="fas fa-list"></i> Xem đặt phòng của tôi
                </a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">
                    <i class="fas fa-home"></i> Về trang chủ
                </a>
            </div>
        </div>
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