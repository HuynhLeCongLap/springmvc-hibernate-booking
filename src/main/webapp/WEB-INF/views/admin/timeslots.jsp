<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Booking - Quản Lý Khung Giờ</title>
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
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
          <div class="position-sticky pt-3">
            <div class="d-flex align-items-center justify-content-center mb-4">
              <h3 class="mb-0">Cinema Booking</h3>
            </div>
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
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
                <a class="nav-link active" href="${pageContext.request.contextPath}/admin/timeslots">
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
          <div class="admin-header py-3">
            <div class="container-fluid">
              <div class="d-flex justify-content-between align-items-center">
                <h1 class="admin-title">Quản Lý Khung Giờ</h1>
                <div class="user-info d-flex align-items-center">
                  <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
                </div>
              </div>
            </div>
          </div>

          <div class="container-fluid py-4">
            <div class="row mb-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="card-title mb-0">Danh Sách Khung Giờ</h5>
                      <button type="button" class="btn action-btn" data-bs-toggle="modal" data-bs-target="#addTimeSlotModal">
                        <i class="bi bi-plus-circle"></i> Thêm Khung Giờ Mới
                      </button>
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

                    <div class="table-responsive">
                      <table class="table table-hover align-middle">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>Giờ Bắt Đầu</th>
                            <th>Giờ Kết Thúc</th>
                            <th>Trạng Thái</th>
                            <th>Thao Tác</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${timeSlots}" var="timeSlot">
                            <tr>
                              <td>${timeSlot.id}</td>
                              <td>${timeSlot.startTime}</td>
                              <td>${timeSlot.endTime}</td>
                              <td>
                                <c:choose>
                                  <c:when test="${timeSlot.active}">
                                    <span class="badge bg-success">Hoạt động</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="badge bg-secondary">Không hoạt động</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td>
                                <div class="btn-group" role="group">
                                  <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editTimeSlotModal${timeSlot.id}">
                                    <i class="bi bi-pencil"></i>
                                  </button>
                                  <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteTimeSlotModal${timeSlot.id}">
                                    <i class="bi bi-trash"></i>
                                  </button>
                                </div>
                                
                                <!-- Edit Modal -->
                                <div class="modal fade" id="editTimeSlotModal${timeSlot.id}" tabindex="-1" aria-labelledby="editTimeSlotModalLabel${timeSlot.id}" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="editTimeSlotModalLabel${timeSlot.id}">Chỉnh Sửa Khung Giờ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <form action="${pageContext.request.contextPath}/admin/timeslots/update" method="post">
                                        <div class="modal-body">
                                          <input type="hidden" name="id" value="${timeSlot.id}">
                                          
                                          <div class="mb-3">
                                            <label for="startTime${timeSlot.id}" class="form-label">Giờ Bắt Đầu</label>
                                            <input type="time" class="form-control" id="startTime${timeSlot.id}" name="startTime" value="${timeSlot.startTime}" required>
                                          </div>
                                          
                                          <div class="mb-3">
                                            <label for="endTime${timeSlot.id}" class="form-label">Giờ Kết Thúc</label>
                                            <input type="time" class="form-control" id="endTime${timeSlot.id}" name="endTime" value="${timeSlot.endTime}" required>
                                          </div>
                                          
                                          <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="active${timeSlot.id}" name="active" ${timeSlot.active ? 'checked' : ''}>
                                            <label class="form-check-label" for="active${timeSlot.id}">Hoạt động</label>
                                          </div>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                          <button type="submit" class="btn action-btn">Lưu Thay Đổi</button>
                                        </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                
                                <!-- Delete Modal -->
                                <div class="modal fade" id="deleteTimeSlotModal${timeSlot.id}" tabindex="-1" aria-labelledby="deleteTimeSlotModalLabel${timeSlot.id}" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="deleteTimeSlotModalLabel${timeSlot.id}">Xác Nhận Xóa</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <p>Bạn có chắc chắn muốn xóa khung giờ này? (${timeSlot.startTime} - ${timeSlot.endTime})</p>
                                        <p class="text-danger">Lưu ý: Việc xóa khung giờ có thể ảnh hưởng đến các đơn đặt phòng hiện có.</p>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <a href="${pageContext.request.contextPath}/admin/timeslots/delete/${timeSlot.id}" class="btn btn-danger">Xóa</a>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </td>
                            </tr>
                          </c:forEach>
                          
                          <c:if test="${empty timeSlots}">
                            <tr>
                              <td colspan="5" class="text-center">Không có khung giờ nào.</td>
                            </tr>
                          </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
    
    <!-- Add TimeSlot Modal -->
    <div class="modal fade" id="addTimeSlotModal" tabindex="-1" aria-labelledby="addTimeSlotModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addTimeSlotModalLabel">Thêm Khung Giờ Mới</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/timeslots/add" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="startTime" class="form-label">Giờ Bắt Đầu</label>
                <input type="time" class="form-control" id="startTime" name="startTime" required>
              </div>
              
              <div class="mb-3">
                <label for="endTime" class="form-label">Giờ Kết Thúc</label>
                <input type="time" class="form-control" id="endTime" name="endTime" required>
              </div>
              
              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="active" name="active" checked>
                <label class="form-check-label" for="active">Hoạt động</label>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              <button type="submit" class="btn action-btn">Thêm Mới</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html> 