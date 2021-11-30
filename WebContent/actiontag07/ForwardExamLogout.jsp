<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- 로그아웃 시키세요 ~~~ 로그인페이지로 이동시키세요~ -->
	<%
		session.invalidate();
		response.sendRedirect("ForwardExamLogin.jsp");
		
		/*
			<!-- 
	
				<jsp:forward page="ForwardExamLogin.jsp"></jsp:forward>
	
	 		-->
		
		*/
	%>
	
