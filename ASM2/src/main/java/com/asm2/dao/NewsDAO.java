package com.asm2.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.asm2.entity.News;
import com.asm2.util.Jdbc;

public class NewsDAO {
    // SỬA: đồng bộ tên cột với database thực tế
    static String sql_insert = "insert into news (title, content, image, posteddate, auth, viewcout, categoty_id, home) values(?, ?, ?, ?, ?, ?, ?, ?)";
    static String sql_update = "update news set title= ?, content=?, image= ?, posteddate=?, auth=?, viewcout=?, categoty_id=?, home=? where id=?";
    static String sql_delete = "delete from news where id=?";
    static String sql_selectAll = "select * from news order by id desc";
    static String sql_selectById = "select * from news where id=?";
    static String sql_selectByHome = "select * from news where home=1 order by id desc";
    
    static String sql_select_by_author = "select * from news where auth = ? order by id desc"; 
    static String sql_select_top_5 = "select top 5 * from news where home = 1 order by id desc";
    static String sql_select_by_category_id = "select * from news where categoty_id = ? and home = 1 order by id desc";
    
    //insert
    public static int insert(News news) {
        int rs = 0;
        try {
            rs = Jdbc.executeUpdate(sql_insert, news.getTitle(), news.getContent(), news.getImage(), 
                    news.getPosteddate(), news.getAuth(), news.getViewcout(), news.getCategoty_id(), news.isHome());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    //insert
    public static int insert(String title, String content, String image, Date posteddate, int auth, int viewcout, int categoty_id, boolean home) {
        int rs = 0;
        try {
            rs = Jdbc.executeUpdate(sql_insert, title, content, image, posteddate, auth, viewcout, categoty_id, home);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    //update
    public static int update(News news) {
        int rs = 0;
        try {
            rs = Jdbc.executeUpdate(sql_update, news.getTitle(), news.getContent(), news.getImage(), 
                    news.getPosteddate(), news.getAuth(), news.getViewcout(), news.getCategoty_id(), news.isHome(), news.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    //delete
    public static int delete(Integer id) {
        int rs = 0;
        try {
            rs = Jdbc.executeUpdate(sql_delete, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    //lấy hết data
    public static List<News> findAll() {
        List<News> list = new ArrayList<News>();
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_selectAll);
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth"); 
                int viewcout = resultSet.getInt("viewcout");
                int categoty_id = resultSet.getInt("categoty_id");
                boolean home = resultSet.getBoolean("home");
                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);
                news.setCategoty_id(categoty_id);
                news.setHome(home);
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //lay theo id
    public static News findById(int id) {
        News news = null;
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_selectById, id);
            while(resultSet.next()) {
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth"); 
                int viewcout = resultSet.getInt("viewcout");
                int categoty_id = resultSet.getInt("categoty_id");
                boolean home = resultSet.getBoolean("home");
                news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);
                news.setCategoty_id(categoty_id);
                news.setHome(home);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }
    
    //find by home
    public static List<News> findByHome(boolean home) {
        List<News> list = new ArrayList<News>();
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_selectByHome);
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth"); // SỬA: author -> auth
                int viewcout = resultSet.getInt("viewcout");
                int categoty_id = resultSet.getInt("categoty_id");
                
                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);
                news.setCategoty_id(categoty_id);
                news.setHome(home);
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //find top 5
    public static List<News> findTop5() {
        List<News> list = new ArrayList<News>();
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_select_top_5);
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth");
                int viewcout = resultSet.getInt("viewcout");
                int categoty_id = resultSet.getInt("categoty_id");
                boolean home = resultSet.getBoolean("home");
                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);
                news.setCategoty_id(categoty_id);
                news.setHome(home);
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //Find by category
    public static List<News> findByCategoryId(int categoryId) {
        List<News> list = new ArrayList<News>();
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_select_by_category_id, categoryId);
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth"); // SỬA: author -> auth
                int viewcout = resultSet.getInt("viewcout");             
                boolean home = resultSet.getBoolean("home");
                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);            
                news.setHome(home);
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //lay theo author
    public static List<News> findByAuthor(int author) {
        List<News> list = new ArrayList<News>();
        try {
            ResultSet resultSet = Jdbc.executeQuery(sql_select_by_author, author);
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                Date posteddate = resultSet.getDate("posteddate");
                int auth = resultSet.getInt("auth"); 
                int viewcout = resultSet.getInt("viewcout");
                int categoty_id = resultSet.getInt("categoty_id");
                boolean home = resultSet.getBoolean("home");
                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setImage(image);
                news.setPosteddate(posteddate);
                news.setAuth(auth); 
                news.setViewcout(viewcout);
                news.setCategoty_id(categoty_id);
                news.setHome(home);
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}