<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Đăng nhập</title>
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/client/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/client/assets/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <span class="fw-bold text-dark">	Danh sach tin tức</span>
	     <a class="btn btn-primary btn-sm fw-semibold" href="${pageContext.request.contextPath}/quan-li-tin-tuc/them-moi">
	         Thêm mới
	      </a>
				
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
            <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/quan-li-tin-tuc/cap-nhat?id=${news.id}">
              <i class="bi bi-pencil-square"></i> Sửa
            </a>
            <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/quan-li-tin-tuc/xoa?id=${news.id}" 
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
  <script src="${pageContext.request.contextPath}/client/assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/client/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Thư viện SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
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
            window.location.href = '${pageContext.request.contextPath}/quan-li-tin-tuc/xoa?id=' + id;
        }
    });
}
</script>   
<script>
<% if (request.getAttribute("message") != null) { %>
    swal({
        title: "Thành công!",
        text: "Xóa danh mục thành công",
        icon: "success",
        button: "OK",
    });
<% } else if (request.getAttribute("error") != null) { %>
    swal({
        title: "Lỗi!",
        text: "Xóa danh mục thất bại",
        icon: "error",
        button: "Thử lại",
    });
<% } %>
</script>

</body>

</html>