<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book - SSM Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f7fa; padding-top: 50px; }
        .card { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); padding: 30px 40px; max-width: 600px; margin: 0 auto; }
        .page-title { color: #333; border-bottom: 3px solid #667eea; padding-bottom: 10px; display: inline-block; margin-bottom: 25px; }
        .btn-purple { background: #667eea; color: white; border: none; padding: 10px; }
        .btn-purple:hover { background: #5a6fd6; color: white; }
        .btn-back { margin-top: 15px; }
    </style>
</head>
<body>
<div class="card">
    <h2 class="page-title">Add Book</h2>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <label>Book Name</label>
            <input type="text" name="bookName" class="form-control" placeholder="Enter book name" required>
        </div>
        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="bookCounts" class="form-control" placeholder="Enter quantity" min="0" required>
        </div>
        <div class="form-group">
            <label>Description</label>
            <input type="text" name="detail" class="form-control" placeholder="Enter description" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control btn-purple" value="Add Book">
        </div>
    </form>
    <a class="btn btn-default btn-back" href="${pageContext.request.contextPath}/book/allBook">&larr; Back to List</a>
</div>
</body>
</html>
