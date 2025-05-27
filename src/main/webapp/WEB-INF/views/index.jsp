<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Booking - Trang chủ</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search-results.css">
    <style>
      /* Reset CSS */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        line-height: 1.6;
        color: #333;
        background-color: #f8f9fa;
      }

      .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
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
      }

      /* Banner Styles */
      .banner {
        margin: 20px 0 40px;
        position: relative;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      }

      .banner-image {
        width: 100%;
        height: 450px;
        object-fit: cover;
        transition: transform 10s ease;
      }
      
      .banner:hover .banner-image {
        transform: scale(1.05);
      }
      
      .banner-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.6));
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        padding: 40px;
      }
      
      .banner-title {
        color: white;
        font-size: 2.5rem;
        margin-bottom: 10px;
        text-shadow: 0 2px 4px rgba(0,0,0,0.5);
      }
      
      .banner-subtitle {
        color: rgba(255,255,255,0.9);
        font-size: 1.2rem;
        max-width: 600px;
        text-shadow: 0 1px 2px rgba(0,0,0,0.5);
      }

      /* Search Form */
      .search-section {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
        transform: translateY(-50px);
        position: relative;
        z-index: 10;
      }

      .search-title {
        margin-bottom: 25px;
        color: #1a237e;
        font-size: 26px;
        text-align: center;
        position: relative;
        padding-bottom: 15px;
      }
      
      .search-title:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: #1a237e;
      }

      .search-form {
        display: grid;
        grid-template-columns: 1fr 1fr auto;
        gap: 20px;
        align-items: flex-start;
      }

      .form-group {
        display: flex;
        flex-direction: column;
      }

      .form-group label {
        margin-bottom: 10px;
        font-weight: 500;
        color: #444;
      }
      
      .form-error {
        color: #e53935;
        font-size: 0.85rem;
        margin-top: 5px;
        display: none;
      }

      .form-control {
        padding: 14px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: all 0.3s ease;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
      }
      
      .form-control:focus {
        border-color: #1a237e;
        box-shadow: 0 2px 8px rgba(26, 35, 126, 0.2);
        outline: none;
      }
      
      .form-control.error {
        border-color: #e53935;
      }

      .btn-search {
        background-color: #1a237e;
        color: white;
        border: none;
        padding: 14px 28px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        height: 52px;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(26, 35, 126, 0.2);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 0; /* Reset margin since we're using the label for alignment */
      }

      .btn-search:hover {
        background-color: #0e1442;
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(26, 35, 126, 0.3);
      }
      
      .btn-search i {
        margin-right: 8px;
      }
      
      /* Date error message */
      .date-error {
        color: #e53935;
        background-color: rgba(229, 57, 53, 0.1);
        padding: 10px 15px;
        border-radius: 6px;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
      }
      
      .date-error i {
        margin-right: 10px;
        color: #e53935;
      }
      
      /* Toast notification */
      .toast {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #1a237e;
        color: white;
        padding: 15px 25px;
        border-radius: 6px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        z-index: 1000;
        opacity: 0;
        transform: translateY(-20px);
        transition: all 0.3s ease;
      }
      
      .toast.show {
        opacity: 1;
        transform: translateY(0);
      }

      /* Features Section */
      .features {
        padding: 50px 0;
        background-color: white;
        margin-bottom: 50px;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      }

      .section-title {
        text-align: center;
        margin-bottom: 40px;
        color: #1a237e;
        font-size: 30px;
        position: relative;
        padding-bottom: 15px;
      }
      
      .section-title:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: #1a237e;
      }

      .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
      }

      .feature-card {
        text-align: center;
        padding: 30px 20px;
        transition: all 0.3s ease;
        border-radius: 8px;
      }
      
      .feature-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      }

      .feature-icon {
        font-size: 50px;
        color: #1a237e;
        margin-bottom: 20px;
        transition: all 0.3s ease;
      }
      
      .feature-card:hover .feature-icon {
        transform: scale(1.2);
      }

      .feature-title {
        font-size: 22px;
        margin-bottom: 15px;
        color: #333;
      }

      .feature-description {
        color: #666;
        line-height: 1.7;
      }

      /* Decoration Styles Section */
      .decoration-styles {
        margin-bottom: 40px;
      }

      .styles-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
      }

      .style-card {
        background-color: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
      }

      .style-card:hover {
        transform: translateY(-5px);
      }

      .style-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
      }

      .style-content {
        padding: 20px;
      }

      .style-title {
        font-size: 18px;
        margin-bottom: 10px;
        color: #1a237e;
      }

      .style-description {
        color: #666;
        margin-bottom: 15px;
      }

      .style-price {
        font-weight: bold;
        color: #e91e63;
      }

      /* Footer Styles */
      footer {
        background-color: #1a237e;
        color: white;
        padding: 60px 0 20px;
        margin-top: 50px;
      }

      .footer-content {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 40px;
        margin-bottom: 30px;
      }

      .footer-column h3 {
        margin-bottom: 25px;
        font-size: 22px;
        position: relative;
        padding-bottom: 15px;
      }
      
      .footer-column h3:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 50px;
        height: 2px;
        background-color: rgba(255,255,255,0.3);
      }

      .footer-links {
        list-style: none;
      }

      .footer-links li {
        margin-bottom: 12px;
      }

      .footer-links a {
        color: #ccc;
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
      }

      .footer-links a:hover {
        color: white;
        transform: translateX(5px);
      }
      
      .footer-links a i {
        margin-right: 8px;
        font-size: 12px;
      }

      .contact-info p {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
      }

      .contact-info i {
        margin-right: 15px;
        width: 20px;
      }

      .social-links {
        display: flex;
        gap: 15px;
        margin-top: 20px;
      }

      .social-links a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        transition: all 0.3s ease;
      }

      .social-links a:hover {
        background-color: rgba(255, 255, 255, 0.2);
        transform: translateY(-3px);
      }

      .copyright {
        text-align: center;
        padding-top: 20px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        font-size: 14px;
        color: #ccc;
      }

      /* Search Results */
      .search-results {
        background-color: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        margin-bottom: 50px;
      }

      .results-title {
        margin-bottom: 25px;
        color: #1a237e;
        font-size: 24px;
        position: relative;
        padding-bottom: 15px;
      }
      
      .results-title:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 60px;
        height: 3px;
        background-color: #1a237e;
      }

      .results-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 25px;
      }

      .room-card {
        border: none;
        border-radius: 12px;
        overflow: hidden;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
      }

      .room-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
      }

      .room-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
        transition: all 0.5s ease;
      }
      
      .room-card:hover .room-image {
        transform: scale(1.05);
      }

      .room-content {
        padding: 20px;
      }

      .room-name {
        font-size: 20px;
        margin-bottom: 12px;
        color: #1a237e;
      }

      .room-info {
        margin-bottom: 15px;
        color: #555;
      }

      .room-info span {
        margin-right: 15px;
        display: inline-flex;
        align-items: center;
      }
      
      .room-info i {
        margin-right: 5px;
      }

      .room-price {
        font-weight: bold;
        color: #e91e63;
        margin-bottom: 18px;
        font-size: 20px;
      }
      
      .room-card-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .btn-book {
        display: inline-block;
        background-color: #1a237e;
        color: white;
        padding: 10px 20px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(26, 35, 126, 0.2);
      }

      .btn-book:hover {
        background-color: #0e1442;
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(26, 35, 126, 0.3);
      }
      
      .btn-primary {
        display: inline-block;
        background-color: #1a237e;
        color: white;
        padding: 10px 20px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(26, 35, 126, 0.2);
      }
      
      .btn-primary:hover {
        background-color: #0e1442;
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(26, 35, 126, 0.3);
        color: white;
      }
      
      .price-period {
        font-size: 0.8em;
        color: #777;
      }

      /* Media Queries */
      @media (max-width: 768px) {
        .search-form {
          grid-template-columns: 1fr;
        }
        
        .btn-search {
          margin-top: 0; /* Keep the same alignment on mobile */
        }
        
        .nav-links {
          flex-wrap: wrap;
        }
        
        .banner-title {
          font-size: 1.8rem;
        }
        
        .banner-subtitle {
          font-size: 1rem;
        }
        
        .banner-overlay {
          padding: 20px;
        }
        
        .search-section {
          transform: translateY(-30px);
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
        
        .feature-card {
          margin-bottom: 20px;
        }
        
        .footer-content {
          grid-template-columns: 1fr;
          text-align: center;
        }
        
        .footer-column h3:after {
          left: 50%;
          transform: translateX(-50%);
        }
        
        .contact-info p {
          justify-content: center;
        }
        
        .social-links {
          justify-content: center;
        }
        
        .footer-links a {
          justify-content: center;
        }
      }
    </style>
  </head>
  <body>
    <header>
      <div class="top-header">
        <div class="container">
          <div style="display: flex; align-items: center;">
            <!-- <img src="logo.png" alt="Logo" class="logo" /> -->
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
          <button class="mobile-menu-toggle" id="mobileMenuToggle">
            <i class="fas fa-bars"></i>
          </button>
          <ul class="nav-links" id="navLinks">
            <li class="nav-item active">
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
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/contact"><i class="fas fa-envelope"></i> Liên hệ</a>
            </li>
          </ul>
        </div>
      </nav>
    </header>

    <main class="container">
      <section class="banner">
        <img
          src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
          alt="Birthday Party"
          class="banner-image"
        />
        <div class="banner-overlay">
          <h1 class="banner-title">Tổ chức sinh nhật tại rạp chiếu phim</h1>
          <p class="banner-subtitle">Trải nghiệm độc đáo và khó quên cho bạn và người thân</p>
        </div>
      </section>

      <section class="search-section">
        <h2 class="search-title">Đặt phòng tiệc sinh nhật</h2>
        
        <c:if test="${not empty dateError}">
          <div class="date-error">
            <i class="fas fa-exclamation-circle"></i>
            ${dateError}
          </div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/" method="get" class="search-form" id="bookingSearchForm">
          <div class="form-group">
            <label for="timeSlotId">Khung giờ</label>
            <select id="timeSlotId" name="timeSlotId" class="form-control" required>
              <option value="">Chọn khung giờ</option>
              <c:forEach items="${timeSlots}" var="timeSlot">
                <option value="${timeSlot.id}" ${timeSlotId == timeSlot.id ? 'selected' : ''}>${timeSlot.startTime} - ${timeSlot.endTime}</option>
              </c:forEach>
            </select>
            <div class="form-error" id="timeSlotError">Vui lòng chọn khung giờ</div>
          </div>
          <div class="form-group">
            <label for="bookingDate">Ngày đặt</label>
            <input
              type="date"
              id="bookingDate"
              name="bookingDate"
              class="form-control"
              value="${bookingDate}"
              required
            />
            <div class="form-error" id="dateError">Vui lòng chọn ngày hợp lệ</div>
          </div>
         <div class="form-group">
          <label style="visibility: hidden; display: block; margin-bottom: 10px;">Tìm phòng</label>
          <button type="submit" class="btn-search">
            <i class="fas fa-search"></i> Tìm phòng
          </button>
         </div>
        </form>
      </section>

      <c:if test="${showResults}">
        <section class="search-results">
          <h2 class="results-title">Kết quả tìm kiếm</h2>
          <div class="results-grid">
            <c:choose>
              <c:when test="${empty rooms}">
                <p style="grid-column: 1/-1; text-align: center; padding: 20px; color: #666;">
                  <i class="fas fa-info-circle" style="margin-right: 8px; color: #1a237e;"></i>
                  Không có phòng nào khả dụng cho khung giờ và ngày bạn đã chọn.
                </p>
              </c:when>
              <c:otherwise>
                <c:forEach items="${rooms}" var="room">
                  <div class="room-card">
                   <img src="${pageContext.request.contextPath}${not empty room.imageUrl ? room.imageUrl : '/resources/images/default-room.jpg'}" 
                    alt="${room.roomName}"
                    class="room-image"
                  />
                    <div class="room-content">
                      <h3 class="room-name">${room.roomName}</h3>
                      <div class="room-info">
                        <span><i class="fas fa-users"></i> ${room.capacity} người</span>
                        <span></i> ${room.description}</span>
                      </div>
                      <div class="room-card-footer" style="display: flex; align-items: center; flex-direction: column;">
                        <div class="room-price">
                          <span class="price-value"><fmt:formatNumber value="${room.price}" pattern="#,##0 ₫" /></span>
                          <span class="price-period">/ lần</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/user/select-decoration?roomId=${room.id}&timeSlotId=${timeSlotId}&bookingDate=${bookingDate}" style="width: 100%; text-align: center;" class="btn-primary">
                          <i class="fas fa-calendar-check"></i> Đặt ngay
                        </a>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </div>
        </section>
      </c:if>

      <section class="features">
        <h2 class="section-title">Tại sao chọn Cinema Booking?</h2>
        <div class="features-grid">
          <div class="feature-card">
            <div class="feature-icon">
              <i class="fas fa-film"></i>
            </div>
            <h3 class="feature-title">Trải nghiệm điện ảnh</h3>
            <p class="feature-description">
              Tổ chức sinh nhật trong không gian rạp chiếu phim với màn hình lớn và hệ thống âm thanh chuyên nghiệp.
            </p>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              <i class="fas fa-birthday-cake"></i>
            </div>
            <h3 class="feature-title">Trang trí đẹp mắt</h3>
            <p class="feature-description">
              Nhiều phong cách trang trí sinh nhật đa dạng, phù hợp với mọi lứa tuổi và sở thích.
            </p>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              <i class="fas fa-concierge-bell"></i>
            </div>
            <h3 class="feature-title">Dịch vụ chuyên nghiệp</h3>
            <p class="feature-description">
              Đội ngũ nhân viên chuyên nghiệp, tận tình hỗ trợ từ khâu đặt phòng đến tổ chức sự kiện.
            </p>
          </div>
        </div>
      </section>
    </main>

    <footer>
      <div class="container">
        <div class="footer-content">
          <div class="footer-column">
            <h3>Cinema Booking</h3>
            <p>
              Dịch vụ đặt phòng tiệc sinh nhật tại rạp chiếu phim, mang đến trải nghiệm độc đáo và khó quên cho bạn và người thân.
            </p>
            <div class="social-links">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
          </div>
          <div class="footer-column">
            <h3>Liên kết nhanh</h3>
            <ul class="footer-links">
              <li><a href="${pageContext.request.contextPath}/"><i class="fas fa-chevron-right"></i> Trang chủ</a></li>
              <li><a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-chevron-right"></i> Phòng tiệc</a></li>
              <li><a href="${pageContext.request.contextPath}/decoration-styles"><i class="fas fa-chevron-right"></i> Phong cách trang trí</a></li>
              <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-chevron-right"></i> Về chúng tôi</a></li>
              <li><a href="${pageContext.request.contextPath}/contact"><i class="fas fa-chevron-right"></i> Liên hệ</a></li>
            </ul>
          </div>
          <div class="footer-column contact-info">
            <h3>Thông tin liên hệ</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Nguyễn Văn Linh, Quận 7, TP. HCM</p>
            <p><i class="fas fa-phone"></i> (028) 1234 5678</p>
            <p><i class="fas fa-envelope"></i> info@cinemabooking.com</p>
            <p><i class="fas fa-clock"></i> 08:00 - 22:00, Thứ 2 - Chủ nhật</p>
          </div>
        </div>
        <div class="copyright">
          <p>&copy; 2023 Cinema Booking. All Rights Reserved.</p>
        </div>
      </div>
    </footer>

    <!-- Toast notification container -->
    <div id="toast" class="toast"></div>
    
    <script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('bookingSearchForm');
    const dateInput = document.getElementById('bookingDate');
    const timeSlotSelect = document.getElementById('timeSlotId');
    const dateError = document.getElementById('dateError');
    const timeSlotError = document.getElementById('timeSlotError');
    
    // Mobile menu toggle
    const mobileMenuToggle = document.getElementById('mobileMenuToggle');
    const navLinks = document.getElementById('navLinks');
    
    if (mobileMenuToggle) {
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
    }

    // Set minimum date to today
    const today = new Date();
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');
    const todayString = `${yyyy}-${mm}-${dd}`;
    dateInput.min = todayString;
    
    // If no date value set, set it to today
    if (!dateInput.value) {
      dateInput.value = todayString;
    }
    
    // Function to check if a time slot is in the past for today
    function isTimeSlotValid(timeSlotId, bookingDate) {
      // If not today, all time slots are valid
      const selectedDate = new Date(bookingDate);
      const currentDate = new Date();
      
      if (selectedDate.toDateString() !== currentDate.toDateString()) {
        return true;
      }
      
      // If it's today, check if the time slot has passed
      const timeSlotOption = document.querySelector(`option[value="${timeSlotId}"]`);
      if (!timeSlotOption) return false;
      
      const timeSlotText = timeSlotOption.textContent;
      const startTime = timeSlotText.split(' - ')[0].trim();
      const [hours, minutes] = startTime.split(':').map(Number);
      
      const timeSlotDate = new Date();
      timeSlotDate.setHours(hours, minutes, 0, 0);
      
      return timeSlotDate > currentDate;
    }
    
    // Clear error styling on input change
    dateInput.addEventListener('change', function() {
      this.classList.remove('error');
      dateError.style.display = 'none';
    });
    
    timeSlotSelect.addEventListener('change', function() {
      this.classList.remove('error');
      timeSlotError.style.display = 'none';
    });
    
    // Form validation only on submit
    form.addEventListener('submit', function(event) {
      let isValid = true;
      
      // Validate date (not in the past)
      const selectedDate = new Date(dateInput.value);
      selectedDate.setHours(0, 0, 0, 0);
      
      const currentDate = new Date();
      currentDate.setHours(0, 0, 0, 0);
      
      if (selectedDate < currentDate) {
        dateInput.classList.add('error');
        dateError.style.display = 'block';
        dateError.textContent = 'Không thể chọn ngày trong quá khứ';
        isValid = false;
      } else {
        dateInput.classList.remove('error');
        dateError.style.display = 'none';
      }

      // Validate time slot
      if (!timeSlotSelect.value) {
        timeSlotSelect.classList.add('error');
        timeSlotError.style.display = 'block';
        timeSlotError.textContent = 'Vui lòng chọn khung giờ';
        isValid = false;
      } 
      // Only check time slot validity if date is valid and time slot is selected
      else if (selectedDate >= currentDate && !isTimeSlotValid(timeSlotSelect.value, dateInput.value)) {
        timeSlotSelect.classList.add('error');
        timeSlotError.style.display = 'block';
        timeSlotError.textContent = 'Không thể chọn khung giờ đã qua trong ngày hôm nay';
        isValid = false;
      } else {
        timeSlotSelect.classList.remove('error');
        timeSlotError.style.display = 'none';
      }
      
      if (!isValid) {
        event.preventDefault();
        showToast('Vui lòng kiểm tra lại thông tin đặt phòng');
      }
    });
    
    // Toast notification function
    function showToast(message) {
      const toast = document.getElementById('toast');
      toast.textContent = message;
      toast.classList.add('show');
      
      setTimeout(function() {
        toast.classList.remove('show');
      }, 3000);
    }
  });
</script>
  </body>
</html>
