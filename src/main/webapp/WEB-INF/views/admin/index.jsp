<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
                                                                         uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Cinema Booking - Trang Quản Trị</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
  />
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

    .stat-card {
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      transition: transform 0.3s;
      border-left: 4px solid #1a237e;
    }

    .stat-card:hover {
      transform: translateY(-5px);
    }

    .card-icon {
      font-size: 2rem;
      color: #1a237e;
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

    .welcome-message {
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 20px;
      color: #343a40;
    }

    .welcome-message span {
      color: #1a237e;
    }

    .action-links {
      margin-bottom: 30px;
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
  <div class="row" >
    <!-- Sidebar -->
    <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
      <div class="position-sticky pt-3">
        <div class="d-flex align-items-center justify-content-center mb-4">
          <h3 class="mb-0">Cinema Booking</h3>
        </div>
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="${pageContext.request.contextPath}/admin/">
              <i class="bi bi-speedometer2"></i> Tổng quan
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/bookings">
              <i class="bi bi-calendar-check"></i> Quản lý đặt phòng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/rooms">
              <i class="bi bi-grid"></i> Quản lý phòng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/timeslots">
              <i class="bi bi-clock"></i> Quản lý khung giờ
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/decorations">
              <i class="bi bi-palette"></i> Quản lý trang trí
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/reports">
              <i class="bi bi-bar-chart"></i> Báo cáo
            </a>
          </li>
          <li class="nav-item mt-4">
            <a class="nav-link" href="${pageContext.request.contextPath}/logout">
              <i class="bi bi-box-arrow-left"></i> Đăng xuất
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Main content -->
    <main class="col-md-9 ms-sm-auto col-lg-10" style="padding-left: 0px !important; padding-right: 0px !important;">
      <div class="admin-header py-3" >
        <div class="container-fluid">
          <div class="d-flex justify-content-between align-items-center">
            <h1 class="admin-title">Bảng Điều Khiển</h1>
            <div class="user-info d-flex align-items-center">
              <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
            </div>
          </div>
        </div>
      </div>

      <div style="padding: 0px 20px;">
        <div class="welcome-message">
          Xin chào, <span>${sessionScope.user.fullName}</span>!
        </div>

        <!-- Stats cards -->
        <div class="row mb-4">
          <div class="col-md-3 mb-3">
            <div class="card stat-card h-100">
              <div class="card-body d-flex align-items-center">
                <div class="card-icon me-3">
                  <i class="bi bi-calendar-check"></i>
                </div>
                <div>
                  <h6 class="card-subtitle mb-2 text-muted">Đặt phòng hôm nay</h6>
                  <h2 class="card-title mb-0">${bookingsToday}</h2>
                </div>
              </div>
              <div class="card-footer bg-transparent border-0">
                <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-sm action-btn w-100">
                  <i class="bi bi-eye"></i> Xem chi tiết
                </a>
              </div>
            </div>
          </div>

          <div class="col-md-3 mb-3">
            <div class="card stat-card h-100">
              <div class="card-body d-flex align-items-center">
                <div class="card-icon me-3">
                  <i class="bi bi-grid"></i>
                </div>
                <div>
                  <h6 class="card-subtitle mb-2 text-muted">Tổng số phòng</h6>
                  <h2 class="card-title mb-0">${roomsCount}</h2>
                </div>
              </div>
              <div class="card-footer bg-transparent border-0">
                <a href="${pageContext.request.contextPath}/admin/rooms" class="btn btn-sm action-btn w-100">
                  <i class="bi bi-eye"></i> Quản lý phòng
                </a>
              </div>
            </div>
          </div>

          <div class="col-md-3 mb-3">
            <div class="card stat-card h-100">
              <div class="card-body d-flex align-items-center">
                <div class="card-icon me-3">
                  <i class="bi bi-clock"></i>
                </div>
                <div>
                  <h6 class="card-subtitle mb-2 text-muted">Khung giờ</h6>
                  <h2 class="card-title mb-0">${timeSlotsCount}</h2>
                </div>
              </div>
              <div class="card-footer bg-transparent border-0">
                <a href="${pageContext.request.contextPath}/admin/timeslots" class="btn btn-sm action-btn w-100">
                  <i class="bi bi-eye"></i> Quản lý khung giờ
                </a>
              </div>
            </div>
          </div>

          <div class="col-md-3 mb-3">
            <div class="card stat-card h-100">
              <div class="card-body d-flex align-items-center">
                <div class="card-icon me-3">
                  <i class="bi bi-palette"></i>
                </div>
                <div>
                  <h6 class="card-subtitle mb-2 text-muted">Quản lý trang trí</h6>
                  <h2 class="card-title mb-0">${empty stylesCount ? 0 : stylesCount}</h2>
                </div>
              </div>
              <div class="card-footer bg-transparent border-0">
                <a href="${pageContext.request.contextPath}/admin/decorations" class="btn btn-sm action-btn w-100">
                  <i class="bi bi-eye"></i> Quản lý trang trí
                </a>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent bookings -->
        <div class="table-container">
          <div class="section-title">
            <i class="bi bi-calendar-check"></i> Đặt phòng gần đây
          </div>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
              <tr>
                <th>ID</th>
                <th>Người đặt</th>
                <th>Phòng</th>
                <th>Ngày đặt</th>
                <th>Khung giờ</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
              </tr>
              </thead>
              <tbody>
              <c:choose>
                <c:when test="${empty todayBookings}">
                  <tr>
                    <td colspan="7" class="text-center">Không có đặt phòng nào hôm nay</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach items="${todayBookings}" var="booking" varStatus="loop">
                    <c:if test="${loop.index < 5}">
                      <tr>
                        <td colspan="7" style="color:red;">DEBUG: booking = ${booking}</td>
                      </tr>
                      <tr>
                        <td>${booking.id}</td>
                        <td>${booking.user != null ? booking.user.fullName : ''}</td>
                        <td>${booking.room != null ? booking.room.name : ''}</td>
                        <td><fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></td>
                        <td>${booking.timeSlot != null ? booking.timeSlot.startTime : ''} - ${booking.timeSlot != null ? booking.timeSlot.endTime : ''}</td>
                        <td>
                          <c:choose>
                            <c:when test="${booking.status eq 'PENDING'}">
                              <span class="badge bg-warning text-dark status-badge">Chờ xác nhận</span>
                            </c:when>
                            <c:when test="${booking.status eq 'CONFIRMED'}">
                              <span class="badge bg-success status-badge">Đã xác nhận</span>
                            </c:when>
                            <c:when test="${booking.status eq 'CANCELLED'}">
                              <span class="badge bg-danger status-badge">Đã hủy</span>
                            </c:when>
                            <c:when test="${booking.status eq 'REJECTED'}">
                              <span class="badge bg-secondary status-badge">Đã từ chối</span>
                            </c:when>
                            <c:otherwise>
                              <span class="badge bg-info status-badge">${booking.status}</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <div class="d-flex">
                            <c:if test="${booking.status eq 'PENDING'}">
                              <a href="${pageContext.request.contextPath}/admin/bookings/confirm/${booking.id}" class="btn btn-sm btn-success me-1">
                                <i class="bi bi-check-circle"></i>
                              </a>
                              <a href="${pageContext.request.contextPath}/admin/bookings/reject/${booking.id}" class="btn btn-sm btn-danger">
                                <i class="bi bi-x-circle"></i>
                              </a>
                            </c:if>
                          </div>
                        </td>
                      </tr>
                    </c:if>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
              </tbody>
            </table>
          </div>
          <a href="${pageContext.request.contextPath}/admin/bookings" class="btn action-btn">
            <i class="bi bi-list-ul"></i> Xem tất cả đặt phòng
          </a>
        </div>
      </div>
    </main>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>
