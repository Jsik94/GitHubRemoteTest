<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>세션</legend>
		 	<li>세션 기한 (웹은 분단위임) : <%=session.getMaxInactiveInterval()%></li>
		 	<% //session.setMaxInactiveInterval(5); %>
		 	
		 	<li>세션 기한 (변경) : <%=session.getMaxInactiveInterval()%></li>
		 	<li>세션 아이디 : <a href ="SessionResult.jsp"><%=session.getId() %></a></li>
		 	
		 	
			<%

		 		//세션의 최초 생성시간
		 		long dat = session.getCreationTime();
		 		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 		String create_date = sm.format(new Date(dat));		
		 		
		 		//클라이언트 마지막요청시간
		 		long dat_l = session.getLastAccessedTime();
		 		String last_date = sm.format(new Date(dat_l));	
			%>
			
			<li>세션 최초 생성 시간 : <%=create_date %></li>
			<li>클라이언트 최근 요청시간 : <%=last_date %></li>
			
			
			<h2>세션 및 리퀘스트 영역에 속성 저장</h2>
				<%
					request.setAttribute("requestScope", "val1");
					session.setAttribute("sessionScope", "val1");
				%>
			
	</fieldset>
</body>
</html>