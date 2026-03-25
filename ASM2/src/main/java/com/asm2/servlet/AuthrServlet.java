package com.asm2.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.asm2.dao.UserDAO;
import com.asm2.entity.User;

/**
 * Servlet implementation class AuthrServlet
 */
@WebServlet({"/dang-nhap","/dang-ky","/dang-xuat"})
public class AuthrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uriString = request.getRequestURI();
		if(uriString.contains("dang-nhap")) {
			request.setAttribute("views", "/views/client/login.jsp");
		}else if (uriString.contains("dang-xuat")) {
			request.getSession().removeAttribute("user");
			response.sendRedirect(request.getContextPath() + "/trang-chu");
			return;
		}
		else {
			request.setAttribute("views", "/views/client/register.jsp");
		}
		request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String uriString = request.getRequestURI();
		
		 if (uriString.contains("dang-nhap")) {
		        String email = request.getParameter("email");
		        String password = request.getParameter("password");
		        User user = UserDAO.findByEmail(email.trim());
		        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
	                request.setAttribute("message", "Không được để trống email hoặc password");
	                request.setAttribute("views", "/views/client/login.jsp");
	                request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	                return; 
	            }
		        if (user == null) {
		           
		            request.setAttribute("message", "Tài khoản không tồn tại");
		            request.setAttribute("views", "/views/client/login.jsp");
		            request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
		            return; 
		        }
		        
		     
		        if (password != null && password.equals(user.getPassword())) {
		            request.getSession().setAttribute("user", user);
		            response.sendRedirect(request.getContextPath() + "/trang-chu");
		            return; 
		        } 
		         else {
		            request.setAttribute("message", "Email hoặc mật khẩu không đúng");
		            request.setAttribute("views", "/views/client/login.jsp");
		            request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
		        }

		}else {
			  String email = request.getParameter("email");
			    String password = request.getParameter("password");
			    String repeatPassword = request.getParameter("repeatPassword");
			    String fullName = request.getParameter("fullname");
			    String gender = request.getParameter("gender");
			    if (password.equals(repeatPassword)) {
			        User user = new User();
			        user.setEmail(email);
			        user.setPassword(password);
			        user.setFullname(fullName);
			        user.setGender(Boolean.parseBoolean(gender));
			        user.setRole(false);
			        int rs = UserDAO.insert(user);
			        if (rs > 0) {
			            response.sendRedirect(request.getContextPath() + "/dang-nhap");
			            return;
			        } else {
			            request.setAttribute("message", "Đăng ký thất bại");
			        }
			    } else {
			        request.setAttribute("message", "Mật khẩu không khớp");
			    }
			        request.setAttribute("views", "/views/client/register.jsp");
		            request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
		}
	
	}

}
