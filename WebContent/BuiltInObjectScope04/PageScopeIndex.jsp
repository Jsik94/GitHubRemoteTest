<%@page import="model.MemberDTOB"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	pageContext.setAttribute("param1", new Integer(10));
    	pageContext.setAttribute("param1", new Integer(20));
    	pageContext.setAttribute("param2", "문자열");
    	pageContext.setAttribute("param3", new Date(new java.util.Date().getTime()));

    	
    	
    	new MemberDTOB.Builder("122","2323","@323")
    		.setAge("10")
    		.build();
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeIndex</title>
</head>
<body>
	<fieldset>
			<legend>page 영역</legend>
			<h2>저장된 속성읽기</h2>
	
	
			<ul>
				<li>Param 1: <%=pageContext.getAttribute("param1") %></li>
				<li>Param 2: <%=pageContext.getAttribute("param2") %></li>
				<li>Param 3: <%=pageContext.getAttribute("param3") %></li>
				<li>Param 4: <%=pageContext.getAttribute("param4").toString() %></li>
			
			
			</ul>
			
			<h2>저장된 속성 삭제 후 읽기</h2>
			
				<%
					//속성명이 틀렸을때 삭제안됨 에러는 안남 
					pageContext.removeAttribute("param5");
				
					pageContext.removeAttribute("param1");
				
				%>
				
			<ul>
				<li>Param 1: <%=pageContext.getAttribute("param1") %></li>
				<li>Param 2: <%=pageContext.getAttribute("param2") %></li>
				<li>Param 3: <%=pageContext.getAttribute("param3") %></li>
				<li>Param 4: <%=pageContext.getAttribute("param4").toString() %></li>
			
			
			</ul>
			
			
			<h2>페이지 이동</h2>
			<a href="PageScopeResult.jsp">사용자 클릭에 의한 이동</a>
			<%@ include file ="PageScopeIncludedPage.jsp" %>
			
			
	</fieldset>

</body>
</html>