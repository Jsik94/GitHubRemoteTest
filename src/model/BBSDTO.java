package model;

import java.sql.Date;

public class BBSDTO {
	
	private String no;
	private String id;
	private String title;
	private String content;
	private String visitCount;
	private java.sql.Date postDate;
	private String name;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BBSDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BBSDTO(String no, String id, String title, String content, String visitCount, Date postDate, String name) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.visitCount = visitCount;
		this.postDate = postDate;
		this.name = name;
	}
	public BBSDTO(String no, String id, String title, String content, String visitCount, Date postDate) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.visitCount = visitCount;
		this.postDate = postDate;
	}
	
	

	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	
	
	

}
