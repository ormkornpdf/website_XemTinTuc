<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="vi">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quản trị</title>
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/images/logos/ketw-remove.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/styles.min.css" />

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@100;600;800&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>

<body>
  <!-- Body Wrapper -->
 <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebartype="full" style="min-width: 1200px !important;">
    data-sidebar-position="fixed" data-header-position="fixed">

    <!-- App Topstrip -->
    <div class="app-topstrip bg-dark py-6 px-3 w-100 d-lg-flex align-items-center justify-content-between">
      <div class="d-flex align-items-center justify-content-center gap-5 mb-2 mb-lg-0">
        <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/admin">
          <img src="${pageContext.request.contextPath}/admin/assets/images/logos/ketw-remove.svg" alt="" width="150">
        </a>
      </div>
    </div>

    <!-- Sidebar Start -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Sidebar End -->

    <!-- Main wrapper -->
    <div class="body-wrapper">
      <!-- Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="${pageContext.request.contextPath}/admin/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-user fs-6"></i>
                      <p class="mb-0 fs-3">${sessionScope.user != null ? sessionScope.user.fullname : ''}</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-mail fs-6"></i>
                      <p class="mb-0 fs-3">${sessionScope.user.email}</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/doi-mat-khau" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-list-check fs-6"></i>
                      <p class="mb-0 fs-3">Đổi mật khẩu</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/dang-xuat" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Header End -->

      <!-- Body Wrapper Inner -->
      <div class="body-wrapper-inner">
        <div class="container-fluid">
          <jsp:include page="${view}"></jsp:include>
        </div>
      </div>
    </div>

    <!-- Toast Container - Góc trên bên phải -->
    <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;"></div>

    <!-- TẤT CẢ SCRIPT CŨ CỦA EM GIỮ NGUYÊN -->
    <script src="${pageContext.request.contextPath}/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/sidebarmenu.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/libs/simplebar/dist/simplebar.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/dashboard.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>

    <!-- CHỈ THÊM ĐOẠN NÀY ĐỂ HIỆN TOAST KHI XÓA USER -->
    <script>
    function showToast(type, msg) {
        var bg = type === 'success' ? 'success' : 'danger';
        var icon = type === 'success' ? 'check-circle-fill' : 'exclamation-triangle-fill';
        var html = 
            '<div class="toast align-items-center text-white bg-' + bg + ' border-0" role="alert">' +
            '  <div class="d-flex">' +
            '    <div class="toast-body fw-bold">' +
            '      <i class="bi bi-' + icon + ' me-2"></i>' + msg +
            '    </div>' +
            '    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>' +
            '  </div>' +
            '</div>';

        var container = document.querySelector('.toast-container');
        container.insertAdjacentHTML('beforeend', html);
        new bootstrap.Toast(container.lastElementChild, { delay: 5000 }).show();
    }

    window.addEventListener('load', function() {
        setTimeout(function() {
            <c:if test="${not empty message_error}">
                showToast('error', "${fn:escapeXml(message_error)}");
            </c:if>
            <c:if test="${not empty message_success}">
                showToast('success', "${fn:escapeXml(message_success)}");
            </c:if>
            <c:if test="${message == 'success'}">
                showToast('success', 'Xóa người dùng thành công');
            </c:if>
            <c:if test="${message == 'error'}">
                showToast('error', 'Xóa người dùng thất bại');
            </c:if>
        }, 300);
    });
    </script>
  </div>
</body>
</html>