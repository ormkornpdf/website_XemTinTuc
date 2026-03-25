package com.asm2.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asm2.dao.UserDAO;
import com.asm2.entity.User;

@WebServlet("/doi-mat-khau")
public class ChangepasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangepasswordServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }
        
        request.getRequestDispatcher("/views/client/changepassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        UserDAO userDAO = new UserDAO();
        
        // Kiểm tra mật khẩu hiện tại
        if (!userDAO.checkPassword(user.getId(), currentPassword)) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("/views/client/changepassword.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra mật khẩu mới
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/views/client/changepassword.jsp").forward(request, response);
            return;
        }
        
        if (newPassword.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự!");
            request.getRequestDispatcher("/views/client/changepassword.jsp").forward(request, response);
            return;
        }
        
        // Cập nhật mật khẩu mới
        boolean success = userDAO.updatePassword(user.getId(), newPassword);
        
        if (success) {
            request.setAttribute("success", "Đổi mật khẩu thành công!");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi đổi mật khẩu!");
        }
        
        request.getRequestDispatcher("/views/client/changepassword.jsp").forward(request, response);
    }
}