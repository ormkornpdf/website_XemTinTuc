<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        .toast {
            min-width: 350px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
    </style>
</head>

<body>
    <h3 class="mb-4">Danh sách người dùng</h3>

    <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-primary mb-3">
        Thêm người dùng mới
    </a>

    <table class="table table-bordered table-hover">
        <thead class="table-light text-center">
            <tr>
                <th>STT</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Vai trò</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="users" varStatus="i">
                <tr>
                    <td class="text-center">${i.count}</td>
                    <td>${users.fullname}</td>
                    <td>${users.email}</td>
                    <td>${users.phone}</td>
                    <td>
                        <fmt:formatDate value="${users.birthday}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td class="text-center">
                        <c:choose>
                            <c:when test="${users.gender}">Nam</c:when>
                            <c:otherwise>Nữ</c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-center">
                        <span class="badge ${users.role ? 'bg-danger' : 'bg-secondary'}">
                            ${users.role ? 'Quản trị' : 'Người dùng'}
                        </span>
                    </td>
                    <td class="text-center">
                        <a href="${pageContext.request.contextPath}/admin/users/edit?id=${users.id}" 
                           class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/users/delete?id=${users.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Xóa người dùng này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty list}">
        <div class="alert alert-info text-center">Chưa có người dùng nào!</div>
    </c:if>

  
</body>
</html>