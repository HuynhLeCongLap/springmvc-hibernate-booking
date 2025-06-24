<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Booking - Quản Lý Đặt Phòng</title>
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
                <h1 class="admin-title">Quản Lý Đặt Phòng</h1>
                <div class="user-info d-flex align-items-center">
                  <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
                </div>
              </div>
            </div>
          </div>

          <div class="container-fluid py-4">
            <div class="filters mb-4">
              <div class="row">
                <div class="col-md-3 mb-3">
                  <label for="dateFilter" class="form-label">Ngày đặt phòng</label>
                  <input type="date" class="form-control" id="dateFilter" name="dateFilter" value="${dateFilter}">
                </div>
                <div class="col-md-3 mb-3">
                  <label for="statusFilter" class="form-label">Trạng thái</label>
                  <select class="form-select" id="statusFilter" name="statusFilter">
                    <option value="">Tất cả trạng thái</option>
                    <option value="PENDING" ${statusFilter == 'PENDING' ? 'selected' : ''}>Chờ xác nhận</option>
                    <option value="CONFIRMED" ${statusFilter == 'CONFIRMED' ? 'selected' : ''}>Đã xác nhận</option>
                    <option value="CANCELLED_BY_USER" ${statusFilter == 'CANCELLED_BY_USER' ? 'selected' : ''}>Đã hủy bởi người dùng</option>
                    <option value="CANCELLED_BY_ADMIN" ${statusFilter == 'CANCELLED_BY_ADMIN' ? 'selected' : ''}>Đã hủy bởi quản trị viên</option>
                  </select>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="roomFilter" class="form-label">Phòng</label>
                  <select class="form-select" id="roomFilter" name="roomFilter">
                    <option value="">Tất cả phòng</option>
                    <c:forEach items="${rooms}" var="room">
                      <option value="${room.id}" ${roomFilter == room.id ? 'selected' : ''}>${room.roomName}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-3 mb-3 d-flex align-items-end">
                  <button type="button" id="applyFilters" class="btn action-btn w-100">
                    <i class="bi bi-funnel"></i> Lọc
                  </button>
                </div>
              </div>
            </div>
            
            <c:if test="${not empty successMessage}">
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
            </c:if>
            
            <c:if test="${not empty errorMessage}">
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
            </c:if>

            <div class="table-container">
              <div class="section-title d-flex justify-content-between align-items-center">
                <span><i class="bi bi-calendar-check"></i> Danh Sách Đặt Phòng</span>
                <a href="${pageContext.request.contextPath}/admin/create-booking" class="btn btn-primary">
                  <i class="bi bi-plus-circle"></i> Đặt phòng mới
                </a>
              </div>
              
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Khách hàng</th>
                      <th scope="col">Phòng</th>
                      <th scope="col">Ngày đặt</th>
                      <th scope="col">Khung giờ</th>
                      <th scope="col">Trang trí</th>
                      <th scope="col">Tổng tiền</th>
                      <th scope="col">Trạng thái</th>
                      <th scope="col">Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${bookings}" var="booking">
                      <tr class="booking-row" data-id="${booking.id}">
                        <td>${booking.id}</td>
                        <td>${booking.user.fullName}</td>
                        <td>${booking.room.roomName}</td>
                        <td><fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></td>
                        <td>${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</td>
                        <td>${booking.decorationStyle.name}</td>
                        <td><fmt:formatNumber value="${booking.totalPrice}" pattern="#,##0 ₫" /></td>
                        <td>
                          <c:choose>
                            <c:when test="${booking.status == 'PENDING'}">
                              <span class="badge status-badge status-pending">Chờ xác nhận</span>
                            </c:when>
                            <c:when test="${booking.status == 'CONFIRMED'}">
                              <span class="badge status-badge status-confirmed">Đã xác nhận</span>
                            </c:when>
                            <c:when test="${booking.status == 'CANCELLED_BY_USER'}">
                              <span class="badge status-badge status-cancelled-user">Đã hủy bởi người dùng</span>
                            </c:when>
                            <c:when test="${booking.status == 'CANCELLED_BY_ADMIN'}">
                              <span class="badge status-badge status-cancelled-admin">Đã hủy bởi quản trị viên</span>
                            </c:when>
                          </c:choose>
                        </td>
                        <td>
                          <div class="btn-group">
                            <c:if test="${booking.status == 'PENDING'}">
                              <a href="${pageContext.request.contextPath}/admin/bookings/confirm/${booking.id}" class="btn btn-sm btn-success me-1" title="Xác nhận đặt phòng">
                                <i class="bi bi-check-circle"></i>
                              </a>
                              <a href="${pageContext.request.contextPath}/admin/bookings/reject/${booking.id}" class="btn btn-sm btn-danger me-1" title="Từ chối đặt phòng">
                                <i class="bi bi-x-circle"></i>
                              </a>
                            </c:if>
                            <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#bookingDetailsModal${booking.id}" title="Xem chi tiết">
                              <i class="bi bi-eye"></i>
                            </button>
                          </div>
                        </td>
                      </tr>
                      
                      <!-- Booking Details Modal -->
                      <div class="modal fade" id="bookingDetailsModal${booking.id}" tabindex="-1" aria-labelledby="bookingDetailsModalLabel${booking.id}" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="bookingDetailsModalLabel${booking.id}">Chi Tiết Đặt Phòng #${booking.id}</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col-md-6">
                                  <h6 class="mb-3">Thông Tin Đặt Phòng</h6>
                                  <p><strong>Ngày đặt:</strong> <fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></p>
                                  <p><strong>Ngày nhận phòng:</strong> <fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></p>
                                  <p><strong>Khung giờ:</strong> ${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</p>
                                  <p><strong>Trạng thái:</strong> 
                                    <c:choose>
                                      <c:when test="${booking.status == 'PENDING'}">
                                        <span class="badge status-badge status-pending">Chờ xác nhận</span>
                                      </c:when>
                                      <c:when test="${booking.status == 'CONFIRMED'}">
                                        <span class="badge status-badge status-confirmed">Đã xác nhận</span>
                                      </c:when>
                                      <c:when test="${booking.status == 'CANCELLED_BY_USER'}">
                                        <span class="badge status-badge status-cancelled-user">Đã hủy bởi người dùng</span>
                                      </c:when>
                                      <c:when test="${booking.status == 'CANCELLED_BY_ADMIN'}">
                                        <span class="badge status-badge status-cancelled-admin">Đã hủy bởi quản trị viên</span>
                                      </c:when>
                                    </c:choose>
                                  </p>
                                </div>
                                <div class="col-md-6">
                                  <h6 class="mb-3">Thông Tin Khách Hàng</h6>
                                  <p><strong>Họ tên:</strong> ${booking.user.fullName}</p>
                                  <p><strong>Số điện thoại:</strong> ${booking.user.numberPhone}</p>
                                </div>
                              </div>
                              
                              <hr/>
                              
                              <div class="row">
                                <div class="col-md-6">
                                  <h6 class="mb-3">Thông Tin Phòng</h6>
                                  <p><strong>Tên phòng:</strong> ${booking.room.roomName}</p>
                                  <p><strong>Sức chứa:</strong> ${booking.room.capacity} người</p>
                                  <p><strong>Giá phòng:</strong> <fmt:formatNumber value="${booking.room.price}" pattern="#,##0 ₫" /></p>
                                </div>
                                <div class="col-md-6">
                                  <h6 class="mb-3">Thông Tin Trang Trí</h6>
                                  <p><strong>Phong cách:</strong> ${booking.decorationStyle.name}</p>
                                  <p><strong>Mô tả:</strong> ${booking.decorationStyle.description}</p>
                                </div>
                              </div>
                              
                              <hr/>
                              
                              <div class="row">
                                <div class="col-md-12">
                                  <h6 class="mb-3">Thông Tin Thanh Toán</h6>
                                  <p><strong>Phương thức thanh toán:</strong> ${booking.paymentInfo}</p>
                                  <p><strong>Số tiền thanh toán:</strong> <fmt:formatNumber value="${booking.totalPrice}" pattern="#,##0 ₫" /></p>
                                  </div>
                                </div>
                              </div>
                            </div>
                           
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                    
                    <c:if test="${empty bookings}">
                      <tr>
                        <td colspan="9" class="text-center py-4">
                          <div class="d-flex flex-column align-items-center">
                            <i class="bi bi-calendar-x text-muted" style="font-size: 3rem;"></i>
                            <p class="mt-3 text-muted">Không có đơn đặt phòng nào phù hợp với bộ lọc.</p>
                            <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-sm btn-outline-primary mt-2">
                              <i class="bi bi-arrow-counterclockwise"></i> Xem tất cả đơn đặt phòng
                            </a>
                          </div>
                        </td>
                      </tr>
                    </c:if>
                  </tbody>
                </table>
              </div>
              
              <!-- Pagination -->
              <c:if test="${totalPages > 1}">
                <nav aria-label="Page navigation">
                  <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                      <a class="page-link" href="${pageContext.request.contextPath}/admin/bookings?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    
                    <c:forEach begin="1" end="${totalPages}" var="i">
                      <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/bookings?page=${i}">${i}</a>
                      </li>
                    </c:forEach>
                    
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                      <a class="page-link" href="${pageContext.request.contextPath}/admin/bookings?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </c:if>
            </div>
          </div>
        </main>
      </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('applyFilters').addEventListener('click', function() {
          const dateFilter = document.getElementById('dateFilter').value;
          const statusFilter = document.getElementById('statusFilter').value;
          const roomFilter = document.getElementById('roomFilter').value;
          
          let url = '${pageContext.request.contextPath}/admin/bookings?';
          if (dateFilter) url += 'date=' + dateFilter + '&';
          if (statusFilter) url += 'status=' + statusFilter + '&';
          if (roomFilter) url += 'roomId=' + roomFilter;
          
          window.location.href = url;
        });
      });
    </script>
  </body>
</html> 