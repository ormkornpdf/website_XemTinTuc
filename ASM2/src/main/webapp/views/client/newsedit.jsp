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
	
	<form action="${pageContext.request.contextPath}/quan-li-tin-tuc/cap-nhat?id=${news.id}" method="post" enctype="multipart/form-data">
	<div class="row">


		<div class="col-12">
			<div class="card">
				<div
					class="card-header d-flex justify-content-between align-items-center bg-light">
					<span class="fw-bold text-dark">Cập nhật tin tức</span>
					<label class="text-success">${message_success}</label>
					<label class="text-success">${message_error }</label>
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-12 mt-3">
							<label for="name">Tiêu đề</label> 
							<input type="text" class="form-control" id="title" name="title" placeholder="Tiêu đề" value="${news.title }"/>		
							<input type="hidden" class="form-control" id="id" name="id" placeholder="Tiêu đề" value="${news.id }"/>		
						</div>
						<div class="col-md-12 mt-3">
							<label for="image">Ảnh</label> <input type="file" class="form-control" id="image" name="image"/>		
						</div>
						<div class="col-md-12 mt-3">
							<label name="categoryId">Loại tin tức</label> 							
							<select class="form-control" id="categoryId" name="categoryId" >
								<option>Chọn loại tin</option>
								<c:forEach items="${categories}" var="cate">
									<option value="${cate.id}" ${cate.id == news.categoty_id? 'selected':'' }>${cate.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-md-12 mt-3">
						    <label for="description">Mô tả</label>
						    <textarea class="form-control" id="content" name="content" rows="5" >${news.content}</textarea>
						</div>

						
					</div>
					<div  class="col-md-12 mt-3 ">
						<button class="btn btn-primary btn-sm fw-semibold"	>Lưu</button>
						
						 <a class="btn btn-secondary btn-sm fw-semibold" href="${pageContext.request.contextPath}/quan-li-tin-tuc">hủy</a>
						
						


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