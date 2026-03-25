package com.asm2.entity;

public class NewsLetter {
	Integer id;
	String email;
	boolean enabled;
	
	public NewsLetter() {
		// TODO Auto-generated constructor stub
	}

	public NewsLetter(Integer id, String email, boolean enabled) {
		super();
		this.id = id;
		this.email = email;
		this.enabled = enabled;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	
}
