package com.asm2.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.asm2.entity.User;
import com.asm2.dao.UserDAO;

@WebServlet({ "/admin/users", "/admin/users/add","/admin/users/edit", "/admin/users/delete"})
public class AdminUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String uriString = request.getRequestURI();

        if(uriString.contains("add")) {
            request.setAttribute("view", "/views/admin/users/add.jsp");

        } else if (uriString.contains("edit")) {
            String idString = request.getParameter("id");
            User user = UserDAO.findById(Integer.parseInt(idString));
            request.setAttribute("user", user);
            request.setAttribute("view", "/views/admin/users/edit.jsp");

        } else if (uriString.contains("delete")) {
            String idString = request.getParameter("id");
            int userId = Integer.parseInt(idString);

            if(UserDAO.hasPostedNews(userId)) {
                request.setAttribute("message_error", "Không thể xóa người dùng '" +
                    UserDAO.findById(userId).getFullname() + "' vì đã có bài viết trong hệ thống");
            } else {
                int rs = UserDAO.delete(userId);
                request.setAttribute("message", rs > 0 ? "success" : "error");
            }

            List<User> list = UserDAO.findAll();
            request.setAttribute("list", list);
            request.setAttribute("view", "/views/admin/users/list.jsp");

        } else {
            // trường hợp truy cập /admin/users (danh sách)
            List<User> list = UserDAO.findAll();
            request.setAttribute("list", list);
            request.setAttribute("view", "/views/admin/users/list.jsp");
        }

        // CHỈ FORWARD 1 LẦN DUY NHẤT Ở CUỐI HÀM
        request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String uriString = request.getRequestURI();
		if(uriString.contains("add")) {
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    String fullname = request.getParameter("fullname");
		    String phone = request.getParameter("phone");

		    java.sql.Date birthday = null;
		    String birthdayStr = request.getParameter("birthday");
		    if(birthdayStr != null && !birthdayStr.trim().isEmpty()) {
		        try {
		            birthday = java.sql.Date.valueOf(birthdayStr);
		        } catch (IllegalArgumentException e) {
		            request.setAttribute("message_error", "Định dạng ngày sinh không hợp lệ");
		        }
		    }

		    boolean gender = "1".equals(request.getParameter("gender"));
		    boolean role = "1".equals(request.getParameter("role"));

		    // KIỂM TRA LỖI
		    if(email == null || email.trim().isEmpty() ||
		       password == null || password.trim().isEmpty() ||
		       fullname == null || fullname.trim().isEmpty()) {
		        
		        request.setAttribute("message_error", "Vui lòng điền đầy đủ thông tin bắt buộc");
		    } 
		    else {
		        int rs = UserDAO.insert(email, password, fullname, birthday, gender, phone, role);
		        if(rs > 0) {
		            request.setAttribute("message_success", "Thêm mới thành công");
		        } else {
		            request.setAttribute("message_error", "Thêm mới thất bại");
		        }
		    }

		    // DÒNG NÀY PHẢI ĐẶT Ở NGOÀI IF-ELSE → LUÔN LUÔN CHẠY!!!
		    request.setAttribute("view", "/views/admin/users/add.jsp");
		    request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
		    
		 
		}
		else if(uriString.contains("edit")) {
            // XỬ LÝ EDIT
            String idString = request.getParameter("id");
            if(idString != null && !idString.isEmpty()) {
                // Lấy thông tin từ form
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                
                // Xử lý ngày sinh
                java.sql.Date birthday = null;
                String birthdayStr = request.getParameter("birthday");
                if(birthdayStr != null && !birthdayStr.trim().isEmpty()) {
                    try {
                        birthday = java.sql.Date.valueOf(birthdayStr);
                    } catch (IllegalArgumentException e) {
                        request.setAttribute("message_error", "Định dạng ngày sinh không hợp lệ");
                    }
                }
                
                
                // Xử lý giới tính và vai trò
                boolean gender = "1".equals(request.getParameter("gender"));
                boolean role = "1".equals(request.getParameter("role"));
             // THÊM KIỂM TRA BẮT BUỘC Ở ĐÂY
                if(email == null || email.trim().isEmpty() || 
                        password == null || password.trim().isEmpty() || 
                        fullname == null || fullname.trim().isEmpty()) {
                         request.setAttribute("message_error", "Vui lòng điền đầy đủ thông tin bắt buộc");
                         request.setAttribute("view", "/views/admin/users/add.jsp");
                     }
                // Tạo user object
                User user = new User();
                user.setId(Integer.parseInt(idString));
                user.setEmail(email);
                user.setFullname(fullname);
                user.setPhone(phone);
                user.setBirthday(birthday);
                user.setGender(gender);
                user.setRole(role);
                
                // Xử lý mật khẩu: nếu để trống thì giữ nguyên
                if(password != null && !password.trim().isEmpty()) {
                    user.setPassword(password);
                } else {
                    // Lấy mật khẩu cũ từ database
                    User existingUser = UserDAO.findById(user.getId());
                    if(existingUser != null) {
                        user.setPassword(existingUser.getPassword());
                    }
                }
                
                int rs = UserDAO.update(user);
                if(rs > 0) {
                    request.setAttribute("message_success", "Cập nhật thành công");
                    // Load lại thông tin user sau khi update
                    User updatedUser = UserDAO.findById(user.getId());
                    request.setAttribute("user", updatedUser);
                } else {
                    request.setAttribute("message_error", "Cập nhật thất bại");
                }
            }
            request.setAttribute("view", "/views/admin/users/edit.jsp");
            request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
        }
    } 
    
  
}