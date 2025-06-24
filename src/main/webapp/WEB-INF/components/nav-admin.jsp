<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav
          id="sidebar"
          class="col-md-3 col-lg-2 d-md-block sidebar collapse"
        >
          <div class="position-sticky pt-3">
            <div class="text-center mb-4">
              <h5 class="text-white">Cinema Booking</h5>
              <p class="text-white-50">Hệ thống quản trị phòng tiệc</p>
            </div>
            <hr class="text-white-50">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/"
                >
                  <i class="bi bi-speedometer2"></i> Tổng quan
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/bookings"
                >
                  <i class="bi bi-calendar-check"></i> Quản lý đặt phòng
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/rooms"
                >
                  <i class="bi bi-grid"></i> Quản lý phòng
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/timeslots"
                >
                  <i class="bi bi-clock"></i> Quản lý khung giờ
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/decorations"
                >
                  <i class="bi bi-palette"></i> Quản lý trang trí
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/admin/reports"
                >
                  <i class="bi bi-bar-chart"></i> Báo cáo
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/logout"
                >
                  <i class="bi bi-box-arrow-left"></i> Đăng xuất
                </a>
              </li>
            </ul>
          </div>
        </nav>