package com.asm2.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.asm2.dao.CategoryDAO;
import com.asm2.dao.NewsDAO;
import com.asm2.entity.Category;
import com.asm2.entity.News;
import com.asm2.entity.User;

/**
 * Servlet implementation class UserManagermentNews
 */
@MultipartConfig
@WebServlet({"/quan-li-tin-tuc", "/quan-li-tin-tuc/them-moi","/quan-li-tin-tuc/cap-nhat","/quan-li-tin-tuc/xoa"})
public class UserManagermentNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagermentNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uriString = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || user.isRole()) {
		    response.sendRedirect(request.getContextPath() + "/dang-nhap");
		    return;
		}
		if (uriString.contains("them-moi")) {
			   List<Category> categories = CategoryDAO.findAll();
			    request.setAttribute("categories", categories);
			    request.setAttribute("views", "/views/client/newsadd.jsp");
		    
		} else if (uriString.contains("cap-nhat")) {
			 String idString = request.getParameter("id");
			    if (idString != null && !idString.isEmpty()) {
			        News news = NewsDAO.findById(Integer.parseInt(idString));
			        List<Category> categories = CategoryDAO.findAll();
			        
			        request.setAttribute("news", news);
			        request.setAttribute("categories", categories);
			    }
				request.setAttribute("views", "/views/client/newsedit.jsp");
		} else if (uriString.contains("xoa")) {
			String idString = request.getParameter("id");
			int rs = NewsDAO.delete(Integer.parseInt(idString));
			if(rs > 0 ) {
				request.setAttribute("message", "success");
			}else {
				request.setAttribute("message", "error");
			}
			
			List<News> list = NewsDAO.findByAuthor(user.getId());
			request.setAttribute("list", list);
			request.setAttribute("views", "/views/client/newslist.jsp");
		} else {
			List<News> list = NewsDAO.findByAuthor(user.getId());
			request.setAttribute("list", list);
		    request.setAttribute("views", "/views/client/newslist.jsp");
		}
		request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    User user = (User) request.getSession().getAttribute("user");
	    if (user == null || user.isRole()) {
	        response.sendRedirect(request.getContextPath() + "/dang-nhap");
	        return;
	    }
	    String uriString = request.getRequestURI();
	    request.setCharacterEncoding("utf-8");
	    
	    if(uriString.contains("them-moi")) {
	        String title = request.getParameter("title");
	        String categoryId = request.getParameter("categoryId");
	        boolean home = false;     
	        String content = request.getParameter("content");
	        Part part = request.getPart("image");
	        String fileName = part.getSubmittedFileName();
	        String filePath = "/images/" + fileName;
	        String realPath = request.getServletContext().getRealPath(filePath);
	        part.write(realPath);
	        News news = new News();
	        news.setTitle(title);
	        news.setContent(content);
	        news.setAuth(user.getId());
	        news.setHome(home);
	        news.setCategoty_id(Integer.parseInt(categoryId));
	        news.setImage(fileName);
	        news.setPosteddate(new Date());
	        news.setViewcout(0);
	        int rs = NewsDAO.insert(news);
	        if (rs > 0) {
	            request.setAttribute("message_success", "Thêm mới thành công");
	        } else {
	            request.setAttribute("message_error", "Thêm mới thất bại");
	        }
	        List<Category> categories = CategoryDAO.findAll();
	        request.setAttribute("categories", categories);
	        request.setAttribute("views", "/views/client/newsadd.jsp");
	        request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	        
	    } else if (uriString.contains("cap-nhat")) {
	        String idString = request.getParameter("id");
	        String title = request.getParameter("title");
	        String categoryId = request.getParameter("categoryId");
	        String content = request.getParameter("content");
	        News news = NewsDAO.findById(Integer.parseInt(idString));
	        Part part = request.getPart("image");
	        String fileName = part.getSubmittedFileName();
	        if(!fileName.isEmpty()) {
	            String filePath = "/images/" + fileName;
	            String realPath = request.getServletContext().getRealPath(filePath);
	            part.write(realPath);
	            news.setImage(fileName);
	        }
	        news.setTitle(title);
	        news.setContent(content);
	        news.setHome(false);
	        news.setCategoty_id(Integer.parseInt(categoryId));
	        int rs = NewsDAO.update(news);
	        if (rs > 0) {
	            request.setAttribute("message_success", "Cập nhật thành công");
	        } else {
	            request.setAttribute("message_error", "Cập nhật thất bại");
	        }
	        List<Category> categories = CategoryDAO.findAll();
	        request.setAttribute("news", news);
	        request.setAttribute("categories", categories);
	        request.setAttribute("views", "/views/client/newsedit.jsp");
	        request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	        
	    } else if (uriString.contains("xoa")) {
	    	String idString = request.getParameter("id");
			int rs = NewsDAO.delete(Integer.parseInt(idString));
			if(rs > 0 ) {
				request.setAttribute("message", "success");
			}else {
				request.setAttribute("message", "error");
			}
			
			List<Category> list = CategoryDAO.findAll();
			request.setAttribute("list", list);
			request.setAttribute("views", "/views/client/newslist.jsp");
	    } else {
	        // Trường hợp mặc định - hiển thị danh sách
	        List<News> list = NewsDAO.findByAuthor(user.getId());
	        request.setAttribute("list", list);
	        request.setAttribute("views", "/views/client/newslist.jsp");
	        request.getRequestDispatcher("/views/client/layout.jsp").forward(request, response);
	    }
	}
	}
	


