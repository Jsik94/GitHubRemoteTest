<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//지시어를 활용할 jsp임 당연히 개인 서블릿은 안나온다 !!!

	
	//변수 선언]
	String directiveString = "지시어로 삽입된 페이지 안에서 선언한 변수";
	
	

%>

<hr/>

<h3>Directive 페이지 입니다.</h3>
	<ul>
		<li>페이지 영역 : <%=pageContext.getAttribute("pageVar") %></li>
		<li>리퀘스트 영역 : <%=request.getAttribute("requestVar") %></li>
	
	
	
	</ul>