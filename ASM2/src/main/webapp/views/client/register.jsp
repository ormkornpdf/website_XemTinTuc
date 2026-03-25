<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Flexy Free Bootstrap Admin Template by WrapPixel</title>
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/client/assets/images/logos/ketw-remove.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/client/assets/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden text-bg-light min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="./index.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="${pageContext.request.contextPath}/client/assets/images/logos/ketw-remove.svg" alt="">
                </a>
                <p class="text-center">Your Social Campaigns</p>
                   <form action="${pageContext.request.contextPath}/dang-ky" method="post" id="registrationForm">
                  <!-- Họ và tên -->
                  <div class="form-group">
                    <label for="fullname" class="form-label">Họ và tên *</label>
                    <input type="text" class="form-control" id="fullname" name="fullname" 
                           value="<%= request.getParameter("fullname") != null ? request.getParameter("fullname") : "" %>" 
                           required>
                    <div class="error-message" id="fullnameError"></div>
                  </div>
                  
                  <!-- Email -->
                  <div class="form-group">
                    <label for="email" class="form-label">Email *</label>
                    <input type="email" class="form-control" id="email" name="email" 
                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" 
                           required>
                    <div class="error-message" id="emailError"></div>
                  </div>
                  
                  <!-- Ngày sinh -->
                  <div class="form-group">
                    <label for="birthday" class="form-label">Ngày sinh</label>
                    <input type="date" class="form-control" id="birthday" name="birthday"
                           value="<%= request.getParameter("birthday") != null ? request.getParameter("birthday") : "" %>">
                    <div class="error-message" id="birthdayError"></div>
                  </div>
                  
                  <!-- Giới tính -->
                  <div class="form-group">
                    <label class="form-label">Giới tính</label>
                    <div class="d-flex">
                      <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="true" 
                               <%= "true".equals(request.getParameter("gender")) ? "checked" : "" %>>
                        <label class="form-check-label" for="male">
                          Nam
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="false"
                               <%= "false".equals(request.getParameter("gender")) ? "checked" : "" %>>
                        <label class="form-check-label" for="female">
                          Nữ
                        </label>
                      </div>
                    </div>
                  </div>
                  
                  <!-- Số điện thoại -->
                  <div class="form-group">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" 
                           value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>"
                           maxlength="10">
                    <div class="error-message" id="phoneError"></div>
                  </div>
                  
                  <!-- Mật khẩu -->
                  <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu *</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="error-message" id="passwordError"></div>
                  </div>
                  
                  <!-- Xác nhận mật khẩu -->
                  <div class="form-group">
                    <label for="repeatpassword" class="form-label">Xác nhận mật khẩu *</label>
                    <input type="password" class="form-control" id="repeatpassword" name="repeatpassword" required>
                    <div class="error-message" id="repeatpasswordError"></div>
                  </div>
                  
                  <!-- Nút đăng ký -->
                  <button type="submit" class="btn btn-primary w-100 py-3 fs-4 mb-3 rounded-2">Đăng ký</button>
                  
                  <!-- Đã có tài khoản -->
                  <div class="text-center">
                    <p class="mb-0">Đã có tài khoản?
                      <a href="${pageContext.request.contextPath}/dang-nhap" class="text-primary fw-semibold"> Đăng nhập</a>
                    </p>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/client/assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/client/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>