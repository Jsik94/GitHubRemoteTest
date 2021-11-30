<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean</legend>
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id =  request.getParameter("id") == null ? request.getParameter("user") :request.getParameter("id") ;
			String pw =  request.getParameter("pwd") == null ? request.getParameter("pass") :request.getParameter("pwd") ;
			String name = request.getParameter("name");
		
			MemberDTO member = new MemberDTO();
			member.setId(id);
			member.setPwd(pw);
			member.setName(name);
			
		%>
		
		<h2>스크립팅 요소로 가져오기</h2>
		<%=member %>
		
		<h2>액션 태그로 받기</h2>
		<!-- 스텝1] 액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="action" class = "model.MemberDTO"></jsp:useBean>
		<!-- ㅈㄴ사기네 ㅅㅂ -->
		<jsp:setProperty name="action" property="*"/>
		<%=action %>
	
		<h2>속성명이 불일치시  가져오기</h2>
		<jsp:setProperty property="id" name="action" param="user"/>
		<jsp:setProperty property="pwd" name="action" param="pass"/>
		<%=action %>
	
	</fieldset>

</body>
</html>