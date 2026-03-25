package com.asm2.entity;

import java.sql.Date;

public class User {
	public Integer id;
    public String email;
    public String password;
    public String fullname;
    public Date birthday;        // dùng java.sql.Date
    public boolean gender;
    public String phone;
    public boolean role;

    public User() {}

    public User(Integer id, String email, String password, String fullname, Date birthday,
                boolean gender, String phone, boolean role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.role = role;
    }

    // GETTER & SETTER – QUAN TRỌNG: tên phải đúng chuẩn Java Bean
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    // QUAN TRỌNG: tên là birthday → getter phải là getBirthday()
    public Date getBirthday() { 
        return birthday; 
    }
    
    public void setBirthday(Date birthday) {  // vẫn là java.sql.Date
        this.birthday = birthday;
    }
    public boolean isGender() { return gender; }
    public void setGender(boolean gender) { this.gender = gender; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public boolean isRole() { return role; }
    public void setRole(boolean role) { this.role = role; }
}