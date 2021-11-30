package model;

import java.sql.Date;

public class MemberDTOB {

	private String id;
	private String pwd;
	private String name;
	private java.sql.Date regidate;
	private String age;
	
	
	private MemberDTOB() {
		
	}


	private MemberDTOB(String id, String pwd, String name, Date regidate, String age) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.regidate = regidate;
		this.age = age;
	}
	
	private MemberDTOB(Builder builder) {
		this.id=builder.id;
		this.pwd=builder.pwd;
		this.name=builder.name;
		this.regidate=builder.regidate;
		this.age=builder.age;
	}
	
	
	 public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public java.sql.Date getRegidate() {
		return regidate;
	}


	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("이름 :%s, 아이디 : %s, 비번: %s, 나이: %s",name,id,pwd,age);
	}
	
	public static class Builder{

		private String id;
		private String pwd;
		private String name;
		private java.sql.Date regidate;
		private String age;
		MemberDTOB instance = null;
		
		
		public Builder(String id,String pwd,String name) {
			this.id = id;
			this.pwd = pwd;
			this.name = name;
			regidate =new Date(new java.util.Date().getTime());
			age = "10";
		}
		
		
		
		


		public Builder setRegidate(java.sql.Date regidate) {
			this.regidate = regidate;
			
			return this;
		}






		public Builder setAge(String age) {
			this.age = age;
			
			return this;
		}






		public MemberDTOB build() {
			
			
			return new MemberDTOB(this);
		}
		
		
		
		
		
	}
	
}
