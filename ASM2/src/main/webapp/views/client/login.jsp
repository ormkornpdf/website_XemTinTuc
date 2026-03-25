<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Đăng nhập</title>
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/client/assets/images/logos/ketw-remove.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/client/assets/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fab fa-youtube me-2"></i>WynTube</h3>
                            </a>
                            <h3>Đăng nhập</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Mật khẩu</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <a href="${pageContext.request.contextPath}/quen-mat-khau">Quên mật khẩu</a>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Đăng nhập</button>
                        <p class="text-center mb-0"> <a href="${pageContext.request.contextPath}/dang-ky">Đăng ký</a></p>
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