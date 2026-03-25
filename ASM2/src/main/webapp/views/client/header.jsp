<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header id="header" class="header d-flex align-items-center sticky-top">
	<div
		class="container position-relative d-flex align-items-center justify-content-between">

		<a href="${pageContext.request.contextPath}/trang-chu"
			class="logo d-flex align-items-center me-auto me-xl-0"> <!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="assets/img/logo.png" alt=""> -->
			<h1 class="sitename">owly1ketw</h1> <span>.</span>
		</a>

		<nav id="navmenu" class="navmenu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/trang-chu"
					class="active">Trang chủ<br></a></li>
		
				<li><a href="#menu">Thực đơn</a></li>
				<li><a href="#events">Tin tức</a></li>


				<ul>
					<li class="dropdown"><a href="#"> <span>Loại tin</span> <i
							class="bi bi-chevron-down toggle-dropdown"></i>
					</a>
						<ul>
							<c:forEach items="${categories}" var="cate">
								<li><a
									href="${pageContext.request.contextPath}/danh-muc?id=${cate.id}">
										${cate.name} </a></li>
							</c:forEach>
						</ul></li>


				</ul>

				<c:if test="${empty sessionScope.user}">
					<li class="dropdown"><a href="#"><span>Tài khoản</span> <i
							class="bi bi-chevron-down toggle-dropdown"></i></a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/dang-ky">Đăng
									ký</a></li>
							<li><a href="${pageContext.request.contextPath}/dang-nhap">Đăng
									nhập</a></li>
							<li><a
								href="${pageContext.request.contextPath}/quen-mat-khau">Quên
									mật khẩu</a></li>
									

						</ul></li>
				</c:if>
		
				
				
				
				<c:if test="${!empty sessionScope.user}">
					<li class="dropdown"><a href="#"><span>${sessionScope.user.fullname}</span></a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/thong-tin-ca-nhan">Thông
									tin cá nhân</a></li>
							<c:if test="${! sessionScope.user.role }">
								<li><a
									href="${pageContext.request.contextPath}/quan-li-tin-tuc">Quản
										lý tin tức</a></li>
							</c:if>
							<c:if test="${sessionScope.user.role }">
								<li><a
									href="${pageContext.request.contextPath}/admin">Quản trị 
										 </a></li>
							</c:if>
							<li><a
								href="${pageContext.request.contextPath}/quen-mat-khau">Quên
									mật khẩu</a></li>
									<li><a
								href="${pageContext.request.contextPath}/doi-mat-khau">Đổi
									mật khẩu</a></li>
							<li><a href="${pageContext.request.contextPath}/dang-xuat">Đăng
									xuất</a></li>

						</ul></li>
				</c:if>


			</ul>
			<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		</nav>

	

	</div>
</header>