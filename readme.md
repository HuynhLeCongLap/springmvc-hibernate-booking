# Mini Cinema Booking System

Hệ thống đặt phòng chiếu phim mini, được xây dựng với Spring MVC và Hibernate ORM.

## Giới thiệu

Đây là một ứng dụng web quản lý việc đặt phòng chiếu phim mini, cho phép người dùng chọn khung giờ, phòng chiếu, kiểu trang trí và thanh toán trước khi được admin xác nhận. Hệ thống bao gồm các chức năng quản lý phòng chiếu, khung giờ, kiểu trang trí và xác nhận đơn đặt phòng.

## Các chức năng chính

### Người dùng thông thường

- Đăng ký và đăng nhập tài khoản
- Chọn khung giờ, phòng chiếu và kiểu trang trí
- Đặt và thanh toán đơn đặt phòng
- Xem lịch sử đặt phòng và trạng thái đơn
- Hủy đơn đặt phòng

### Quản trị viên

- Quản lý tài khoản người dùng (thêm, sửa, xóa)
- Quản lý thông tin phòng chiếu (thêm, sửa, xóa)
- Quản lý khung giờ (thêm, sửa, xóa, kích hoạt/vô hiệu hóa)
- Quản lý kiểu trang trí (thêm, sửa, xóa)
- Quản lý đơn đặt phòng (xác nhận, từ chối)

## Luồng hoạt động

1. **Đặt phòng**:

   - Người dùng chọn khung giờ và ngày đặt phòng
   - Hệ thống hiển thị các phòng còn trống trong khung giờ đó
   - Người dùng chọn một phòng
   - Người dùng chọn kiểu trang trí
   - Người dùng xác nhận đặt phòng và thực hiện thanh toán
   - Đơn đặt phòng chuyển sang trạng thái "Chờ xác nhận"

2. **Quản lý đơn đặt phòng**:

   - Quản trị viên xem danh sách các đơn đặt phòng
   - Quản trị viên xác nhận hoặc từ chối đơn đặt phòng
   - Người dùng được thông báo về trạng thái đơn đặt phòng

3. **Xem lịch sử đặt phòng**:
   - Người dùng có thể xem danh sách các đơn đặt phòng của mình
   - Hiển thị thông tin chi tiết và trạng thái của từng đơn

## Cấu trúc mã nguồn

- `src/main/java/com/example/config/`: Cấu hình Spring MVC và Hibernate
- `src/main/java/com/example/controllers/`: Các controller xử lý request
- `src/main/java/com/example/dao/`: Các lớp truy cập dữ liệu
- `src/main/java/com/example/model/`: Các entity đại diện cho dữ liệu
- `src/main/java/com/example/services/`: Các service xử lý logic nghiệp vụ
- `src/main/java/com/example/interceptor/`: Interceptor xác thực người dùng
- `src/main/resources/`: Tài nguyên và cấu hình
- `src/main/webapp/`: Giao diện người dùng (JSP, CSS, JS)
- `src/main/webapp/WEB-INF/views/`: Các trang JSP
- `src/main/webapp/WEB-INF/spring-servlet.xml`: Cấu hình Spring MVC và Hibernate

## Công nghệ sử dụng

- **Backend**:

  - Spring MVC 5.3.30: Framework xây dựng ứng dụng web
  - Hibernate 5.6.15.Final: ORM framework tương tác với database
  - Spring ORM: Tích hợp Spring với Hibernate
  - MySQL 8.0: Hệ quản trị cơ sở dữ liệu
  - Maven: Quản lý dependencies và build project

- **Frontend**:
  - JSP (JavaServer Pages): Render giao diện phía server
  - JSTL: Thư viện tag cho JSP
  - HTML, CSS, JavaScript: Frontend

## Cài đặt và chạy ứng dụng

### Yêu cầu

- JDK 8 hoặc cao hơn
- Maven 3.6 hoặc cao hơn
- MySQL 8.0
- Tomcat 9.0.100

### Các bước cài đặt

1. **Chuẩn bị cơ sở dữ liệu**:

   ```sql
   CREATE DATABASE cinema_booking CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. **Import dữ liệu mẫu**:

   ```bash
   mysql -u root -p cinema_booking < dump.sql
   ```

3. **Cấu hình kết nối database**:

   - Mở file `src/main/webapp/WEB-INF/spring-servlet.xml`
   - Tìm và cập nhật thông tin kết nối database:

   ```xml
   <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
       <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
       <property name="url" value="jdbc:mysql://localhost:3306/cinema_booking?useUnicode=true&amp;characterEncoding=UTF-8"/>
       <property name="username" value="YOUR_USERNAME"/>
       <property name="password" value="YOUR_PASSWORD"/>
   </bean>
   ```

4. **Build project**:

   ```bash
   mvn clean package
   ```

5. **Triển khai với Tomcat 9.0.100**:

   - Sao chép file `target/springmvc-hibernate-cinema.war` vào thư mục `webapps` của Tomcat
   - Hoặc cấu hình Tomcat trong IDE để chạy trực tiếp

6. **Khởi động Tomcat**:

   ```bash
   cd path/to/tomcat
   bin/startup.bat (Windows) hoặc bin/startup.sh (Linux/Mac)
   ```

7. **Truy cập ứng dụng**:
   - Mở trình duyệt và truy cập: `http://localhost:8080/springmvc-hibernate-cinema`

### Tài khoản mặc định

- **Admin**:

  - Số điện thoại: 0981793201
  - Mật khẩu: a

- **Người dùng**:
  - Số điện thoại: 0000000000
  - Mật khẩu: 0
