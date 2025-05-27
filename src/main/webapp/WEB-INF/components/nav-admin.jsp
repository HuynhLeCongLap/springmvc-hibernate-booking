<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav
          id="sidebar"
          class="col-md-3 col-lg-2 d-md-block sidebar collapse"
        >
          <div class="position-sticky pt-3">
            <div class="text-center mb-4">
              <h5 class="text-white">FUTA Bus Lines</h5>
              <p class="text-white-50">Hệ thống quản trị</p>
            </div>
            <hr class="text-white-50">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/"
                >
                  <i class="bi bi-speedometer2"></i> Bảng điều khiển
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/trips"
                >
                  <i class="bi bi-calendar-check"></i> Quản lý chuyến đi
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/drivers"
                >
                  <i class="bi bi-person-badge"></i> Quản lý tài xế
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/buses"
                >
                  <i class="bi bi-truck"></i> Quản lý xe
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/pickup-points"
                >
                  <i class="bi bi-geo-alt"></i> Quản lý điểm dừng
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/reports"
                >
                  <i class="bi bi-graph-up"></i> Báo cáo thống kê
                </a>
              </li>
              
            </ul>
          </div>
        </nav>