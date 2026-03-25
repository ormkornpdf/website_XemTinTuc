<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - OWLY1KETW</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #cda45e 0%, #b08d57 100%);
            border-radius: 15px 15px 0 0 !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-header text-white text-center py-4">
                        <h4><i class="fas fa-key me-2"></i>Quên Mật Khẩu</h4>
                        <p class="mb-0">Nhập email để nhận mã OTP</p>
                    </div>
                    <div class="card-body p-4">
                        
                        <% if (request.getAttribute("message") != null) { %>
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle me-2"></i>
                                <%= request.getAttribute("message") %>
                            </div>
                        <% } %>
                        
                        <form action="${pageContext.request.contextPath}/quen-mat-khau" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Email của bạn</label>
                                <input type="email" name="email" class="form-control form-control-lg" 
                                       placeholder="email@example.com" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                                <i class="fas fa-paper-plane me-2"></i>Gửi Mã OTP
                            </button>
                        </form>
                        
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/dang-nhap" class="text-decoration-none">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại đăng nhập
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>