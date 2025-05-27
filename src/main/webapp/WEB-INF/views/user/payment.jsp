<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Thanh Toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .navbar {
            background-color: #1a237e;
        }
        
        .navbar-brand {
            font-weight: bold;
            color: white;
        }
        
        .nav-link {
            color: rgba(255, 255, 255, 0.8);
            transition: all 0.2s;
        }
        
        .nav-link:hover {
            color: white;
        }
        
        .payment-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .payment-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }
        
        .payment-subtitle {
            font-size: 16px;
            color: #666;
        }
        
        .booking-steps {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        
        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 120px;
            position: relative;
        }
        
        .step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 25px;
            right: -30px;
            width: 60px;
            height: 2px;
            background-color: #ddd;
        }
        
        .step-number {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .step.active .step-number {
            background-color: #1a237e;
            color: white;
        }
        
        .step.completed .step-number {
            background-color: #4caf50;
            color: white;
        }
        
        .step-label {
            font-size: 14px;
            color: #999;
        }
        
        .step.active .step-label, .step.completed .step-label {
            color: #1a237e;
            font-weight: bold;
        }
        
        .booking-summary {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .summary-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1a237e;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        
        .summary-item:last-child {
            border-bottom: none;
        }
        
        .summary-label {
            font-weight: 500;
        }
        
        .summary-value {
            font-weight: bold;
        }
        
        .total-price {
            font-size: 20px;
            color: #e91e63;
        }
        
        .payment-methods {
            margin-bottom: 30px;
        }
        
        .payment-method-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #1a237e;
        }
        
        .payment-tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        
        .payment-tab {
            padding: 10px 20px;
            cursor: pointer;
            font-weight: 500;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
        }
        
        .payment-tab.active {
            color: #1a237e;
            border-bottom-color: #1a237e;
        }
        
        .payment-content {
            display: none;
            padding: 20px 0;
        }
        
        .payment-content.active {
            display: block;
        }
        
        .bank-transfer-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .bank-info {
            margin-bottom: 15px;
        }
        
        .bank-info-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .bank-info-label {
            width: 150px;
            font-weight: 500;
        }
        
        .bank-info-value {
            font-weight: bold;
        }
        
        .transfer-note {
            background-color: #fff3e0;
            border-left: 4px solid #ff9800;
            padding: 15px;
            margin-top: 15px;
        }
        
        .transfer-note-title {
            font-weight: bold;
            margin-bottom: 5px;
            color: #e65100;
        }
        
        .copy-btn {
            background-color: #f0f0f0;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            margin-left: 10px;
            cursor: pointer;
            font-size: 12px;
            transition: all 0.3s;
        }
        
        .copy-btn:hover {
            background-color: #ddd;
        }
        
        .qr-payment {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        
        .qr-code {
            width: 200px;
            height: 200px;
            background-color: #f0f0f0;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .qr-note {
            text-align: center;
            color: #666;
        }
        
        .card-payment-form {
            max-width: 500px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn-primary {
            background-color: #1a237e;
            border-color: #1a237e;
            padding: 10px 25px;
        }
        
        .btn-primary:hover {
            background-color: #0e1442;
            border-color: #0e1442;
        }
        
        .btn-outline-secondary {
            color: #1a237e;
            border-color: #1a237e;
            padding: 10px 25px;
        }
        
        .btn-outline-secondary:hover {
            background-color: #f0f0f0;
            color: #1a237e;
        }
    </style>
</head>
<body>
    <!-- Header/Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">Cinema Booking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/bookings">Đặt phòng của tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/profile">Tài khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="payment-container">
            <div class="payment-header">
                <h1 class="payment-title">Thanh Toán Đặt Phòng</h1>
                <p class="payment-subtitle">Hoàn tất thanh toán để xác nhận đặt phòng của bạn</p>
            </div>
            
            <div class="booking-steps">
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn thời gian</div>
                </div>
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn phòng</div>
                </div>
                <div class="step completed">
                    <div class="step-number"><i class="fas fa-check"></i></div>
                    <div class="step-label">Chọn trang trí</div>
                </div>
                <div class="step active">
                    <div class="step-number">4</div>
                    <div class="step-label">Thanh toán</div>
                </div>
            </div>
            
            <div class="booking-summary">
                <h3 class="summary-title">Thông tin đặt phòng</h3>
                <div class="summary-item">
                    <span class="summary-label">Mã đặt phòng:</span>
                    <span class="summary-value">${booking.id}</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Ngày đặt phòng:</span>
                    <span class="summary-value"><fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy" /></span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Ngày nhận phòng:</span>
                    <span class="summary-value"><fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy" /></span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Khung giờ:</span>
                    <span class="summary-value">${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Phòng:</span>
                    <span class="summary-value">${booking.room.roomName}</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Phong cách trang trí:</span>
                    <span class="summary-value">${booking.decorationStyle.name}</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Giá phòng:</span>
                    <span class="summary-value"><fmt:formatNumber value="${booking.room.price}" pattern="#,##0 ₫" /></span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Tổng cộng:</span>
                    <span class="summary-value total-price"><fmt:formatNumber value="${booking.totalPrice}" pattern="#,##0 ₫" /></span>
                </div>
            </div>
            
            <div class="payment-methods">
                <h3 class="payment-method-title">Phương thức thanh toán</h3>
                
                <div class="payment-tabs">
                    <div class="payment-tab active" data-tab="bank-transfer">Chuyển khoản ngân hàng</div>
                    <div class="payment-tab" data-tab="qr-payment">Quét mã QR</div>
                </div>
                
                <div class="payment-content active" id="bank-transfer">
                    <div class="bank-transfer-info">
                        <div class="bank-info">
                            <div class="bank-info-item">
                                <div class="bank-info-label">Tên tài khoản:</div>
                                <div class="bank-info-value">CINEMA BOOKING JSC</div>
                            </div>
                            <div class="bank-info-item">
                                <div class="bank-info-label">Số tài khoản:</div>
                                <div class="bank-info-value">${bankAccount}</div>
                            </div>
                            <div class="bank-info-item">
                                <div class="bank-info-label">Ngân hàng:</div>
                                <div class="bank-info-value">${bankName}</div>
                            </div>
                        </div>
                        
                        <div class="transfer-note">
                            <div class="transfer-note-title">Nội dung chuyển khoản:</div>
                            <div class="d-flex align-items-center">
                                <div class="transfer-note-content" id="transferContent">CB-${booking.id}</div>
                                <button class="copy-btn" onclick="copyToClipboard('CB-${booking.id}')">
                                    <i class="far fa-copy"></i> Sao chép
                                </button>
                            </div>
                            <p class="mt-2 mb-0 small text-muted">Vui lòng ghi đúng nội dung chuyển khoản để hệ thống có thể xác nhận thanh toán của bạn.</p>
                        </div>
                    </div>
                </div>
                
                <div class="payment-content" id="qr-payment">
                    <div class="qr-payment">
                        <div class="qr-code">
                            <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=CINEMA_BOOKING_ID_${booking.id}_AMOUNT_${booking.totalPrice}" alt="QR Code">
                        </div>
                        <div class="qr-note">
                            <p>Quét mã QR để thanh toán</p>
                            <p class="small text-muted">Hỗ trợ các ứng dụng: MoMo, ZaloPay, VNPay, ngân hàng...</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath}/user/confirm-payment" method="post">
                <input type="hidden" name="bookingId" value="${booking.id}">
                <input type="hidden" name="paymentInfo" id="paymentInfo" value="Chuyển khoản ngân hàng">
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/user/cancel-booking/${booking.id}" class="btn btn-outline-secondary">
                        <i class="fas fa-times"></i> Hủy đặt phòng
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-check"></i> Xác nhận thanh toán
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const tabs = document.querySelectorAll('.payment-tab');
            
            tabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    document.querySelectorAll('.payment-tab').forEach(t => {
                        t.classList.remove('active');
                    });
                    
                    this.classList.add('active');
                    
                    document.querySelectorAll('.payment-content').forEach(content => {
                        content.classList.remove('active');
                    });
                    
                    const tabId = this.getAttribute('data-tab');
                    document.getElementById(tabId).classList.add('active');
                    
                    const paymentMethod = this.textContent;
                    document.getElementById('paymentInfo').value = paymentMethod;
                });
            });
        });
        
        function copyToClipboard(text) {
            const tempInput = document.createElement('input');
            tempInput.value = text;
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand('copy');
            document.body.removeChild(tempInput);
            
            alert('Đã sao chép: ' + text);
        }
    </script>
</body>
</html> 