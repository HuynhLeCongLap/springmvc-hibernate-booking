<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Truy cập bị từ chối - Cinema Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #1a237e;
            --accent-color: #e91e63;
            --secondary-color: #f8f9fa;
            --text-color: #333;
            --light-color: #ffffff;
            --border-color: #d1d5db;
        }

        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--secondary-color);
            line-height: 1.6;
            color: var(--text-color);
            background-image: url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .page-overlay {
            background-color: rgba(0, 0, 0, 0.7);
            width: 100%;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .access-denied-container {
            max-width: 550px;
            margin: 0 auto;
            background-color: var(--light-color);
            border-radius: 10px;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .access-denied-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
        }

        .access-denied-icon {
            font-size: 80px;
            color: var(--accent-color);
            margin-bottom: 20px;
        }

        .access-denied-title {
            color: var(--primary-color);
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .access-denied-message {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }

        .back-btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
            margin-right: 10px;
        }

        .back-btn:hover {
            background-color: #0e1561;
            color: white;
        }

        .login-btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #c2185b;
            color: white;
        }
    </style>
</head>
<body>
<div class="page-overlay">
    <div class="access-denied-container">
        <div class="access-denied-icon">
            <i class="bi bi-slash-circle"></i>
        </div>
        <h1 class="access-denied-title">Truy cập bị từ chối</h1>
        <p class="access-denied-message">
            Rất tiếc, bạn không có quyền truy cập vào trang này.
            Vui lòng đăng nhập với tài khoản có quyền phù hợp hoặc quay lại trang chủ.
        </p>
        <div>
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <i class="bi bi-house-door"></i> Trang chủ
            </a>
            <a href="${pageContext.request.contextPath}/login" class="login-btn">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
            </a>
        </div>
    </div>
</div>
</body>
</html>