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
	
	<form action="${pageContext.request.contextPath}/admin/users/add" method="post" >
	<div class="row">


		<div class="col-12">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center bg-light">
					<span class="fw-bold text-dark">Thêm mới người dùng</span>
					      <label class="text-success">${message_success}</label>
                    <label class="text-danger">${message_error}</label>
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-12 mt-3">
							<label for="fullname">Tên người dùng</label> <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Tên người dùng" />		
						</div>
						<div class="col-md-12 mt-3">
							<label for="password">Mật khẩu</label> <input type="text" class="form-control" id="password" name="password"/>		
						</div>
						<div class="col-md-12 mt-3">
							<label for="birthday">Ngày sinh</label> <input type="date" class="form-control" id="birthday" name="birthday"/>		
						</div>
						<div class="col-md-12 mb-3">
						    <label class="form-label">Giới tính <span class="text-danger">*</span></label>
						    <div class="form-check form-check-inline">
						        <input class="form-check-input" type="radio" name="gender" id="gender1" value="1"
						               ${user.gender ? 'checked' : ''} required>
						        <label class="form-check-label" for="gender1">Nam</label>
						    </div>
						    <div class="form-check form-check-inline">
						        <input class="form-check-input" type="radio" name="gender" id="gender0" value="0"
						               ${!user.gender ? 'checked' : ''} required>
						        <label class="form-check-label" for="gender0">Nữ</label>
						    </div>
						</div>
						<div class="col-md-12 mt-3">
							<label for="phone">Số điện thoại</label> <input type="text" class="form-control" id="phone" name="phone"/>		
						</div>
						
						<div class="col-md-12 mt-3">
							<label for="email">Email</label> <input type="email" class="form-control" id="email" name="email" />		
						</div>
						
							<div class="col-md-12 mt-3">
							<label for="role" class="form-label">Vai trò</label>
								<select class="form-control" id="role" name="role" required>
								    <option value="" disabled selected>Chọn vai trò</option>
								    <option value="0">Phóng viên</option>
								    <option value="1">Quản trị viên</option>
								</select>
						</div>
						
					</div>
					<div  class="col-md-12 mt-3 ">
						<button class="btn btn-primary btn-sm fw-semibold"	>Lưu</button>
						
						 <a class="btn btn-secondary btn-sm fw-semibold" href="${pageContext.request.contextPath}/admin/users">hủy</a>
						 </div>
				</div>

			</div>
		</div>
	</div>
	</form>
	<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>

	<script>
	    CKEDITOR.replace('content');
	</script>

</body>
</html>