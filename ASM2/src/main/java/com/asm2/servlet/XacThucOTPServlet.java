package com.asm2.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.UserDAO;
import com.asm2.entity.User;

@WebServlet("/xac-thuc-otp")
public class XacThucOTPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public XacThucOTPServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByEmail(email);
        
        if (user == null) {
            request.setAttribute("error", "Email không tồn tại!");
            request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
            return;
        }
        
        // XÁC THỰC OTP
        if (!userDAO.verifyOTP(user.getId(), otp)) {
            request.setAttribute("error", "Mã OTP không đúng hoặc đã hết hạn!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
            return;
        }
        
        // KIỂM TRA MẬT KHẨU MỚI
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
            return;
        }
        
        if (newPassword.length() < 2) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 2 ký tự!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
            return;
        }
        
        // OTP ĐÚNG → CẬP NHẬT MẬT KHẨU MỚI
        boolean success = userDAO.updatePassword(user.getId(), newPassword);
        
        if (success) {
            // XÓA OTP ĐÃ DÙNG
            userDAO.clearOTP(user.getId());
            
            // THÔNG BÁO THÀNH CÔNG
            request.setAttribute("success", "Đặt mật khẩu mới thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/views/client/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi đổi mật khẩu!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/client/xac-thuc-otp.jsp").forward(request, response);
        }
    }
}