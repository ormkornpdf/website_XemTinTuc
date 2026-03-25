<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 	   <div class="row">
          
              
              			  <div class="col-12">
				             <div class="card">
					       <div class="card-header d-flex justify-content-between align-items-center bg-light">
	      <span class="fw-bold text-dark">	Danh sach tin tức</span>
	      <a class="btn btn-primary btn-sm fw-semibold" href="${pageContext.request.contextPath}/admin/news/add">
	         Thêm mới
	      </a>
	    </div>
				
				     <div class="table-responsive">
  <table class="table align-middle mb-0">
    <thead class="text-center">
      <tr>
        <th>STT</th>
        <th>Ảnh</th>
         <th>Tiêu đề</th>
         <th>Lượt xem</th>
         <th>Tác giả</th>
         <th>Loại tin</th>
         <th>Trang chủ</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody class="text-center">
      <c:forEach items="${list}" var="news" varStatus="vs">
        <tr>
          <td>${vs.count}</td>
           <td class="text-start"><img alt="" src="${pageContext.request.contextPath}/images/${news.image}" width="50" height="50"></td>
          <td class="text-start">${news.title}</td>
           <td class="text-start">${news.viewcout}</td>
           <td class="text-start">${news.auth}</td>
           <td class="text-start">${news.categoty_id}</td>
           <td class="text-start">${news.home? 'Hiển thị':'Không'}</td>
          <td>
            <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/admin/news/edit?id=${news.id}">
              <i class="bi bi-pencil-square"></i> Sửa
            </a>
            <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/news/delete?id=${news.id}" 
               onclick="return confirm('Bạn có chắc muốn xóa tin này không?');">
              <i class="bi bi-trash"></i> Xóa
            </a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
   			 </div>
   			 </div>
                </div>
             <script>
function confirmDelete(id) {
    swal({
        title: "Bạn có chắc chắn?",
        text: "Dữ liệu sẽ bị xóa vĩnh viễn!",
        icon: "warning",
        buttons: ["Hủy", "Xóa"],
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            window.location.href = '${pageContext.request.contextPath}/admin/news/delete?id=' + id;
        }
    });
}
</script>   
</body>
</html>