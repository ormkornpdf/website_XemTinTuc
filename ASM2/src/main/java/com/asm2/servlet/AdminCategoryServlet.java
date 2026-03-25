package com.asm2.servlet;

import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.entity.Category;
import com.asm2.dao.CategoryDAO;

/**
 * Servlet implementation class AdminCategoryServlet
 */
@WebServlet({"/admin/categories","/admin/categories/add", "/admin/categories/edit", "/admin/categories/delete"})
public class AdminCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String uriString = request.getRequestURI();
	if(uriString.contains("add")) {
		request.setAttribute("view", "/views/admin/category/add.jsp");
	}else if (uriString.contains("edit")) {
		String idString = request.getParameter("id");
		Category category = CategoryDAO.findById(Integer.parseInt(idString));
		request.setAttribute("category", category);
		request.setAttribute("view", "/views/admin/category/edit.jsp");
	}
	else if (uriString.contains("delete")) {
		String idString = request.getParameter("id");
		int rs = CategoryDAO.delete(Integer.parseInt(idString));
		if(rs > 0 ) {
			request.setAttribute("message", "success");
		}else {
			request.setAttribute("message", "error");
		}
		
		List<Category> list = CategoryDAO.findAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/admin/category/list.jsp");
	}else {
		List<Category> list = CategoryDAO.findAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/admin/category/list.jsp");
	}
	request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String uriString = request.getRequestURI();
		if(uriString.contains("add")) {		
			String name = request.getParameter("name");
			int rs = CategoryDAO.insert(name);
			if(rs>0) {
				request.setAttribute("message_succer", "thêm mới thành công");
				
			}else {
				request.setAttribute("message_error", "thêm mới thất bại");
			}
			request.setAttribute("view", "/views/admin/category/add.jsp");
			request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
		}else {
			String idString = request.getParameter("id");
			String name = request.getParameter("name");
			Category category = new Category(Integer.parseInt(idString), name);
			int rs = CategoryDAO.update(category);
			if(rs>0) {
				request.setAttribute("message_succer", "Cập nhật thành công");
				
			}else {
				request.setAttribute("message_error", "Cập nhật thất bại");
			}
			request.setAttribute("view", "/views/admin/category/edit.jsp");
			request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
		}
	}

}
