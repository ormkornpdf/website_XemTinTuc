package com.asm2.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.asm2.entity.User;
import com.asm2.util.Jdbc;

public class UserDAO {

	static String sql_insert = "INSERT INTO users(email, password, fullname, birthday, gender, phone, role) VALUES(?, ?, ?, ?, ?, ?, ?)";
	static String sql_update = "UPDATE users SET email = ?, password = ?, fullname = ?, birthday = ?, gender = ?, phone = ?, role = ? WHERE id = ?";
	static String sql_delete = "DELETE FROM users WHERE id = ?";
	static String sql_selectall = "SELECT * FROM users ORDER BY id DESC";
	static String sql_selectById = "SELECT * FROM users WHERE id = ?";
	static String sql_selectByEmail = "SELECT * FROM users WHERE email = ?";

	public static int insert(User user) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_insert, user.getEmail(), user.getPassword(), user.getFullname(), user.getBirthday(), user.isGender(), user.getPhone(), user.isRole());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static int insert(String email, String password, String fullname, Date birthDate, boolean gender, String phone, boolean role) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_insert, email, password, fullname, birthDate, gender, phone, role);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	//update
	public static int update(User user) {
		int rs = 0;
		try {
			rs = Jdbc.executeUpdate(sql_update, user.getEmail(), user.getPassword(), user.getFullname(), user.getBirthday(), user.isGender(), user.getPhone(), user.isRole(), user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    return rs;
	}
	public static User findById(int id) {
	    try (ResultSet rs = Jdbc.executeQuery(sql_selectById, id)) {
	        if (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setFullname(rs.getString("fullname"));
	            user.setBirthday(rs.getDate("birthday"));  // java.sql.Date → đúng
	            user.setGender(rs.getBoolean("gender"));
	            user.setPhone(rs.getString("phone"));
	            user.setRole(rs.getBoolean("role"));
	            return user;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; // không tìm thấy
	}
//	  public static User findById(int id) {
//	        User user = null;
//	        try {
//	            ResultSet resultSet = Jdbc.executeQuery(sql_selectById, id);
//	            if(resultSet.next()) {
//	                user = new User();
//	                user.setId(resultSet.getInt("id"));
//	                user.setFullname(resultSet.getString("fullname"));
//	                user.setEmail(resultSet.getString("email"));
//	                user.setPassword(resultSet.getString("password"));
//	                user.setRole(resultSet.getBoolean("role"));
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return user;
//	    }
	
	public static User findByEmail(String email) {
	    try (ResultSet rs = Jdbc.executeQuery(sql_selectByEmail, email)) {
	        if (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setFullname(rs.getString("fullname"));
	            user.setBirthday(rs.getDate("birthday"));  // đúng kiểu
	            user.setGender(rs.getBoolean("gender"));
	            user.setPhone(rs.getString("phone"));
	            user.setRole(rs.getBoolean("role"));
	            return user;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	//lấy danh sách all
	public static List<User> findAll() {
	    List<User> list = new ArrayList<>();
	    try (ResultSet rs = Jdbc.executeQuery(sql_selectall)) {
	        while (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setFullname(rs.getString("fullname"));
	            user.setBirthday(rs.getDate("birthday"));
	            user.setGender(rs.getBoolean("gender"));
	            user.setPhone(rs.getString("phone"));
	            user.setRole(rs.getBoolean("role"));
	            list.add(user);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	//k thể xóa người dùng khi đã đăng b
	public static boolean hasPostedNews(int userId) {
	    String sql = "SELECT COUNT(*) FROM news WHERE auth = ?";
	    try {
	        ResultSet resultSet = Jdbc.executeQuery(sql, userId);
	        if(resultSet.next()) {
	            int count = resultSet.getInt(1);
	            return count > 0; // Trả về true nếu có bài viết
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	public void saveOTP(Integer id, String otp) {
		// TODO Auto-generated method stub
		
	}

	public boolean verifyOTP(Integer id, String otp) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updatePassword(Integer id, String newPassword) {
		// TODO Auto-generated method stub
		return false;
	}

	public void clearOTP(Integer id) {
		// TODO Auto-generated method stub
		
	}

	public boolean checkPassword(Integer id, String currentPassword) {
		// TODO Auto-generated method stub
		return false;
	}
}
