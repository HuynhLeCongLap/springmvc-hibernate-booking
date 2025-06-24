<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Báo cáo thống kê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
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
      
      #sidebar {
        background-color: #1a237e;
        min-height: 100vh;
        color: white;
        transition: all 0.3s;
      }
      
      #sidebar .nav-link {
        color: rgba(255, 255, 255, 0.8);
        padding: 12px 20px;
        border-left: 3px solid transparent;
        transition: all 0.2s;
      }
      
      #sidebar .nav-link:hover {
        color: white;
        background-color: rgba(255, 255, 255, 0.1);
        border-left: 3px solid #e91e63;
      }
      
      #sidebar .nav-link.active {
        color: white;
        background-color: rgba(255, 255, 255, 0.1);
        border-left: 3px solid #e91e63;
      }
      
      #sidebar .nav-link i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
      }
      
      .admin-header {
        background-color: #1a237e;
        color: white;
        padding: 15px 0;
        margin-bottom: 20px;
      }
      
      .admin-title {
        font-weight: bold;
        font-size: 24px;
        margin: 0;
      }
      
      .action-btn {
        background-color: #1a237e;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 10px 20px;
        font-weight: 500;
        transition: all 0.2s;
      }
      
      .action-btn:hover {
        background-color: #0e1442;
        color: white;
      }
      
      .action-btn i {
        margin-right: 8px;
      }
      
      .table-container {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        padding: 20px;
        margin-bottom: 30px;
      }
      
      .section-title {
        font-size: 18px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
      }
      
      .section-title i {
        margin-right: 10px;
        color: #1a237e;
      }
      
      .filter-section {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        padding: 20px;
        margin-bottom: 30px;
      }
      
      .stat-card {
        border: none;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
      }
      
      .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      }
      
      .card-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background-color: #1a237e;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
      }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="/WEB-INF/components/nav-admin.jsp" />

            <!-- Main content -->
            <main class="col-md-9 ms-sm-auto col-lg-10" style="padding-left: 0px !important; padding-right: 0px !important;">
                <div class="admin-header py-3">
                    <div class="container-fluid">
                        <div class="d-flex justify-content-between align-items-center">
                            <h1 class="admin-title">Báo cáo thống kê</h1>
                            <div class="user-info d-flex align-items-center">
                                <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid py-4">
                    <!-- Date range filter -->
                    <div class="filter-section mb-4">
                        <h2 class="section-title"><i class="bi bi-calendar-range"></i> Lọc theo thời gian</h2>
                        <form action="${pageContext.request.contextPath}/admin/reports" method="get" class="row g-3">
                            <div class="col-md-4">
                                <label for="startDate" class="form-label">Từ ngày</label>
                                <input type="date" name="startDate" id="startDate" class="form-control" 
                                       value="<fmt:formatDate value='${startDate}' pattern='yyyy-MM-dd' />">
                            </div>
                            <div class="col-md-4">
                                <label for="endDate" class="form-label">Đến ngày</label>
                                <input type="date" name="endDate" id="endDate" class="form-control" 
                                       value="<fmt:formatDate value='${endDate}' pattern='yyyy-MM-dd' />">
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn action-btn">
                                    <i class="bi bi-search me-2"></i>Lọc kết quả
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Statistics cards -->
                    <div class="row mb-4">
                        <div class="col-md-3 mb-3">
                            <div class="card stat-card h-100">
                                <div class="card-body d-flex align-items-center">
                                    <div class="card-icon me-3">
                                        <i class="bi bi-calendar-check"></i>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Tổng số đặt phòng</h6>
                                        <h2 class="card-title mb-0">${totalBookings}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card stat-card h-100">
                                <div class="card-body d-flex align-items-center">
                                    <div class="card-icon me-3" style="background-color: #28a745;">
                                        <i class="bi bi-check-circle"></i>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Đã xác nhận</h6>
                                        <h2 class="card-title mb-0">${confirmedBookings}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card stat-card h-100">
                                <div class="card-body d-flex align-items-center">
                                    <div class="card-icon me-3" style="background-color: #ffc107;">
                                        <i class="bi bi-hourglass-split"></i>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Đang chờ xử lý</h6>
                                        <h2 class="card-title mb-0">${pendingBookings}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card stat-card h-100">
                                <div class="card-body d-flex align-items-center">
                                    <div class="card-icon me-3" style="background-color: #dc3545;">
                                        <i class="bi bi-x-circle"></i>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Đã hủy</h6>
                                        <h2 class="card-title mb-0">${cancelledBookings}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Popular decoration styles -->
                    <div class="table-container">
                        <h2 class="section-title"><i class="bi bi-palette"></i> Phong cách trang trí phổ biến</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Phong cách</th>
                                        <th>Số lần đặt</th>
                                        <th>Tỷ lệ</th>
                                        <th>Phổ biến</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="style" items="${decorationStyles}">
                                        <c:set var="bookingCount" value="0" />
                                        <c:forEach var="booking" items="${bookings}">
                                            <c:if test="${booking.decorationStyle.id == style.id}">
                                                <c:set var="bookingCount" value="${bookingCount + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        <c:set var="percentage" value="${totalBookings > 0 ? (bookingCount * 100 / totalBookings) : 0}" />
                                        <tr>
                                            <td>${style.name}</td>
                                            <td>${bookingCount}</td>
                                            <td><fmt:formatNumber value="${percentage}" pattern="#.##" />%</td>
                                            <td style="width: 30%">
                                                <div class="progress">
                                                    <div class="progress-bar bg-info" role="progressbar" 
                                                         style="width: ${percentage}%"
                                                         aria-valuenow="${percentage}" 
                                                         aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Recent bookings -->
                    <div class="table-container">
                        <h2 class="section-title"><i class="bi bi-clock-history"></i> Đặt phòng gần đây</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã đặt</th>
                                        <th>Khách hàng</th>
                                        <th>Phòng</th>
                                        <th>Ngày đặt</th>
                                        <th>Ngày sử dụng</th>
                                        <th>Trạng thái</th>
                                        <th>Giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="booking" items="${bookings}" begin="0" end="9">
                                        <tr>
                                            <td>#${booking.id}</td>
                                            <td>${booking.user.fullName}</td>
                                            <td>${booking.room.name}</td>
                                            <td><fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy HH:mm" /></td>
                                            <td><fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${booking.status == 'CONFIRMED'}">
                                                        <span class="badge bg-success">Đã xác nhận</span>
                                                    </c:when>
                                                    <c:when test="${booking.status == 'PENDING'}">
                                                        <span class="badge bg-warning text-dark">Chờ xác nhận</span>
                                                    </c:when>
                                                    <c:when test="${booking.status == 'CANCELLED'}">
                                                        <span class="badge bg-danger">Đã hủy</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td><fmt:formatNumber value="${booking.totalPrice}" pattern="#,##0 ₫" /></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${bookings.size() > 10}">
                                <div class="text-center mt-3">
                                    <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-outline-primary">
                                        <i class="bi bi-list"></i> Xem tất cả
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 