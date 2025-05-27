<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - Cinema Booking</title>
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
        .about-section {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 40px 0;
        }
        
        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            align-items: center;
        }
        
        .about-image {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .about-text {
            font-size: 16px;
            line-height: 1.8;
            color: #555;
        }
        
        .about-text p {
            margin-bottom: 20px;
        }
        
        .about-text h3 {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 15px;
        }
        
        .values-section {
            margin-top: 40px;
        }
        
        .values-title {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .value-card {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .value-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .value-icon {
            font-size: 40px;
            color: #1a237e;
            margin-bottom: 15px;
        }
        
        .value-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .value-description {
            font-size: 14px;
            color: #666;
        }
        
        .team-section {
            margin-top: 40px;
        }
        
        .team-title {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .team-member {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        
        .team-member:hover {
            transform: translateY(-5px);
        }
        
        .member-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        
        .member-info {
            padding: 20px;
            text-align: center;
        }
        
        .member-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .member-position {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .member-social {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        
        .member-social a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #333;
            transition: all 0.3s ease;
        }
        
        .member-social a:hover {
            background-color: #1a237e;
            color: white;
        }
        
        @media (max-width: 768px) {
            .about-content {
                grid-template-columns: 1fr;
            }
            
            .about-image {
                margin-bottom: 20px;
            }
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
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/decoration-styles"><i class="fas fa-paint-roller"></i> Phong cách trang trí</a>
                    </li>
                    <li class="nav-item active">
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
        <section class="about-section">
            <h1 class="page-title">Về Cinema Booking</h1>
            
            <div class="about-content">
                <div>
                    <img src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80" alt="Cinema Booking" class="about-image">
                </div>
                <div class="about-text">
                    <h3>Chào mừng đến với Cinema Booking</h3>
                    <p>Cinema Booking là dịch vụ đặt phòng tiệc sinh nhật độc đáo tại rạp chiếu phim, mang đến cho bạn và người thân những trải nghiệm khó quên.</p>
                    <p>Được thành lập vào năm 2020, chúng tôi đã phục vụ hàng nghìn khách hàng và tổ chức hàng trăm sự kiện thành công. Với không gian rộng rãi, trang thiết bị hiện đại và đội ngũ nhân viên chuyên nghiệp, chúng tôi cam kết mang đến cho bạn buổi tiệc sinh nhật hoàn hảo.</p>
                    <p>Tại Cinema Booking, chúng tôi hiểu rằng mỗi dịp sinh nhật là một kỷ niệm đáng nhớ. Vì vậy, chúng tôi luôn nỗ lực để mang đến những trải nghiệm tuyệt vời nhất cho bạn và người thân.</p>
                </div>
            </div>
            
            <div class="values-section">
                <h2 class="values-title">Giá trị cốt lõi của chúng tôi</h2>
                <div class="values-grid">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-heart"></i>
                        </div>
                        <h3 class="value-title">Đam mê</h3>
                        <p class="value-description">Chúng tôi đam mê tạo ra những kỷ niệm đáng nhớ cho khách hàng.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3 class="value-title">Chất lượng</h3>
                        <p class="value-description">Cam kết mang đến dịch vụ chất lượng cao và trải nghiệm tuyệt vời.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h3 class="value-title">Tin cậy</h3>
                        <p class="value-description">Xây dựng mối quan hệ dựa trên sự tin cậy và minh bạch.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3 class="value-title">Sáng tạo</h3>
                        <p class="value-description">Luôn đổi mới và sáng tạo để mang đến trải nghiệm độc đáo.</p>
                    </div>
                </div>
            </div>
            
            <div class="team-section">
                <h2 class="team-title">Đội ngũ của chúng tôi</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Nguyễn Văn A" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Nguyễn Văn A</h3>
                            <p class="member-position">Giám đốc điều hành</p>
                            <div class="member-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Trần Thị B" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Trần Thị B</h3>
                            <p class="member-position">Quản lý sự kiện</p>
                            <div class="member-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/men/33.jpg" alt="Lê Văn C" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Lê Văn C</h3>
                            <p class="member-position">Trưởng phòng marketing</p>
                            <div class="member-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-member">
                        <img src="https://randomuser.me/api/portraits/women/33.jpg" alt="Phạm Thị D" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Phạm Thị D</h3>
                            <p class="member-position">Chuyên viên chăm sóc khách hàng</p>
                            <div class="member-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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