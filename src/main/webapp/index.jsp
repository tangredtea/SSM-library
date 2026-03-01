<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>SSM Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .welcome-card {
            background: white;
            border-radius: 12px;
            padding: 60px 50px;
            text-align: center;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        .welcome-card h1 {
            color: #333;
            margin-bottom: 10px;
        }
        .welcome-card p {
            color: #888;
            margin-bottom: 30px;
            font-size: 16px;
        }
        .btn-enter {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 12px 40px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            text-decoration: none;
            transition: opacity 0.3s;
        }
        .btn-enter:hover {
            opacity: 0.85;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="welcome-card">
    <h1>SSM Library</h1>
    <p>A simple book management system</p>
    <a href="${pageContext.request.contextPath}/book/allBook" class="btn-enter">Enter Library</a>
</div>
</body>
</html>
