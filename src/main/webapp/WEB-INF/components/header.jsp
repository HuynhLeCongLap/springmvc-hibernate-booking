<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header style="box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
  <div style="background-color: #1a237e; padding: 10px 0; color: white;">
    <div style="width: 100%; max-width: 1200px; margin: 0 auto; padding: 0 15px; display: flex; justify-content: space-between; align-items: center;">
      <div style="display: flex; align-items: center;">
        <a href="${pageContext.request.contextPath}/" style="text-decoration: none; display: flex; align-items: center;">
          <!-- <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Cinema Booking" style="height: 50px; margin-right: 10px;"> -->
          <div class="logo-text">
            <h1>Cinema Booking</h1>
            <span style="font-size: 14px; color: #f1f1f1;">Đặt phòng tiệc sinh nhật tại rạp chiếu phim</span>
          </div>
        </a>
      </div>
      
      <div>
        <c:choose>
          <c:when test="${not empty sessionScope.user}">
            <div style="position: relative;" class="dropdown-container">
              <div style="background-color: white; color: #1a237e; padding: 8px 15px; border-radius: 20px; text-decoration: none; font-weight: 500; display: inline-flex; align-items: center; cursor: pointer;">
                <i class="fas fa-user" style="margin-right: 5px;"></i>
                <span style="color: #1a237e; font-weight: 500;">Xin chào, ${sessionScope.user.fullName}</span>
                <i class="fas fa-chevron-down" style="margin-left: 5px; font-size: 12px;"></i>
              </div>
              <div id="userDropdown" class="dropdown-hidden" style="position: absolute; top: 100%; right: 0; margin-top: 5px; background-color: white; border-radius: 5px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); min-width: 150px; z-index: 1000;">
                <%-- <a href="${pageContext.request.contextPath}/user/profile" style="display: block; padding: 10px 15px; color: #333; text-decoration: none; border-bottom: 1px solid #eee;">Tài khoản</a> --%>
                <a href="${pageContext.request.contextPath}/logout" style="display: block; padding: 10px 15px; color: #1a237e; text-decoration: none;">Đăng xuất</a>
              </div>
              <style>
                .dropdown-hidden {
                  display: none;
                }
                .dropdown-visible {
                  display: block;
                }
              </style>
              <script>
                function toggleDropdown() {
                  var dropdown = document.getElementById("userDropdown");
                  if (dropdown.classList.contains("dropdown-visible")) {
                    dropdown.classList.remove("dropdown-visible");
                    dropdown.classList.add("dropdown-hidden");
                  } else {
                    dropdown.classList.remove("dropdown-hidden");
                    dropdown.classList.add("dropdown-visible");
                  }
                }
                
                // Close dropdown when clicking outside
                document.addEventListener("click", function(event) {
                  var dropdown = document.getElementById("userDropdown");
                  var dropdownContainer = document.querySelector(".dropdown-container");
                  
                  if (!dropdownContainer.contains(event.target)) {
                    dropdown.classList.remove("dropdown-visible");
                    dropdown.classList.add("dropdown-hidden");
                  }
                });
              </script>
            </div>
          </c:when>
          <c:otherwise>
            <div style="background-color: white; color: #1a237e; padding: 8px 15px; border-radius: 20px; text-decoration: none; font-weight: 500; display: inline-flex; align-items: center;">
              <i class="fas fa-user" style="margin-right: 5px;"></i>
              <a href="${pageContext.request.contextPath}/login" style="text-decoration: none; color: #1a237e; font-weight: 500;">Đăng nhập</a>
              /
              <a href="${pageContext.request.contextPath}/register" style="text-decoration: none; color: #1a237e; font-weight: 500;">Đăng ký</a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
  
  <nav style="background-color: white;">
    <div style="width: 100%; max-width: 1200px; margin: 0 auto; padding: 0 15px;">
      <ul style="display: flex; list-style: none; margin: 0; padding: 0;">
        <li style="position: relative;" class="active">
          <a href="${pageContext.request.contextPath}/" style="display: block; padding: 15px 20px; color: #1a237e; text-decoration: none; font-weight: bold;">TRANG CHỦ</a>
          <div style="position: absolute; bottom: 0; left: 20px; right: 20px; height: 3px; background-color: #1a237e;"></div>
        </li>
        <li style="position: relative;">
          <a href="${pageContext.request.contextPath}/rooms" style="display: block; padding: 15px 20px; color: #333; text-decoration: none; font-weight: 500; transition: color 0.3s;">PHÒNG TIỆC</a>
        </li>
        <li style="position: relative;">
          <a href="${pageContext.request.contextPath}/decoration-styles" style="display: block; padding: 15px 20px; color: #333; text-decoration: none; font-weight: 500; transition: color 0.3s;">PHONG CÁCH TRANG TRÍ</a>
        </li>
        <li style="position: relative;">
          <a href="${pageContext.request.contextPath}/about" style="display: block; padding: 15px 20px; color: #333; text-decoration: none; font-weight: 500; transition: color 0.3s;">VỀ CHÚNG TÔI</a>
        </li>
        <li style="position: relative;">
          <a href="${pageContext.request.contextPath}/contact" style="display: block; padding: 15px 20px; color: #333; text-decoration: none; font-weight: 500; transition: color 0.3s;">LIÊN HỆ</a>
        </li>
      </ul>
    </div>
  </nav>
</header>