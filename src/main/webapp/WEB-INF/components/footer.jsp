<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer style="background-color: #333; color: #fff; padding: 50px 0 20px;">
  <div style="width: 100%; max-width: 1200px; margin: 0 auto; padding: 0 15px;">
    <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; margin-bottom: 30px;">
      <div>
        <h3 style="color: #1a237e; margin-bottom: 20px; font-size: 22px;">Cinema Booking</h3>
        <p>Dịch vụ đặt phòng tiệc sinh nhật tại rạp chiếu phim, mang đến trải nghiệm độc đáo và khó quên cho bạn và người thân.</p>
        <p><strong>Địa chỉ:</strong> 123 Nguyễn Văn Linh, Quận 7, TP. Hồ Chí Minh</p>
        <p><strong>Điện thoại:</strong> (028) 1234 5678</p>
        <p><strong>Email:</strong> info@cinemabooking.com</p>
      </div>
      
      <div>
        <h3 style="color: #1a237e; margin-bottom: 20px; font-size: 22px;">Về Chúng Tôi</h3>
        <ul style="list-style: none; padding: 0;">
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/about" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Giới thiệu</a></li>
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/rooms" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Phòng tiệc</a></li>
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/decoration-styles" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Phong cách trang trí</a></li>
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/contact" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Liên hệ</a></li>
        </ul>
      </div>
      
      <div>
        <h3 style="color: #1a237e; margin-bottom: 20px; font-size: 22px;">Hỗ Trợ</h3>
        <ul style="list-style: none; padding: 0;">
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/user/bookings" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Đặt phòng của tôi</a></li>
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/about" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Câu hỏi thường gặp</a></li>
          <li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath}/contact" style="color: #ccc; text-decoration: none; transition: color 0.3s;">Chính sách bảo mật</a></li>
        </ul>
      </div>
      
      <div>
        <h3 style="color: #1a237e; margin-bottom: 20px; font-size: 22px;">Kết Nối Với Chúng Tôi</h3>
        <div style="display: flex; gap: 15px; margin-bottom: 20px;">
          <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #444; border-radius: 50%; color: white; transition: background-color 0.3s;"><i class="fab fa-facebook-f"></i></a>
          <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #444; border-radius: 50%; color: white; transition: background-color 0.3s;"><i class="fab fa-youtube"></i></a>
          <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #444; border-radius: 50%; color: white; transition: background-color 0.3s;"><i class="fab fa-instagram"></i></a>
          <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #444; border-radius: 50%; color: white; transition: background-color 0.3s;"><i class="fab fa-tiktok"></i></a>
        </div>
        <div>
          <h4 style="margin-bottom: 15px; font-size: 16px;">Tải ứng dụng</h4>
          <div style="display: flex; gap: 10px;">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/app-store.png" alt="App Store" style="height: 40px;"></a>
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/google-play.png" alt="Google Play" style="height: 40px;"></a>
          </div>
        </div>
      </div>
    </div>
    
    <div style="text-align: center; padding-top: 20px; border-top: 1px solid #444; color: #999; font-size: 14px;">
      <p>&copy; 2023 Cinema Booking. All Rights Reserved.</p>
    </div>
  </div>
</footer>
