<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//세션영역에 저장된 정보를 지우면됨
	
	//sol 1
	//session.removeAttribute("uid");
	//session.removeAttribute("upw");

	//sol 2
	session.invalidate();
	
	response.sendRedirect("CookieExamIndex.jsp");

%>