<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Booking - Đang xử lý đặt phòng</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .processing-container {
            max-width: 600px;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .processing-icon {
            font-size: 60px;
            color: #1a237e;
            margin-bottom: 20px;
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.1);
                opacity: 0.7;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        
        .processing-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 15px;
        }
        
        .processing-message {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }
        
        .progress-container {
            margin-bottom: 30px;
        }
        
        .progress {
            height: 10px;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .progress-bar {
            background-color: #1a237e;
            animation: progress 3s linear forwards;
        }
        
        @keyframes progress {
            0% {
                width: 0%;
            }
            100% {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="processing-container">
        <div class="processing-icon">
            <i class="fas fa-spinner fa-spin"></i>
        </div>
        <h1 class="processing-title">Đang xử lý đặt phòng của bạn</h1>
        <p class="processing-message">Vui lòng đợi trong giây lát. Chúng tôi đang xử lý thông tin đặt phòng của bạn...</p>
        
        <div class="progress-container">
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
        
        <p>Bạn sẽ được chuyển hướng đến trang xác nhận đặt phòng sau khi hoàn tất.</p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Redirect to booking confirmation page after processing
        setTimeout(function() {
            window.location.href = "${pageContext.request.contextPath}/user/book-room?bookingId=${bookingId}";
        }, 3000);
    </script>
</body>
</html> 