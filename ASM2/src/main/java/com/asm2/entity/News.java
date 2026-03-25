package com.asm2.entity;

import java.util.Date;

public class News {
	Integer id;
	String title;
	String content;
	String image;
	Date posteddate;
	Integer auth;
	int viewcout;
	Integer categoty_id;
	boolean home;
	
	public News() {
		// TODO Auto-generated constructor stub
	}

	public News(Integer id, String title, String content, String image, Date posteddate, Integer auth, int viewcout,
			Integer categoty_id, Boolean home) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.posteddate = posteddate;
		this.auth = auth;
		this.viewcout = viewcout;
		this.categoty_id = categoty_id;
		this.home = home;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getPosteddate() {
		return posteddate;
	}

	public void setPosteddate(Date posteddate) {
		this.posteddate = posteddate;
	}

	public Integer getAuth() {
		return auth;
	}

	public void setAuth(Integer auth) {
		this.auth = auth;
	}

	public int getViewcout() {
		return viewcout;
	}

	public void setViewcout(int viewcout) {
		this.viewcout = viewcout;
	}

	public Integer getCategoty_id() {
		return categoty_id;
	}

	public void setCategoty_id(Integer categoty_id) {
		this.categoty_id = categoty_id;
	}

	public boolean isHome() {
		return home;
	}

	public void setHome(boolean home) {
		this.home = home;
	}

	
	
	
}
