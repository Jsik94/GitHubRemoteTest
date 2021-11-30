<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IncludePage.jsp -->
<!-- 해당 페이지는 서블릿으로 변환되는것이 아님  서블릿 변환시 html이 달려있는 페이지로 붙여서 나옴 -->
<!--  여러 JSP 페이지에서 공통으로 사용할 변수나 상수, 메소드 정의 -->


<%! 
	SimpleDateFormat dataformat = new SimpleDateFormat();
	//공통 메소드
	String getDate(String pattern){
		dataformat.applyPattern(pattern);
		return dataformat.format(new Date());
	}
	
%>
<%
	//공통 변수
	String tempPage =request.getRequestURI().toString();
	int beginIndex = tempPage.lastIndexOf("/")+1;
	String currentPage = tempPage.substring(beginIndex);

%>