<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Sử Đặt Phòng - Cinema Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
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
            left: 20px;
            right: 20px;
            height: 3px;
            background-color: #1a237e;
        }

        .nav-item a:hover {
            color: #1a237e;
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

        /* Main Content Styles */
        main {
            padding: 40px 0;
        }

        .section-title {
            margin-bottom: 30px;
            color: #1a237e;
            font-size: 28px;
            font-weight: bold;
            text-align: center;
        }

        .bookings-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .booking-filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .search-box {
            display: flex;
            flex: 1;
            max-width: 400px;
            margin-right: 20px;
        }

        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
            font-size: 16px;
        }

        .search-btn {
            background-color: #1a237e;
            color: white;
            border: none;
            padding: 0 15px;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }

        .filter-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-btn {
            background-color: white;
            color: #333;
            border: 1px solid #ddd;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s;
            text-decoration: none;
            border-bottom: none;
            box-shadow: none;
        }

        .filter-btn.active {
            background-color: #1a237e;
            color: white;
            border-color: #1a237e;
            border-bottom: none;
            box-shadow: none;
        }

        .filter-btn.active::after {
            display: none !important;
        }

        .bookings-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .booking-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .booking-header {
            background-color: #f8f9fa;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .booking-id {
            font-weight: 500;
        }

        .booking-id .label {
            color: #666;
        }

        .booking-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
        }

        .booking-status i {
            margin-right: 5px;
        }

        .booking-status.PENDING {
            background-color: #fff3cd;
            color: #856404;
        }

        .booking-status.CONFIRMED {
            background-color: #d4edda;
            color: #155724;
        }

        .booking-status.CANCELLED {
            background-color: #f8d7da;
            color: #721c24;
        }

        .booking-status.REJECTED {
            background-color: #e2e3e5;
            color: #383d41;
        }

        .booking-status.CANCELLED_BY_USER {
            background-color: #f8d7da;
            color: #721c24;
        }

        .booking-status.CANCELLED_BY_ADMIN {
            background-color: #f8d7da;
            color: #721c24;
        }

        .booking-body {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .booking-details {
            flex: 2;
            min-width: 300px;
        }

        .room-info {
            margin-bottom: 20px;
        }

        .room-name {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }

        .time-slot {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .time-slot i {
            margin-right: 10px;
            color: #1a237e;
        }

        .date-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .date-info i {
            margin-right: 10px;
            color: #1a237e;
        }

        .decoration-style {
            display: flex;
            align-items: center;
        }

        .decoration-style i {
            margin-right: 10px;
            color: #1a237e;
        }

        .booking-info {
            flex: 1;
            min-width: 200px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .price {
            text-align: right;
            margin-bottom: 20px;
        }

        .amount {
            font-size: 24px;
            font-weight: bold;
            color: #e91e63;
            margin-bottom: 5px;
        }

        .date {
            color: #666;
            font-size: 14px;
        }

        .booking-actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn-pay, .btn-cancel, .btn-view-details, .btn-book-again {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 15px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
            cursor: pointer;
            border: none;
        }

        .btn-pay {
            background-color: #1a237e;
            color: white;
        }

        .btn-pay:hover {
            background-color: #0e1442;
        }

        .btn-cancel {
            background-color: #f8d7da;
            color: #721c24;
        }

        .btn-cancel:hover {
            background-color: #f5c6cb;
        }

        .btn-view-details {
            background-color: #e2e3e5;
            color: #383d41;
        }

        .btn-view-details:hover {
            background-color: #d6d8db;
        }

        .btn-book-again {
            background-color: #d4edda;
            color: #155724;
        }

        .btn-book-again:hover {
            background-color: #c3e6cb;
        }

        .no-bookings {
            text-align: center;
            padding: 40px 20px;
        }

        .no-bookings i {
            font-size: 48px;
            color: #1a237e;
            margin-bottom: 15px;
        }

        .no-bookings p {
            margin-top: 15px;
            font-size: 18px;
            color: #1a237e;
            font-weight: 500;
        }

        .btn-book-now {
            display: inline-block;
            background-color: #1a237e;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .btn-book-now:hover {
            background-color: #0e1442;
        }

        /* Footer Styles */
        footer {
            background-color: #1a237e;
            color: white;
            padding: 40px 0 20px;
            margin-top: 40px;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 20px;
        }

        .footer-column h3 {
            margin-bottom: 20px;
            font-size: 20px;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: white;
        }

        .contact-info p {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .contact-info i {
            margin-right: 10px;
            width: 20px;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 15px;
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
            transition: background-color 0.3s;
        }

        .social-links a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 14px;
            color: #ccc;
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

<main>
    <section class="bookings-section">
        <div class="container">
            <h1 class="section-title">Lịch Sử Đặt Phòng</h1>

            <div class="bookings-container">
                <div class="booking-filters">
                    <div class="search-box">
                        <input type="text" id="searchInput" placeholder="Tìm kiếm theo tên phòng..." class="search-input">
                        <button class="search-btn"><i class="fas fa-search"></i></button>
                    </div>

                    <div class="filter-buttons">
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=all" class="filter-btn${param['filter'] == 'all' || empty param['filter'] ? ' active' : ''}">Tất cả</a>
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=PENDING" class="filter-btn${param['filter'] == 'PENDING' ? ' active' : ''}">Chờ xác nhận</a>
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=CONFIRMED" class="filter-btn${param['filter'] == 'CONFIRMED' ? ' active' : ''}">Đã xác nhận</a>
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=CANCELLED" class="filter-btn${param['filter'] == 'CANCELLED' ? ' active' : ''}">Đã hủy</a>
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=CANCELLED_BY_USER" class="filter-btn${param['filter'] == 'CANCELLED_BY_USER' ? ' active' : ''}">Đã hủy bởi bạn</a>
                        <a href="${pageContext.request.contextPath}/user/bookings?filter=CANCELLED_BY_ADMIN" class="filter-btn${param['filter'] == 'CANCELLED_BY_ADMIN' ? ' active' : ''}">Đã hủy bởi quản trị viên</a>
                    </div>
                </div>

                <div class="bookings-list">
                    <c:choose>
                        <c:when test="${empty bookings}">
                            <div class="no-bookings">
                                <i class="fas fa-calendar-times"></i>
                                <p>Không có đơn đặt phòng nào.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${bookings}" var="booking">
                                <c:choose>
                                    <c:when test="${param['filter'] eq 'CANCELLED' && (booking.status eq 'CANCELLED' || booking.status eq 'CANCELLED_BY_USER' || booking.status eq 'CANCELLED_BY_ADMIN')}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status ${booking.status}">
                                                    <c:choose>
                                                        <c:when test="${booking.status eq 'PENDING'}">
                                                            <i class="far fa-clock"></i> Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CONFIRMED'}">
                                                            <i class="fas fa-check-circle"></i> Đã xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_USER'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_ADMIN'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi quản trị viên
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'REJECTED'}">
                                                            <i class="fas fa-ban"></i> Đã từ chối
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name booking-room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                    <div class="booking-actions">
                                                        <c:choose>
                                                            <c:when test="${(booking.status eq 'PENDING' || booking.status eq 'CONFIRMED') && booking.paymentInfo == null}">
                                                                <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn-cancel">
                                                                    <i class="fas fa-ban"></i> Hủy đặt phòng
                                                                </a>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['filter'] eq 'CANCELLED_BY_USER' && booking.status eq 'CANCELLED_BY_USER'}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status CANCELLED_BY_USER">
                                                    <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['filter'] eq 'CANCELLED_BY_ADMIN' && booking.status eq 'CANCELLED_BY_ADMIN'}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status ${booking.status}">
                                                    <c:choose>
                                                        <c:when test="${booking.status eq 'PENDING'}">
                                                            <i class="far fa-clock"></i> Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CONFIRMED'}">
                                                            <i class="fas fa-check-circle"></i> Đã xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_USER'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_ADMIN'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi quản trị viên
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'REJECTED'}">
                                                            <i class="fas fa-ban"></i> Đã từ chối
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name booking-room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                    <div class="booking-actions">
                                                        <c:choose>
                                                            <c:when test="${(booking.status eq 'PENDING' || booking.status eq 'CONFIRMED') && booking.paymentInfo == null}">
                                                                <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn-cancel">
                                                                    <i class="fas fa-ban"></i> Hủy đặt phòng
                                                                </a>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['filter'] eq 'PENDING' && booking.status eq 'PENDING'}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status ${booking.status}">
                                                    <c:choose>
                                                        <c:when test="${booking.status eq 'PENDING'}">
                                                            <i class="far fa-clock"></i> Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CONFIRMED'}">
                                                            <i class="fas fa-check-circle"></i> Đã xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_USER'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_ADMIN'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi quản trị viên
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'REJECTED'}">
                                                            <i class="fas fa-ban"></i> Đã từ chối
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name booking-room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                    <div class="booking-actions">
                                                        <c:choose>
                                                            <c:when test="${(booking.status eq 'PENDING' || booking.status eq 'CONFIRMED') && booking.paymentInfo == null}">
                                                                <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn-cancel">
                                                                    <i class="fas fa-ban"></i> Hủy đặt phòng
                                                                </a>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['filter'] eq 'CONFIRMED' && booking.status eq 'CONFIRMED'}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status ${booking.status}">
                                                    <c:choose>
                                                        <c:when test="${booking.status eq 'PENDING'}">
                                                            <i class="far fa-clock"></i> Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CONFIRMED'}">
                                                            <i class="fas fa-check-circle"></i> Đã xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_USER'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_ADMIN'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi quản trị viên
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'REJECTED'}">
                                                            <i class="fas fa-ban"></i> Đã từ chối
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name booking-room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                    <div class="booking-actions">
                                                        <c:choose>
                                                            <c:when test="${(booking.status eq 'PENDING' || booking.status eq 'CONFIRMED') && booking.paymentInfo == null}">
                                                                <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn-cancel">
                                                                    <i class="fas fa-ban"></i> Hủy đặt phòng
                                                                </a>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['filter'] eq 'all' || empty param['filter']}">
                                        <div class="booking-card" data-status="${booking.status}">
                                            <div class="booking-header">
                                                <div class="booking-id">
                                                    <span class="label">Mã đặt phòng:</span>
                                                    <span class="value">#${booking.id}</span>
                                                </div>
                                                <div class="booking-status ${booking.status}">
                                                    <c:choose>
                                                        <c:when test="${booking.status eq 'PENDING'}">
                                                            <i class="far fa-clock"></i> Chờ xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CONFIRMED'}">
                                                            <i class="fas fa-check-circle"></i> Đã xác nhận
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_USER'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi bạn
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'CANCELLED_BY_ADMIN'}">
                                                            <i class="fas fa-times-circle"></i> Đã hủy bởi quản trị viên
                                                        </c:when>
                                                        <c:when test="${booking.status eq 'REJECTED'}">
                                                            <i class="fas fa-ban"></i> Đã từ chối
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="booking-body">
                                                <div class="booking-details">
                                                    <div class="room-info">
                                                        <h3 class="room-name booking-room-name"> Tên phòng: ${booking.room.roomName}</h3>
                                                        <div class="time-slot">
                                                            <i class="far fa-clock"></i>
                                                            <span>Khung giờ: ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                                                        </div>
                                                        <div class="date-info">
                                                            <i class="far fa-calendar-alt"></i>
                                                            <span>Ngày nhận phòng: <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                                                        </div>
                                                        <div class="decoration-style">
                                                            <i class="fas fa-birthday-cake"></i>
                                                            <span>Phong cách: ${booking.decorationStyle.name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="booking-info">
                                                    <div class="price">
                                                        <div class="amount"><fmt:formatNumber value="${booking.totalPrice}" pattern="#.###" /> ₫</div>
                                                        <div class="date">Đặt ngày: <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></div>
                                                    </div>
                                                    <div class="booking-actions">
                                                        <c:choose>
                                                            <c:when test="${(booking.status eq 'PENDING' || booking.status eq 'CONFIRMED') && booking.paymentInfo == null}">
                                                                <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn-cancel">
                                                                    <i class="fas fa-ban"></i> Hủy đặt phòng
                                                                </a>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
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
                    <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/rooms">Phòng tiệc</a></li>
                    <li><a href="${pageContext.request.contextPath}/decoration-styles">Phong cách trang trí</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">Về chúng tôi</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Filter buttons functionality
        const filterButtons = document.querySelectorAll('.filter-btn');
        const bookingCards = document.querySelectorAll('.booking-card');

        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all buttons
                filterButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Get filter value
                const filterValue = this.getAttribute('data-filter');

                // Filter booking cards
                bookingCards.forEach(card => {
                    if (filterValue === 'all' || card.getAttribute('data-status') === filterValue) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        // Search functionality
        const searchInput = document.getElementById('searchInput');

        searchInput.addEventListener('input', function() {
            const searchValue = this.value.toLowerCase();

            bookingCards.forEach(card => {
                const roomName = card.querySelector('.booking-room-name').textContent.toLowerCase();

                if (roomName.includes(searchValue)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
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

        function showNoBookingMessage() {
            // Xóa thông báo cũ
            document.querySelectorAll('.no-bookings.dynamic').forEach(e => e.remove());
            // Lấy trạng thái đang lọc
            const activeBtn = document.querySelector('.filter-btn.active');
            if (!activeBtn) return;
            const filter = activeBtn.getAttribute('data-filter');
            // Đếm số booking hiển thị
            const visible = Array.from(document.querySelectorAll('.booking-card'))
                .filter(card => card.style.display !== 'none');
            if (visible.length === 0) {
                let msgText = '';
                switch (filter) {
                    case 'PENDING':
                        msgText = 'Không có đơn đặt phòng nào chờ xác nhận.'; break;
                    case 'CONFIRMED':
                        msgText = 'Không có đơn đặt phòng nào đã xác nhận.'; break;
                    case 'CANCELLED':
                        msgText = 'Không có đơn đặt phòng nào đã hủy.'; break;
                    case 'CANCELLED_BY_USER':
                        msgText = 'Không có đơn đặt phòng nào đã hủy bởi bạn.'; break;
                    case 'CANCELLED_BY_ADMIN':
                        msgText = 'Không có đơn đặt phòng nào đã hủy bởi quản trị viên.'; break;
                    default:
                        msgText = 'Không có đơn đặt phòng nào.';
                }
                const msg = document.createElement('div');
                msg.className = 'no-bookings dynamic';
                msg.innerHTML = `<i class="fas fa-calendar-times" style="font-size:48px"></i><p>${msgText}</p>`;
                document.querySelector('.bookings-list').appendChild(msg);
            }
        }
        // Gọi lại hàm này mỗi khi filter thay đổi
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                setTimeout(showNoBookingMessage, 100); // Đợi filter chạy xong
            });
        });
        // Gọi khi load trang
        showNoBookingMessage();
    });
</script>
</body>
</html> 