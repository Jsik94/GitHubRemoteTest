<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 다른페이지임 !!
	//request 영역 공유 
	//실행 결과가 포함되는 거임

	
	//변수 선언]
	String ActionPageString = "액션태그로 삽입된 페이지 안에서 선언한 변수";
	
	

%>

<hr/>

<h3>ActionPage 페이지 입니다.</h3>
	<ul>
		<li>페이지 영역 : <%=pageContext.getAttribute("pageVar") %></li>
		<li>리퀘스트 영역 : <%=request.getAttribute("requestVar") %></li>
		
	
	
	</ul>