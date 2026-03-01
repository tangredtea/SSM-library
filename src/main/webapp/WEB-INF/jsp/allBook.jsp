<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book List - SSM Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f7fa; padding-top: 30px; }
        .page-title { color: #333; border-bottom: 3px solid #667eea; padding-bottom: 10px; display: inline-block; }
        .btn-purple { background: #667eea; color: white; border: none; }
        .btn-purple:hover { background: #5a6fd6; color: white; }
        .table thead th { background: #667eea; color: white; border: none; }
        .table tbody tr:hover { background: #eef1ff; }
        .btn-edit { color: #667eea; font-weight: 600; }
        .btn-delete { color: #e74c3c; font-weight: 600; cursor: pointer; }
        .btn-delete:hover { color: #c0392b; }
        .search-bar { margin-bottom: 20px; }
        .error-msg { color: #e74c3c; font-weight: bold; margin-right: 10px; }
        .pagination > .active > a { background-color: #667eea; border-color: #667eea; }
        .pagination > li > a { color: #667eea; }
        .card { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); padding: 25px; }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <h2 class="page-title">Book List</h2>

        <div class="row search-bar" style="margin-top: 20px;">
            <div class="col-md-4">
                <a class="btn btn-purple" href="${pageContext.request.contextPath}/book/toAddBook">+ Add Book</a>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/book/allBook">Show All</a>
            </div>
            <div class="col-md-8">
                <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBook" method="post" style="float: right">
                    <span class="error-msg"><c:out value="${error}"/></span>
                    <input type="text" name="queryBookName" class="form-control" placeholder="Search by book name...">
                    <button type="submit" class="btn btn-purple">Search</button>
                </form>
            </div>
        </div>

        <table class="table table-hover" style="margin-top: 10px;">
            <thead>
            <tr>
                <th>#</th>
                <th>Book Name</th>
                <th>Quantity</th>
                <th>Description</th>
                <th style="width: 140px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${pageInfo.list}">
                <tr>
                    <td><c:out value="${book.bookID}"/></td>
                    <td><c:out value="${book.bookName}"/></td>
                    <td><c:out value="${book.bookCounts}"/></td>
                    <td><c:out value="${book.detail}"/></td>
                    <td>
                        <a class="btn-edit" href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}">Edit</a>
                        &nbsp;
                        <a class="btn-delete" href="javascript:void(0);" onclick="confirmDelete(${book.bookID});">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="row">
            <div class="col-md-6" style="line-height: 34px; color: #888;">
                Page ${pageInfo.pageNum} of ${pageInfo.pages} &middot; ${pageInfo.total} records
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation" style="float: right;">
                    <ul class="pagination" style="margin: 0;">
                        <li><a href="${pageContext.request.contextPath}/book/allBook?pn=1">First</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/allBook?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/book/allBook?pn=${page_num}">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/allBook?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/book/allBook?pn=${pageInfo.pages}">Last</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<form id="deleteForm" method="post" style="display:none;"></form>

<script>
    function confirmDelete(bookId) {
        if (confirm("Are you sure you want to delete this book?")) {
            var form = document.getElementById("deleteForm");
            form.action = "${pageContext.request.contextPath}/book/del/" + bookId;
            form.submit();
        }
    }
</script>
</body>
</html>
