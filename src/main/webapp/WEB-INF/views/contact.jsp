<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - Cinema Booking</title>
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
        .contact-section {
            margin: 40px 0;
        }
        
        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .page-description {
            text-align: center;
            max-width: 700px;
            margin: 0 auto 40px;
            color: #666;
            font-size: 18px;
        }
        
        .contact-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        
        .contact-form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #1a237e;
            outline: none;
            box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
        }
        
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }
        
        .btn-submit {
            background-color: #1a237e;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
        }
        
        .btn-submit i {
            margin-right: 8px;
        }
        
        .btn-submit:hover {
            background-color: #0e1442;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(26, 35, 126, 0.2);
        }
        
        .contact-info {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .contact-info-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 20px;
        }
        
        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .contact-info-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(26, 35, 126, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #1a237e;
            font-size: 18px;
        }
        
        .contact-info-text {
            flex: 1;
        }
        
        .contact-info-text h3 {
            font-size: 18px;
            margin-bottom: 5px;
            color: #333;
        }
        
        .contact-info-text p {
            color: #666;
            line-height: 1.6;
        }
        
        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(26, 35, 126, 0.1);
            color: #1a237e;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            background-color: #1a237e;
            color: white;
            transform: translateY(-3px);
        }
        
        .map-section {
            margin-top: 40px;
        }
        
        .map-container {
            height: 400px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .map-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        @media (max-width: 768px) {
            .contact-content {
                grid-template-columns: 1fr;
            }
            
            .contact-form {
                order: 2;
            }
            
            .contact-info {
                order: 1;
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
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> Về chúng tôi</a>
                    </li>
                    <li class="nav-item active">
                        <a href="${pageContext.request.contextPath}/contact"><i class="fas fa-envelope"></i> Liên hệ</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <section class="contact-section">
            <h1 class="page-title">Liên Hệ Với Chúng Tôi</h1>
            <p class="page-description">Bạn có câu hỏi hoặc muốn đặt phòng? Hãy liên hệ với chúng tôi qua form bên dưới hoặc thông tin liên hệ.</p>
            
            <div class="contact-content">
                <div class="contact-form">
                    <form action="#" method="post" id="contactForm">
                        <div class="form-group">
                            <label for="name" class="form-label">Họ và tên</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone" class="form-label">Số điện thoại</label>
                            <input type="tel" id="phone" name="phone" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label for="subject" class="form-label">Chủ đề</label>
                            <select id="subject" name="subject" class="form-control" required>
                                <option value="">Chọn chủ đề</option>
                                <option value="booking">Đặt phòng</option>
                                <option value="info">Thông tin chung</option>
                                <option value="feedback">Góp ý</option>
                                <option value="other">Khác</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="message" class="form-label">Nội dung</label>
                            <textarea id="message" name="message" class="form-control" required></textarea>
                        </div>
                        
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-paper-plane"></i> Gửi tin nhắn
                        </button>
                    </form>
                </div>
                
                <div class="contact-info">
                    <h2 class="contact-info-title">Thông tin liên hệ</h2>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="contact-info-text">
                            <h3>Địa chỉ</h3>
                            <p>123 Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <div class="contact-info-text">
                            <h3>Điện thoại</h3>
                            <p>(028) 1234 5678</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="contact-info-text">
                            <h3>Email</h3>
                            <p>info@cinemabooking.com</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="contact-info-text">
                            <h3>Giờ làm việc</h3>
                            <p>Thứ 2 - Chủ nhật: 08:00 - 22:00</p>
                        </div>
                    </div>
                    
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
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
            
            // Form submission (for demo purposes)
            const contactForm = document.getElementById('contactForm');
            if (contactForm) {
                contactForm.addEventListener('submit', function(e) {
                    e.preventDefault();
                    alert('Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi trong thời gian sớm nhất!');
                    contactForm.reset();
                });
            }
        });
    </script>
</body>
</html> 