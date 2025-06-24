<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Booking - Quản Lý Phòng</title>
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

      .room-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
      }

      .room-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      }
      
      /* Fix modals */
      body.modal-open .room-card {
        transform: none !important;
        box-shadow: none !important;
        transition: none !important;
      }
      
      /* Ensure modals display properly */
      .modal, .modal-dialog, .modal-content {
        transform: none !important;
        transition: opacity 0.15s linear !important;
      }
      
      .room-image {
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 0.375rem;
        border-top-right-radius: 0.375rem;
      }

      .room-capacity {
        position: absolute;
        top: 10px;
        right: 10px;
        background: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 14px;
      }
      
      .file-upload-wrapper {
        position: relative;
        margin-bottom: 5px;
      }
      
      .file-upload-preview {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;
        min-height: 150px;
        border: 1px dashed #ddd;
        border-radius: 4px;
        padding: 5px;
        background-color: #f8f9fa;
      }
      
      .file-upload-preview-item {
        position: relative;
        width: 100%;
        max-width: 200px;
        height: 150px;
        border-radius: 4px;
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        display: flex;
        justify-content: center;
        align-items: center;
      }
      
      .file-upload-preview-item img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
      
      .file-upload-preview.empty::before {
        content: 'Chưa có hình ảnh';
        color: #6c757d;
        text-align: center;
      }
      
      .room-gallery {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 10px;
      }
      
      .room-gallery-item {
        width: 70px;
        height: 70px;
        border-radius: 4px;
        overflow: hidden;
        cursor: pointer;
      }
      
      .room-gallery-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.2s;
      }
      
      .room-gallery-item:hover img {
        transform: scale(1.1);
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
                <h1 class="admin-title">Quản Lý Phòng</h1>
                <div class="user-info d-flex align-items-center">
                  <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
                </div>
              </div>
            </div>
          </div>

          <div class="container-fluid py-4">
            <div class="d-flex justify-content-between mb-4">
              <div>
                <h5>Danh Sách Phòng</h5>
              </div>
              <div>
                <button type="button" class="btn action-btn" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                  <i class="bi bi-plus-circle"></i> Thêm Phòng Mới
                </button>
               
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

            <div class="row">
              <c:forEach items="${rooms}" var="room">
                <div class="col-md-4 mb-4">
                  <div class="card room-card h-100">
                    <div class="position-relative">
                      <img src="${pageContext.request.contextPath}${not empty room.imageUrl ? room.imageUrl : '/resources/images/default-room.jpg'}" 
                           class="room-image card-img-top" 
                           alt="${room.roomName}"
                           onerror="this.src='${pageContext.request.contextPath}/resources/images/default-room.jpg'">
                      <div class="room-capacity">
                        <i class="bi bi-people-fill"></i> ${room.capacity} người
                      </div>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">${room.roomName}</h5>
                      <p class="card-text">${room.description}</p>
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary fw-bold"><fmt:formatNumber value="${room.price}" pattern="#,##0 ₫" /></span>
                      </div>
                      
                      <div class="d-flex justify-content-between mt-3">
                        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editRoomModal${room.id}">
                          <i class="bi bi-pencil"></i> Chỉnh sửa
                        </button>
                        <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteRoomModal${room.id}">
                          <i class="bi bi-trash"></i> Xóa
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Edit Modal for room ${room.id} -->
                <div class="modal fade" id="editRoomModal${room.id}" tabindex="-1" aria-labelledby="editRoomModalLabel${room.id}" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="editRoomModalLabel${room.id}">Chỉnh Sửa Phòng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form action="${pageContext.request.contextPath}/admin/rooms/update" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                          <input type="hidden" name="id" value="${room.id}">
                          
                          <div class="mb-3">
                            <label for="name${room.id}" class="form-label">Tên Phòng</label>
                            <input type="text" class="form-control" id="name${room.id}" name="name" value="${room.roomName}" required>
                          </div>
                          
                          <div class="mb-3">
                            <label for="description${room.id}" class="form-label">Mô Tả</label>
                            <textarea class="form-control" id="description${room.id}" name="description" rows="3">${room.description}</textarea>
                          </div>
                          
                          <div class="mb-3">
                            <label for="capacity${room.id}" class="form-label">Sức Chứa (người)</label>
                            <input type="number" class="form-control" id="capacity${room.id}" name="capacity" value="${room.capacity}" required min="1">
                          </div>
                          
                          <div class="mb-3">
                            <label for="price${room.id}" class="form-label">Giá Thuê</label>
                            <input type="number" class="form-control" id="price${room.id}" name="price" value="${room.price}" required min="0">
                          </div>
                          
                          <div class="mb-3">
                            <label class="form-label">Hình Ảnh</label>
                            <div class="file-upload-wrapper" data-existing-image="${pageContext.request.contextPath}${not empty room.imageUrl ? room.imageUrl : '/resources/images/default-room.jpg'}">
                              <div class="file-upload-preview" id="imagePreview${room.id}">
                                <div class="file-upload-preview-item">
                                  <img src="${pageContext.request.contextPath}${not empty room.imageUrl ? room.imageUrl : '/resources/images/default-room.jpg'}" alt="${room.roomName}" onerror="this.src='${pageContext.request.contextPath}/resources/images/default-room.jpg'">
                                </div>
                              </div>
                              <input type="file" class="form-control mt-2" id="imageFile${room.id}" name="imageFile" accept="image/*" onchange="previewImage(this)">
                              <div class="form-text">Chọn hình ảnh mới. Để trống nếu không muốn thay đổi hình ảnh.</div>
                            </div>
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
                
                <!-- Delete Modal for room ${room.id} -->
                <div class="modal fade" id="deleteRoomModal${room.id}" tabindex="-1" aria-labelledby="deleteRoomModalLabel${room.id}" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="deleteRoomModalLabel${room.id}">Xác Nhận Xóa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa phòng "${room.roomName}"?</p>
                        <p class="text-danger">Lưu ý: Việc xóa phòng sẽ ảnh hưởng đến các đơn đặt phòng hiện có.</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <a href="${pageContext.request.contextPath}/admin/rooms/delete/${room.id}" class="btn btn-danger">Xóa</a>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
              
              <c:if test="${empty rooms}">
                <div class="col-12">
                  <div class="alert alert-info" role="alert">
                    <i class="bi bi-info-circle me-2"></i> Chưa có phòng nào được thêm vào hệ thống.
                  </div>
                </div>
              </c:if>
            </div>
          </div>
        </main>
      </div>
    </div>
    
    <!-- Add Room Modal -->
    <div class="modal fade" id="addRoomModal" tabindex="-1" aria-labelledby="addRoomModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addRoomModalLabel">Thêm Phòng Mới</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/rooms/add" method="post" enctype="multipart/form-data">
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Tên Phòng</label>
                <input type="text" class="form-control" id="name" name="name" required>
              </div>
              
              <div class="mb-3">
                <label for="description" class="form-label">Mô Tả</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
              </div>
              
              <div class="mb-3">
                <label for="capacity" class="form-label">Sức Chứa (người)</label>
                <input type="number" class="form-control" id="capacity" name="capacity" required min="1">
              </div>
              
              <div class="mb-3">
                <label for="price" class="form-label">Giá Thuê</label>
                <input type="number" class="form-control" id="price" name="price" required min="0">
              </div>
              
              <div class="mb-3">
                <label for="imageFile" class="form-label">Hình Ảnh</label>
                <div class="file-upload-wrapper">
                  <div class="file-upload-preview empty" id="imagePreview"></div>
                  <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(this)" required>
                  <div class="form-text">Chọn hình ảnh cho phòng.</div>
                </div>
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
    
    <!-- Assign Rooms to TimeSlots Modal -->
    <div class="modal fade" id="assignRoomsModal" tabindex="-1" aria-labelledby="assignRoomsModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="assignRoomsModalLabel">Gán Phòng Cho Khung Giờ</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/rooms/assign-timeslots" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="timeSlotId" class="form-label">Khung Giờ</label>
                <select class="form-select" id="timeSlotId" name="timeSlotId" required>
                  <option value="">Chọn khung giờ</option>
                  <c:forEach items="${timeSlots}" var="timeSlot">
                    <option value="${timeSlot.id}">${timeSlot.startTime} - ${timeSlot.endTime}</option>
                  </c:forEach>
                </select>
              </div>
              
              <div class="mb-3">
                <label class="form-label">Chọn Phòng Khả Dụng</label>
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <c:forEach items="${rooms}" var="room">
                        <div class="col-md-4 mb-2">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="${room.id}" id="room${room.id}" name="roomIds">
                            <label class="form-check-label" for="room${room.id}">
                              ${room.roomName}
                            </label>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              <button type="submit" class="btn action-btn">Lưu Cấu Hình</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
  function previewImage(input) {
    const previewContainer = input.closest('.file-upload-wrapper').querySelector('.file-upload-preview');

    if (!previewContainer) return;

    // Xóa nội dung cũ
    previewContainer.innerHTML = '';

    if (input.files && input.files[0]) {
      const file = input.files[0];

      // Kiểm tra có phải ảnh không
      if (!file.type.startsWith('image/')) {
        previewContainer.innerHTML = `
          <div class="text-danger">Vui lòng chọn tệp hình ảnh hợp lệ.</div>
        `;
        previewContainer.classList.remove('empty');
        return;
      }

      const reader = new FileReader();

      reader.onload = function () {
        const img = new Image();
        img.src = reader.result;
        img.alt = 'Preview';
        img.style.maxWidth = '100%';
        img.style.height = 'auto';
        img.onerror = function () {
          previewContainer.innerHTML = `
            <div class="text-danger">Không thể hiển thị hình ảnh. Vui lòng chọn hình khác.</div>
          `;
        };

        previewContainer.innerHTML = '';
        const wrapper = document.createElement('div');
        wrapper.className = 'file-upload-preview-item';
        wrapper.appendChild(img);
        previewContainer.appendChild(wrapper);
        previewContainer.classList.remove('empty');
      };

      reader.readAsDataURL(file);
    } else {
      // Không có file nào được chọn
      previewContainer.classList.add('empty');
    }
  }
</script>

  </body>
</html> 