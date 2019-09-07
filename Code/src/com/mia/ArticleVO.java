package com.mia;

import java.sql.Date;

public class ArticleVO {

	int num;
	String title;
	String writer;
	String content;
	Date writeDate;
	int hit;
	int recommand;
	
	public ArticleVO() {
		
	}
	
	public ArticleVO(int num, String title, String writer, String content, Date writeDate, int hit, int recommand) {

		this.num=num;
		this.title=title;
		this.writer=writer;
		this.content=content;
		this.writeDate=writeDate;
		this.hit=hit;
		this.recommand=recommand;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecommand() {
		return recommand;
	}

	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}
}
