<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Thanh Toán (Admin)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; }
        .payment-container { max-width: 700px; margin: 50px auto; padding: 30px; background-color: white; border-radius: 10px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); }
        .payment-header { text-align: center; margin-bottom: 30px; }
        .payment-title { font-size: 24px; font-weight: bold; color: #1a237e; margin-bottom: 10px; }
        .payment-tabs { display: flex; border-bottom: 2px solid #e0e0e0; margin-bottom: 20px; }
        .payment-tab { padding: 10px 30px; cursor: pointer; font-weight: 500; border: none; background: none; outline: none; color: #1a237e; border-bottom: 3px solid transparent; transition: border-color 0.2s; }
        .payment-tab.active { border-bottom: 3px solid #1a237e; background: #f8f9fa; }
        .tab-content { display: none; }
        .tab-content.active { display: block; }
        .bank-info { background: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
        .bank-label { font-weight: bold; color: #1a237e; }
        .transfer-content { background: #fff3cd; border-left: 4px solid #ffc107; padding: 15px; border-radius: 6px; margin-bottom: 10px; }
        .transfer-content strong { color: #d48806; }
        .copy-btn { background: #e0e0e0; border: none; border-radius: 4px; padding: 2px 8px; margin-left: 8px; font-size: 14px; cursor: pointer; }
        .btn-action { min-width: 160px; }
        .summary-item { display: flex; justify-content: space-between; margin-bottom: 10px; }
        .summary-label { font-weight: 500; }
        .summary-value { font-weight: bold; }
        .total-price { font-size: 20px; color: #e91e63; }
        .btns { display: flex; justify-content: space-between; margin-top: 30px; }
    </style>
</head>
<body>
<div class="payment-container">
    <div class="payment-header">
        <div class="payment-title">Phương thức thanh toán</div>
    </div>
    <div class="payment-tabs">
        <button class="payment-tab active" onclick="showTab(event, 'bank')">Chuyển khoản ngân hàng</button>
        <button class="payment-tab" onclick="showTab(event, 'qr')">Quét mã QR</button>
    </div>
    <div id="bank" class="tab-content active">
        <div class="bank-info">
            <div><span class="bank-label">Tên tài khoản:</span> <b>CINEMA BOOKING JSC</b></div>
            <div><span class="bank-label">Số tài khoản:</span> <b>1234567890</b></div>
            <div><span class="bank-label">Ngân hàng:</span> <b>VCB - Ngân hàng TMCP Ngoại thương Việt Nam</b></div>
        </div>
        <div class="transfer-content">
            <div><strong>Nội dung chuyển khoản:</strong></div>
            <div style="display: flex; align-items: center; margin-top: 5px;">
                <span id="transferCode">CB-${booking.id}</span>
                <button class="copy-btn" onclick="copyTransferCode()">Sao chép</button>
            </div>
            <div style="font-size: 13px; color: #555; margin-top: 5px;">Vui lòng ghi đúng nội dung chuyển khoản để hệ thống có thể xác nhận thanh toán của bạn.</div>
        </div>
    </div>
    <div id="qr" class="tab-content">
        <div style="text-align: center; padding: 30px 0;">
            <c:set var="roomPrice" value="${booking.room.price}" />
            <c:set var="stylePrice" value="${booking.decorationStyle.price}" />
            <c:set var="totalPrice" value="${roomPrice + stylePrice}" />
            <c:set var="qrContent" value="2|99|1234567890|CINEMA BOOKING JSC|${totalPrice}|CB-${booking.id}|VCB" />
            <img src="https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=${qrContent}" alt="QR chuyển khoản" style="margin-bottom: 15px;"/>
            <div style="font-size: 15px; color: #1a237e; margin-bottom: 10px;">Quét mã QR bằng app ngân hàng để chuyển khoản nhanh</div>
            <div style="font-size: 13px; color: #555;">Nội dung chuyển khoản: <b>CB-${booking.id}</b></div>
            <div style="font-size: 13px; color: #555;">Số tiền: <b><fmt:formatNumber value="${totalPrice}" pattern="#.###"/> ₫</b></div>
            <div style="font-size: 13px; color: #555;">Ngân hàng: <b>VCB - Ngân hàng TMCP Ngoại thương Việt Nam</b></div>
        </div>
    </div>
    <div class="booking-summary" style="margin-top: 30px;">
        <div class="summary-item">
            <span class="summary-label">Mã đặt phòng:</span>
            <span class="summary-value">#${booking.id}</span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Khách hàng:</span>
            <span class="summary-value">${booking.user.fullName}</span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Phòng:</span>
            <span class="summary-value">${booking.room.roomName}</span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Khung giờ:</span>
            <span class="summary-value">${booking.timeSlot.startTime} - ${booking.timeSlot.endTime}</span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Ngày tổ chức:</span>
            <span class="summary-value"><fmt:formatDate value="${booking.bookingDateScheduled}" pattern="dd/MM/yyyy"/></span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Phong cách trang trí:</span>
            <span class="summary-value">
                ${booking.decorationStyle.name}
                (<fmt:formatNumber value="${booking.decorationStyle.price}" pattern="#.###"/> ₫)
            </span>
        </div>
        <div class="summary-item">
            <span class="summary-label">Giá phòng:</span>
            <span class="summary-value"><fmt:formatNumber value="${booking.room.price}" pattern="#.###"/> ₫</span>
        </div>
        <c:set var="roomPrice" value="${booking.room.price}" />
        <c:set var="stylePrice" value="${booking.decorationStyle.price}" />
        <c:set var="totalPrice" value="${roomPrice + stylePrice}" />
        <div class="summary-item">
            <span class="summary-label">Tổng tiền:</span>
            <span class="summary-value total-price"><fmt:formatNumber value="${totalPrice}" pattern="#.###"/> ₫</span>
        </div>
    </div>
    <div class="btns">
        <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-outline-secondary btn-action">Hủy đặt phòng</a>
        <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-primary btn-action">Xác nhận thanh toán</a>
    </div>
</div>
<script>
function showTab(evt, tabId) {
    var tabs = document.getElementsByClassName('tab-content');
    var btns = document.getElementsByClassName('payment-tab');
    for (var i = 0; i < tabs.length; i++) tabs[i].classList.remove('active');
    for (var i = 0; i < btns.length; i++) btns[i].classList.remove('active');
    document.getElementById(tabId).classList.add('active');
    evt.currentTarget.classList.add('active');
}
function copyTransferCode() {
    var code = document.getElementById('transferCode').innerText;
    navigator.clipboard.writeText(code);
    alert('Đã sao chép nội dung chuyển khoản: ' + code);
}
</script>
</body>
</html> 