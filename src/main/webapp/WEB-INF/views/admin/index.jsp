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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
</head>
<body>
<div class="container-fluid">
  <div class="row" >
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/components/nav-admin.jsp" />

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
            <i class="bi bi-calendar-check"></i> Đặt phòng hôm nay
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
                        <td>${booking.id}</td>
                        <td>${booking.user != null ? booking.user.fullName : ''}</td>
                        <td>${booking.room != null ? booking.room.roomName : ''}</td>
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
