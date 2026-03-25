<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu - OWLY1KETW</title>
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
                        <h4><i class="fas fa-lock me-2"></i>Đổi Mật Khẩu</h4>
                        <p class="mb-0">Cập nhật mật khẩu mới cho tài khoản</p>
                    </div>
                    <div class="card-body p-4">
                        
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        
                        <% if (request.getAttribute("success") != null) { %>
                            <div class="alert alert-success">
                                <i class="fas fa-check-circle me-2"></i>
                                <%= request.getAttribute("success") %>
                            </div>
                        <% } %>
                        
                        <form action="${pageContext.request.contextPath}/doi-mat-khau" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu hiện tại</label>
                                <input type="password" name="currentPassword" class="form-control" 
                                       placeholder="Nhập mật khẩu hiện tại" required>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu mới</label>
                                <input type="password" name="newPassword" class="form-control" 
                                       placeholder="Mật khẩu mới" required minlength="6">
                                <div class="form-text">Mật khẩu phải có ít nhất 6 ký tự</div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold">Xác nhận mật khẩu</label>
                                <input type="password" name="confirmPassword" class="form-control" 
                                       placeholder="Nhập lại mật khẩu mới" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                                <i class="fas fa-save me-2"></i>Cập Nhật Mật Khẩu
                            </button>
                        </form>
                        
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/trang-chu" class="text-decoration-none">
                                <i class="fas fa-home me-2"></i>Về trang chủ
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