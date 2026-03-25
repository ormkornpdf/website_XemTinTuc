<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Danh sach loại tin
	<form action="${pageContext.request.contextPath}/admin/categories/add" method="post">
	<div class="row">


		<div class="col-12">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center bg-light">
					<span class="fw-bold text-dark">Thêm mới loại tin</span>
					<label class="text-success">${message_succer }</label>
					<label class="text-success">${message_error }</label>
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<label for="name">Tên loại</label> <input type="text"
								class="form-control" id="name" name="name"
								placeholder="Tên loại" />
						</div>
					</div>
					<div  class="col-md-12 mt-3 ">
						<button class="btn btn-primary btn-sm fw-semibold"	>Lưu</button>
						
						 <a class="btn btn-secondary btn-sm fw-semibold" href="${pageContext.request.contextPath}/admin/categories">hủy</a>
						
						


					</div>
				</div>

			</div>
		</div>
	</div>
	</form>
</body>
</html>