<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardedPage</title>
</head>
<body>
	<fieldset>
	
			<h4>포워드된 페이지</h4>
			<ul>
				<li>name : <%=request.getParameter("name")  %> </li>
				<li>id : <%=request.getParameter("id")  %> </li>
				<li>query : <%=request.getParameter("query")  %> </li>
			
			
			</ul>
	
	</fieldset>


</body>
</html>