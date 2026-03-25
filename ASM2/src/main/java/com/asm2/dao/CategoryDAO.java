package com.asm2.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.asm2.entity.Category;
import com.asm2.util.Jdbc;

public class CategoryDAO {
	static String sql_insert ="insert into categories values(?)";
	static String sql_update ="update categories set name=? where id=? ";
	static String sql_delete ="delete from categories where id=?";
	static String sql_selectAll ="select * from categories order by id desc";
	static String sql_selectById ="select * from categories where id=?";
	
	public static int insert(Category category) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_insert, category.getName());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static int insert(String name) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_insert, name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	//update
	public static int update(Category category) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_update, category.getName(), category.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static int update(String name, int id) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_update, name, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int delete(Category category) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_delete, category.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static int delete(int id) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_delete, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static List<Category> findAll() {
		List<Category> list = new ArrayList<Category>();
		ResultSet resultSet;
		try {
			resultSet = Jdbc.executeQuery(sql_selectAll);
			while(resultSet.next()) {
				String name = resultSet.getString("name");
				int id = resultSet.getInt("id");
				Category category = new Category();
				category.setId(id);
				category.setName(name);
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static Category findById(int id) {
		Category category = new Category();
		ResultSet resultSet;
		try {
			resultSet = Jdbc.executeQuery(sql_selectById, id);
			while(resultSet.next()) {
				String name = resultSet.getString("name");
				category.setId(id);
				category.setName(name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}

	
}
