package com.asm2.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.asm2.entity.NewsLetter;
import com.asm2.util.Jdbc;

public class NewsLetterDAO {
	static String sql_insert ="insert into newsletters values(?, ?)";
	static String sql_selectAll ="select * from newsletters order by id desc";
	
	//insert
			public static int insert(String email, boolean enabled) {
				int rs = 0;
				try {
					rs = Jdbc.executeUpdate(sql_insert, email, enabled);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return rs;
			}
			
			//lay danh sach all
			public static List<NewsLetter> findAll() {
				List<NewsLetter> list = new ArrayList<NewsLetter>();
				try {
					ResultSet rs = Jdbc.executeQuery(sql_selectAll);
					while(rs.next()) {
						Integer id = rs.getInt("id");
						String email = rs.getString("email");
						Boolean enabled = rs.getBoolean("enabled");
						NewsLetter newsLetter = new NewsLetter();
						newsLetter.setId(id);
						newsLetter.setEmail(email);
						newsLetter.setEnabled(enabled);
						list.add(newsLetter);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
				
			}
}
