package com.asm2.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.CategoryDAO;
import com.asm2.dao.NewsDAO;
import com.asm2.entity.Category;
import com.asm2.entity.News;

/**
 * Servlet implementation class CategoriesServlet
 */
@WebServlet("/danh-muc")
public class CategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoriesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> categories = CategoryDAO.findAll();
		request.setAttribute("categories", categories);
		List<News> top5list = NewsDAO.findTop5();
		request.setAttribute("top5list", top5list);
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<News> list = NewsDAO.findByCategoryId(categoryId);
		request.setAttribute("list", list);
		request.setAttribute("views", "/views/client/category.jsp");
		request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
