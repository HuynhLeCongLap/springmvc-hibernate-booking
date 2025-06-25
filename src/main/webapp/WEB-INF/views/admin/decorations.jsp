<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Booking - Quản Lý Trang Trí</title>
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

      .decoration-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 100%;
      }

      .decoration-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      }
      
      /* Fix modals */
      body.modal-open .decoration-card {
        transform: none !important;
        box-shadow: none !important;
        transition: none !important;
      }
      
      /* Ensure modals display properly */
      .modal, .modal-dialog, .modal-content {
        transform: none !important;
        transition: opacity 0.15s linear !important;
      }

      .decoration-image {
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 0.375rem;
        border-top-right-radius: 0.375rem;
      }
      
      .decoration-gallery {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 10px;
      }
      
      .decoration-gallery-item {
        width: 70px;
        height: 70px;
        border-radius: 4px;
        overflow: hidden;
        cursor: pointer;
      }
      
      .decoration-gallery-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.2s;
      }
      
      .decoration-gallery-item:hover img {
        transform: scale(1.1);
      }
      
      .file-upload-wrapper {
        position: relative;
        margin-bottom: 15px;
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
      
      .file-upload-preview-item .remove-btn {
        position: absolute;
        top: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.5);
        color: white;
        border: none;
        width: 20px;
        height: 20px;
        font-size: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
      }
      
      .file-upload-preview.empty::before {
        content: 'Chưa có hình ảnh';
        color: #6c757d;
        padding: 10px;
        border: 1px dashed #ddd;
        border-radius: 4px;
        width: 100%;
        text-align: center;
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
                <h1 class="admin-title">Quản Lý Trang Trí</h1>
                <div class="user-info d-flex align-items-center">
                  <span class="me-2"><i class="bi bi-person-circle"></i> ${sessionScope.user.fullName}</span>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="container-fluid py-4">
            <div class="d-flex justify-content-between mb-4">
              <div>
                <h5>Danh Sách Phong Cách Trang Trí</h5>
              </div>
              <div>
                <button type="button" class="btn action-btn" data-bs-toggle="modal" data-bs-target="#addDecorationModal">
                  <i class="bi bi-plus-circle"></i> Thêm Phong Cách Mới
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
              <c:forEach items="${decorations}" var="decoration">
                <div class="col-md-4 mb-4">
                  <div class="card decoration-card">
                    <div class="position-relative">
                      <img src="${pageContext.request.contextPath}${not empty decoration.imageUrl ? decoration.imageUrl : '/resources/images/anhvu.png'}" class="decoration-image card-img-top" alt="${decoration.name}">
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">${decoration.name}</h5>
                      <p class="card-text">${decoration.description}</p>
                      
                      <div class="d-flex justify-content-between mt-3">
                        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editDecorationModal${decoration.id}">
                          <i class="bi bi-pencil"></i> Chỉnh sửa
                        </button>
                        <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteDecorationModal${decoration.id}">
                          <i class="bi bi-trash"></i> Xóa
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Edit Modal for decoration ${decoration.id} -->
                <div class="modal fade" id="editDecorationModal${decoration.id}" tabindex="-1" aria-labelledby="editDecorationModalLabel${decoration.id}" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="editDecorationModalLabel${decoration.id}">Chỉnh Sửa Phong Cách Trang Trí</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form action="${pageContext.request.contextPath}/admin/decorations/update" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                          <input type="hidden" name="id" value="${decoration.id}">
                          
                          <div class="mb-3">
                            <label for="name${decoration.id}" class="form-label">Tên Phong Cách <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name${decoration.id}" name="name" value="${decoration.name}" required oninvalid="this.setCustomValidity('Vui lòng nhập tên phong cách trang trí!')" oninput="setCustomValidity('')">
                          </div>
                          
                          <div class="mb-3">
                            <label for="description${decoration.id}" class="form-label">Mô Tả</label>
                            <textarea class="form-control" id="description${decoration.id}" name="description" rows="3">${decoration.description}</textarea>
                          </div>
                          
                          <div class="mb-3">
                            <label for="price${decoration.id}" class="form-label">Giá (VNĐ) <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="price${decoration.id}" name="price" value="${decoration.price}" required min="0" step="1000">
                          </div>
                          
                          <div class="mb-3">
                            <label class="form-label">Hình Ảnh</label>
                            <div class="file-upload-wrapper">
                              <div class="file-upload-preview ${empty decoration.imageUrl ? 'empty' : ''}" id="imagesPreview${decoration.id}">
                                <c:if test="${not empty decoration.imageUrl}">
                                  <div class="file-upload-preview-item">
                                    <img src="${pageContext.request.contextPath}${not empty decoration.imageUrl ? decoration.imageUrl : '/resources/images/anhvu.png'}" alt="${decoration.name} - hình">
                                    <button type="button" class="remove-btn" title="Xóa">×</button>
                                  </div>
                                </c:if>
                              </div>
                              <input type="file" class="form-control" id="imageFile${decoration.id}" name="imageFile" accept="image/*" onchange="previewImage(this)">
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
                
                <!-- Delete Modal for decoration ${decoration.id} -->
                <div class="modal fade" id="deleteDecorationModal${decoration.id}" tabindex="-1" aria-labelledby="deleteDecorationModalLabel${decoration.id}" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="deleteDecorationModalLabel${decoration.id}">Xác Nhận Xóa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa phong cách trang trí "${decoration.name}"?</p>
                        <p class="text-danger">Lưu ý: Việc xóa phong cách trang trí sẽ ảnh hưởng đến các đơn đặt phòng hiện có.</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <a href="${pageContext.request.contextPath}/admin/decorations/delete/${decoration.id}" class="btn btn-danger">Xóa</a>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
              
              <c:if test="${empty decorations}">
                <div class="col-12">
                  <div class="alert alert-info" role="alert">
                    <i class="bi bi-info-circle me-2"></i> Chưa có phong cách trang trí nào được thêm vào hệ thống.
                  </div>
                </div>
              </c:if>
            </div>
          </div>
        </main>
      </div>
    </div>
    
    <!-- Add Decoration Modal -->
    <div class="modal fade" id="addDecorationModal" tabindex="-1" aria-labelledby="addDecorationModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addDecorationModalLabel">Thêm Phong Cách Trang Trí Mới</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/decorations/add" method="post" enctype="multipart/form-data">
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Tên Phong Cách <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="name" name="name" required oninvalid="this.setCustomValidity('Vui lòng nhập tên phong cách trang trí!')" oninput="setCustomValidity('')">
              </div>
              
              <div class="mb-3">
                <label for="description" class="form-label">Mô Tả</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
              </div>
              
              <div class="mb-3">
                <label for="price" class="form-label">Giá (VNĐ) <span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="price" name="price" required min="0" step="1000">
              </div>
              
              <div class="mb-3">
                <label for="imageFile" class="form-label">Hình Ảnh</label>
                <div class="file-upload-wrapper">
                  <div class="file-upload-preview empty" id="imagesPreview"></div>
                  <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(this)">
                  <div class="form-text">Chọn hình ảnh.</div>
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