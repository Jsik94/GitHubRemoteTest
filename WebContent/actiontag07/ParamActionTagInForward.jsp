<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//포워드 시키기전에 인코딩을 먼저하자!
	
	request.setCharacterEncoding("UTF-8");
	
	String pageUrl = "ForwardedPage.jsp?query=쿼리스트링";
	String paramValue = "KOSMO";
	
	request.setAttribute("member", new MemberDTO("idds","1234","가학래",null,"23"));
	

	


%>


<jsp:forward page=<%=pageUrl %>>
	<jsp:param value="코스모" name="name"/>
	<jsp:param value="<%=paramValue %>" name="id"/>
</jsp:forward>