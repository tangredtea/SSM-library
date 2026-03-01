<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Error - SSM Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f7fa; padding-top: 80px; }
        .card { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); padding: 40px; max-width: 600px; margin: 0 auto; text-align: center; }
        .error-icon { font-size: 48px; color: #e74c3c; margin-bottom: 15px; }
        .error-title { color: #333; margin-bottom: 20px; }
        .error-detail { color: #888; background: #f9f9f9; border-radius: 6px; padding: 15px; text-align: left; word-break: break-all; margin-bottom: 20px; }
        .btn-purple { background: #667eea; color: white; border: none; padding: 10px 30px; border-radius: 25px; }
        .btn-purple:hover { background: #5a6fd6; color: white; }
    </style>
</head>
<body>
<div class="card">
    <div class="error-icon">&#x26A0;</div>
    <h3 class="error-title">Something went wrong</h3>
    <div class="error-detail">
        <p><strong>URL:</strong> <c:out value="${url}"/></p>
        <p><strong>Error:</strong> <c:out value="${errorMsg}"/></p>
    </div>
    <a href="${pageContext.request.contextPath}/book/allBook" class="btn btn-purple">Back to Home</a>
</div>
</body>
</html>
