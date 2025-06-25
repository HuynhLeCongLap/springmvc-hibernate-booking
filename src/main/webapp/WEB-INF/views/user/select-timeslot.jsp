<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chọn khung giờ đặt phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f8f9fa; }
        .container { max-width: 600px; margin: 40px auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); padding: 32px; }
        h1 { color: #1a237e; text-align: center; margin-bottom: 24px; }
        .room-info { margin-bottom: 24px; }
        .form-group { margin-bottom: 18px; }
        label { font-weight: 500; }
        select, input[type="date"] { width: 100%; padding: 10px; border-radius: 4px; border: 1px solid #ddd; }
        .btn-next { background: #1a237e; color: #fff; border: none; padding: 12px 24px; border-radius: 4px; font-weight: 600; cursor: pointer; width: 100%; margin-top: 18px; }
        .btn-next:hover { background: #0e1442; }
    </style>
</head>
<body>
<div class="container">
    <h1>Chọn khung giờ đặt phòng</h1>
    <div class="room-info">
        <strong>Phòng:</strong> <span>${room.roomName}</span><br/>
        <strong>Sức chứa:</strong> <span>${room.capacity} người</span>
    </div>
    <form action="${pageContext.request.contextPath}/user/select-decoration" method="get">
        <input type="hidden" name="roomId" value="${room.id}" />
        <div class="form-group">
            <label for="bookingDate">Chọn ngày:</label>
            <input type="date" id="bookingDate" name="bookingDate" value="${bookingDate}" required min="${now}" />
        </div>
        <div class="form-group">
            <label for="timeSlotId">Chọn khung giờ:</label>
            <select id="timeSlotId" name="timeSlotId" required>
                <c:forEach items="${timeSlots}" var="slot">
                    <option value="${slot.id}">${slot.startTime} - ${slot.endTime}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn-next">Tiếp tục</button>
    </form>
</div>
</body>
</html> 