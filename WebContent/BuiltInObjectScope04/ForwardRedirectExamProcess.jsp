<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/Validate.jsp" %>
<%

	Map<String,String[]> params = request.getParameterMap();
	String id = request.getParameter("id");
	
	if(!isValidate(out,id,"아이디를 입력하세요")) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out,pwd,"비밀번호를 입력하세요")) return;

	
	
	if(id.equals("KIM") && pwd.equals("1234")){
		//회원인 경우
		
		
		//리퀘스트 영역에 저장
		request.setAttribute("id",id);
		request.setAttribute("pwd",pwd);
		//리다이렉트면 당연히 안됩
		//response.sendRedirect("ForwardRedirectExamMyPage.jsp");
		
		request.getRequestDispatcher("ForwardRedirectExamMyPage.jsp").forward(request,response);
	}else{
		//아이디 및 비번 불일치 
		//리다이렉트는 새요청이므로 historyback이아님 따라서 새요청이라 값들이 초기화됨
		//response.sendRedirect("ForwardRedirectExample.jsp");
		
		

		request.setAttribute("errormsg", "불일치");
		request.getRequestDispatcher("ForwardRedirectExample.jsp").forward(request,response);
		
	}
	
	
	
%>
