<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
<style>
    body { 
        font-family: Arial, sans-serif; 
        margin: 0;
        padding: 0;
        background: #f5f5f5; 
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .container { 
        max-width: 400px; 
        width: 100%;
        background: white; 
        padding: 30px; 
        border-radius: 8px; 
        box-shadow: 0 0 10px rgba(0,0,0,0.1); 
    }
    .form-group { 
        margin-bottom: 20px; 
    }
    .form-control { 
        width: 100%; 
        padding: 10px; 
        border: 1px solid #ddd; 
        border-radius: 4px; 
        box-sizing: border-box;
        font-size: 14px;
    }
    .btn { 
        padding: 10px 15px; 
        border: none; 
        border-radius: 4px; 
        cursor: pointer; 
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin-right: 10px;
    }
    .btn-primary { 
        background: #007bff; 
        color: white; 
    }
    .btn-secondary { 
        background: #6c757d; 
        color: white; 
    }
    .error { 
        color: #721c24; 
        margin: 15px 0; 
        padding: 12px; 
        background: #f8d7da; 
        border: 1px solid #f5c6cb; 
        border-radius: 4px; 
        font-size: 14px; 
    }
    .success { 
        color: #155724; 
        margin: 15px 0; 
        padding: 12px; 
        background: #d4edda; 
        border: 1px solid #c3e6cb; 
        border-radius: 4px; 
        font-size: 14px; 
    }
    label { 
        display: block; 
        margin-bottom: 5px; 
        font-weight: bold; 
        color: #333;
    }
    h3 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }
    .btn-container {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <h3>Đặt lại mật khẩu</h3>
        
        <!-- Hiển thị lỗi nếu có -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        
        <!-- Hiển thị thành công nếu có -->
        <% if (request.getAttribute("success") != null) { %>
            <div class="success"><%= request.getAttribute("success") %></div>
        <% } else { %>
        
        <!-- Form nhập OTP và mật khẩu mới -->
        <form action="${pageContext.request.contextPath}/quen-mat-khau" method="post">
            <input type="hidden" name="action" value="resetPassword">
            
            <div class="form-group">
                <label for="otp">Mã OTP:</label>
                <input type="text" id="otp" name="otp" class="form-control" 
                       required placeholder="Nhập mã OTP 6 số" 
                       maxlength="6" pattern="[0-9]{6}">
                <small style="color: #666;">Vui lòng nhập mã OTP 6 số đã gửi đến email của bạn</small>
            </div>
            
            <div class="form-group">
                <label for="newPassword">Mật khẩu mới:</label>
                <input type="password" id="newPassword" name="newPassword" 
                       class="form-control" required 
                       placeholder="Nhập mật khẩu mới" minlength="6">
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" 
                       class="form-control" required 
                       placeholder="Nhập lại mật khẩu mới">
            </div>
            
            <div class="btn-container">
                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                <a href="${pageContext.request.contextPath}/quen-mat-khau" class="btn btn-secondary">Gửi lại OTP</a>
            </div>
        </form>
        <% } %>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="login.jsp" style="color: #007bff; text-decoration: none;">← Quay lại đăng nhập</a>
        </div>
    </div>

    <script>
        // JavaScript để kiểm tra mật khẩu khớp
        document.querySelector('form').addEventListener('submit', function(e) {
            var newPassword = document.getElementById('newPassword').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp!');
                return false;
            }
            
            if (newPassword.length < 6) {
                e.preventDefault();
                alert('Mật khẩu phải có ít nhất 6 ký tự!');
                return false;
            }
        });
    </script>
</body>
</html>