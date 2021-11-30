<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    	String id = request.getParameter("user");
    
    	String pw = request.getParameter("pass");
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardExamMyPage.jsp</title>
</head>
<body>
<fieldset>
		<legend>forward액션태그-마이페이지</legend>
		<h2>세션영역에서 가져오기</h2>
		<ul>
			<li>아이디:<%=session.getAttribute("U_ID") %></li>
			<li>비번:<%=session.getAttribute("U_PW") %></li>
		</ul>
		<h2>파라미터로 거져오기</h2>
		<ul>
			<li>아이디:<%= id%></li>
			<li>비번:<%=pw %></li>
		</ul>
		
		<%
			session.setAttribute("U_ID",id );
			session.setAttribute("U_PW",pw );
			
			request.setAttribute("R_ID",id );
			request.setAttribute("R_PW",pw );
		%>
		<a href="ForwardExamLogout.jsp">로그아웃</a>
	</fieldset>
</body>
</html>