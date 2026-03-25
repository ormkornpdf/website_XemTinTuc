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
import com.asm2.dao.UserDAO;
import com.asm2.entity.Category;
import com.asm2.entity.News;
import com.asm2.entity.User;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/news-detail")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		News news  = NewsDAO.findById(id);
		 // CẬP NHẬT LƯỢT XEM s
        if (news != null) {
            // Tăng lượt xem lên 1
            news.setViewcout(news.getViewcout() + 1);
            // Cập nhật vào database
            NewsDAO.update(news);
        }
        // LẤY THÔNG TIN TÁC GIẢ
        User auth = UserDAO.findById(news.getAuth());
        request.setAttribute("auth", auth);
		
		
		request.setAttribute("news", news);
		request.setAttribute("views", "/views/client/news.jsp");
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
