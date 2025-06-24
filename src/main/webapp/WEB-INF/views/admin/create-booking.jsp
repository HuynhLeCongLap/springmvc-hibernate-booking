<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cinema Booking - Tạo Đơn Đặt Phòng Mới</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
    .badge.status-badge {
      padding: 6px 10px;
      font-weight: 500;
    }
    .status-pending {
      background-color: #ffc107;
      color: #212529;
    }
    .status-confirmed {
      background-color: #28a745;
      color: white;
    }
    .status-cancelled {
      background-color: #dc3545;
      color: white;
    }
    .status-cancelled-user {
      background-color: #ff9800;
      color: white;
    }
    .status-cancelled-admin {
      background-color: #9c27b0;
      color: white;
    }
    .booking-details {
      display: none;
      margin-top: 10px;
      padding: 10px;
      background-color: #f8f9fa;
      border-radius: 4px;
    }
    .booking-row {
      cursor: pointer;
      transition: background-color 0.2s;
    }
    .booking-row:hover {
      background-color: rgba(0, 0, 0, 0.05);
    }
    .filters {
      background-color: white;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }
    @media (max-width: 768px) {
      #sidebar {
        min-height: auto;
      }
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
            <h1 class="admin-title">Tạo Đơn Đặt Phòng Mới</h1>
            <div class="user-info d-flex align-items-center">
              <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid py-4">
        <form action="${pageContext.request.contextPath}/admin/create-booking" method="post">
          <div class="mb-3">
            <label for="userId" class="form-label">Khách hàng</label>
            <select class="form-select" id="userId" name="userId" required>
              <option value="">-- Chọn khách hàng --</option>
              <c:forEach items="${users}" var="user">
                <option value="${user.id}">${user.fullName} - ${user.numberPhone}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3">
            <label for="roomId" class="form-label">Phòng</label>
            <select class="form-select" id="roomId" name="roomId" required>
              <option value="">-- Chọn phòng --</option>
              <c:forEach items="${rooms}" var="room">
                <option value="${room.id}">${room.roomName} (Sức chứa: ${room.capacity})</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3">
            <label for="timeSlotId" class="form-label">Khung giờ</label>
            <select class="form-select" id="timeSlotId" name="timeSlotId" required>
              <option value="">-- Chọn khung giờ --</option>
              <c:forEach items="${timeSlots}" var="slot">
                <option value="${slot.id}">${slot.startTime} - ${slot.endTime}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3">
            <label for="bookingDate" class="form-label">Ngày tổ chức</label>
            <input type="date" class="form-control" id="bookingDate" name="bookingDate" required min="${now}">
          </div>
          <div class="mb-3">
            <label for="decorationStyleId" class="form-label">Phong cách trang trí</label>
            <select class="form-select" id="decorationStyleId" name="decorationStyleId" required>
              <option value="">-- Chọn phong cách --</option>
              <c:forEach items="${decorationStyles}" var="style">
                <option value="${style.id}">${style.name}</option>
              </c:forEach>
            </select>
          </div>
          <button type="submit" class="btn btn-success"><i class="fas fa-plus-circle"></i> Tạo Đặt Phòng</button>
          <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-secondary ms-2">Quay lại</a>
        </form>
      </div>
    </main>
  </div>
</div>
</body>
</html> 