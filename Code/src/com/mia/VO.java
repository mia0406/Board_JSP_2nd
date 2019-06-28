package com.mia;

public class VO {

	// 데이터접근 클래스
	String id;
	String password;
	String name;
	
	public VO(String id, String password, String name) {
		this.id=id;
		this.password=password;
		this.name=name;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
