<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP - OWLY1KETW</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #667eea;
            --secondary-color: #764ba2;
            --accent-color: #cda45e;
            --success-color: #28a745;
            --danger-color: #dc3545;
        }
        
        body {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000" opacity="0.05"><polygon fill="white" points="0,1000 1000,0 1000,1000"/></svg>');
            pointer-events: none;
        }
        
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.95);
            position: relative;
            z-index: 1;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 80px rgba(0,0,0,0.2);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--accent-color) 0%, #d4af37 100%);
            border-radius: 20px 20px 0 0 !important;
            padding: 2rem 2rem;
            position: relative;
            overflow: hidden;
        }
        
        .card-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: shine 3s infinite;
        }
        
        @keyframes shine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }
        
        .otp-input {
            letter-spacing: 12px;
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border: 2px solid #e9ecef;
            border-radius: 12px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .otp-input:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.2rem rgba(205, 164, 94, 0.25);
            background: white;
            transform: scale(1.02);
        }
        
        .form-control {
            border-radius: 12px;
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.2rem rgba(205, 164, 94, 0.25);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--accent-color) 0%, #d4af37 100%);
            border: none;
            border-radius: 12px;
            padding: 15px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(205, 164, 94, 0.4);
        }
        
        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }
        
        .btn-primary:hover::before {
            left: 100%;
        }
        
        .alert {
            border-radius: 12px;
            border: none;
            padding: 15px 20px;
            margin-bottom: 20px;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #ffe6e6 0%, #ffcccc 100%);
            color: var(--danger-color);
            border-left: 4px solid var(--danger-color);
        }
        
        .text-link {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            position: relative;
        }
        
        .text-link:hover {
            color: var(--secondary-color);
        }
        
        .text-link::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent-color);
            transition: width 0.3s ease;
        }
        
        .text-link:hover::after {
            width: 100%;
        }
        
        .email-display {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 12px;
            padding: 15px;
            border-left: 4px solid var(--accent-color);
            margin-bottom: 25px;
        }
        
        .floating-icon {
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        .password-strength {
            height: 4px;
            border-radius: 2px;
            margin-top: 5px;
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card">
                    <div class="card-header text-white text-center py-4">
                        <div class="floating-icon">
                            <i class="fas fa-shield-alt fa-3x mb-3"></i>
                        </div>
                        <h3 class="mb-2">Xác Thực OTP</h3>
                        <p class="mb-0 opacity-75">Nhập mã OTP và mật khẩu mới</p>
                    </div>
                    <div class="card-body p-5">
                        
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger animate__animated animate__shakeX">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        
                        <div class="email-display">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-envelope text-warning me-3"></i>
                                <div>
                                    <small class="text-muted">Mã OTP đã được gửi đến</small>
                                    <div class="fw-bold text-dark">${param.email}</div>
                                </div>
                            </div>
                        </div>
                        
                        <form action="${pageContext.request.contextPath}/xac-thuc-otp" method="post" id="otpForm">
                            <input type="hidden" name="email" value="${param.email}">
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold text-dark mb-3">
                                    <i class="fas fa-key me-2 text-warning"></i>Mã OTP
                                </label>
                                <input type="text" name="otp" class="form-control otp-input" 
                                       placeholder="••••••" required maxlength="6" pattern="\d{6}"
                                       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                                       title="Vui lòng nhập đúng 6 chữ số">
                                <div class="form-text text-muted mt-2">
                                    <i class="fas fa-info-circle me-1"></i>Nhập 6 số OTP từ email
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold text-dark mb-3">
                                    <i class="fas fa-lock me-2 text-warning"></i>Mật khẩu mới
                                </label>
                                <input type="password" name="newPassword" class="form-control" 
                                       placeholder="Nhập mật khẩu mới" required minlength="6"
                                       id="newPassword">
                                <div class="password-strength" id="passwordStrength"></div>
                                <div class="form-text text-muted mt-2">
                                    <i class="fas fa-shield-alt me-1"></i>Mật khẩu phải có ít nhất 6 ký tự
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold text-dark mb-3">
                                    <i class="fas fa-lock me-2 text-warning"></i>Xác nhận mật khẩu
                                </label>
                                <input type="password" name="confirmPassword" class="form-control" 
                                       placeholder="Nhập lại mật khẩu mới" required
                                       id="confirmPassword">
                                <div class="form-text text-muted mt-2" id="passwordMatch">
                                    <i class="fas fa-check me-1"></i>Xác nhận mật khẩu khớp
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-4 py-3">
                                <i class="fas fa-save me-2"></i>Đặt Mật Khẩu Mới
                            </button>
                        </form>
                        
                        <div class="text-center pt-3 border-top">
                            <a href="${pageContext.request.contextPath}/quen-mat-khau" class="text-link me-4">
                                <i class="fas fa-redo me-1"></i>Gửi lại OTP
                            </a>
                            <a href="${pageContext.request.contextPath}/dang-nhap" class="text-link">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại đăng nhập
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Password strength indicator
        document.getElementById('newPassword').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('passwordStrength');
            let strength = 0;
            
            if (password.length >= 6) strength += 25;
            if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength += 25;
            if (password.match(/\d/)) strength += 25;
            if (password.match(/[^a-zA-Z\d]/)) strength += 25;
            
            strengthBar.style.width = strength + '%';
            if (strength < 50) {
                strengthBar.style.background = '#dc3545';
            } else if (strength < 75) {
                strengthBar.style.background = '#ffc107';
            } else {
                strengthBar.style.background = '#28a745';
            }
        });
        
        // Password match validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = this.value;
            const matchText = document.getElementById('passwordMatch');
            
            if (confirmPassword === '') {
                matchText.innerHTML = '<i class="fas fa-info me-1"></i>Xác nhận mật khẩu khớp';
                matchText.style.color = '#6c757d';
            } else if (newPassword === confirmPassword) {
                matchText.innerHTML = '<i class="fas fa-check-circle me-1"></i>Mật khẩu khớp';
                matchText.style.color = '#28a745';
            } else {
                matchText.innerHTML = '<i class="fas fa-times-circle me-1"></i>Mật khẩu không khớp';
                matchText.style.color = '#dc3545';
            }
        });
    </script>
</body>
</html>