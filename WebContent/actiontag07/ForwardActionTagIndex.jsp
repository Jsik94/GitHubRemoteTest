<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//포워드 전(前) 영역에 속성저장
	pageContext.setAttribute("pageVar", "페이지 영역입니다.");
	request.setAttribute("requestVar", "리퀘스트 영역");
	
	//request.getRequestDispatcher("/actiontag07/ForwardActionTagResult.jsp").forward(request, response);
	
%>

<jsp:forward page="/actiontag07/ForwardActionTagResult.jsp" />