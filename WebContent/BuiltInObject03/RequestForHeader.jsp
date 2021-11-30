<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForHeader</title>
</head>
<body>
	<fieldset>
		<legend>요청헤더명 : 요청헤더 값</legend>
			<ul style = "list-style : upper-roman">
				<%
					//모든 헤더 얻기 getHeaderNames()
					//헤더명에 따른 헤더값 : getHeader(헤더명)
					
					Enumeration<String> data = request.getHeaderNames();
					
					while(data.hasMoreElements()){
						
						String key= data.nextElement();
						//헤더값 얻기	
						String val = request.getHeader(key);
				%>
				<li><%=key %> : <%=val %></li>
				
				<%
					}
				%>
			</ul>
		
	</fieldset>

</body>
</html>