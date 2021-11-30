<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	
	if(user.equals("KIM") && pass.equals("1234")){
		
		
		session.setAttribute("USER_ID", user);

		session.setAttribute("USER_PASS", pass);
		
		response.sendRedirect("MyPage.jsp");
		
	}else{
		
		
		request.setAttribute("NOT_LOGIN","아이디 비번 불일치");
		
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	
	
%>