<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out</title>
</head>
<body>
	<fieldset>
		<legend>out 내장 객체</legend>
		<h2>버퍼와 관련된 메소드</h2>
		<%
			out.println("배고파ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</br>");
			out.flush();
			
			out.println("나 너무 배고파 !!!!");
			out.clearBuffer();
			out.println("서브웨이 먹을꺼야 !!!!!");
		%>
		
		
		<h2>기타 메소드</h2>
		
		<ul>
			<li>자동 플러쉬 여부 : <%= out.isAutoFlush() %></li>
			<li>버퍼 크기  : <%= out.getBufferSize() %></li>
			<li>자동 플러쉬 여부 : <%= out.getRemaining() %></li>
		
		
		</ul>
		
		<h2>print와 println차이</h2>
		
		<h4>print 메소드</h4>
			<%
				out.print("<table style='border-spacing:1px;background-color:red'>");
				out.print("<tr style='background-color:white'>");
				out.print("<td>가</td><td>나</td>");
				out.print("</tr>");
				out.print("</table>");
				
			%>
		
	
				
		<h4>println 메소드</h4>
			<%
				out.println("<table style='border-spacing:1px;background-color:red'>");
				out.println("<tr style='background-color:white'>");
				out.println("<td>가</td><td>나</td>");
				out.println("</tr>");
				out.println("</table>");
			%>
		
	
	
		
	</fieldset>

</body>
</html>