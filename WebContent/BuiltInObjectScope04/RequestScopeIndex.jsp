<%@page import="model.MemberDTOB"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setAttribute("param1", new Integer(10));
    	request.setAttribute("param1", new Integer(20));
    	request.setAttribute("param2", "문자열");
    	request.setAttribute("param3", new Date(new java.util.Date().getTime()));

    		
    	
    	request.setAttribute("param6",new MemberDTOB.Builder("122","2323","@323")
    		.setAge("15")
    		.build()
    		);
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeIndex</title>
</head>
<body>
	<fieldset>
			<legend>Request 영역</legend>
			<h2>저장된 속성읽기</h2>
	
	
			<ul>
				<li>Param 1: <%=request.getAttribute("param1") %></li>
				<li>Param 2: <%=request.getAttribute("param2") %></li>
				<li>Param 3: <%=request.getAttribute("param3") %></li>
				<li>Param 4: <%=request.getAttribute("param4").toString() %></li>
				<li>Param 6: <%=request.getAttribute("param6").toString() %></li>
			
			
			</ul>
			
			<h2>저장된 속성 삭제 후 읽기</h2>
			
				<%
					//속성명이 틀렸을때 삭제안됨 에러는 안남 
					request.removeAttribute("param5");
				
					request.removeAttribute("param1");
				
				%>
				
			<ul>
				<li>Param 1: <%=request.getAttribute("param1") %></li>
				<li>Param 2: <%=request.getAttribute("param2") %></li>
				<li>Param 3: <%=request.getAttribute("param3") %></li>
				<li>Param 4: <%=request.getAttribute("param4") %></li>
			
			
			</ul>
			
			
			<h2>페이지 이동</h2>
			<a href="RequestScopeResult.jsp">사용자 클릭에 의한 이동</a>
			
			<%
			//[forward방식]
			/*
			 -최초 요청시 생성된 request객체를 포워드되는
			   페이지로 전달한다.
			 -고로 포워드 되는 페이지와 리퀘스트 영역을
			   공유한다
			 -URL주소창에는 최초 요청한 URL이 보인다.
			 (포워드된 URL아님)
			*/
			/*
				request.getRequestDispatcher("/BuiltInObjectScope04/RequestScopeResult.jsp")
				.forward(request, response);
			*/
			
				response.sendRedirect(request.getContextPath()+"/BuiltInObjectScope04/RequestScopeResult.jsp");
			
			
			%>
			
			
	</fieldset>

</body>
</html>