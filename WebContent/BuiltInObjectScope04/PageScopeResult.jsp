<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeResult</title>
</head>
<body>
	<fieldset>
		<legend>Request 영역</legend>
			<h2>저장된 속성읽기</h2>
	
	
			<ul>
				<li>Param 1: <%=request.getAttribute("param1") %></li>
				<li>Param 2: <%=request.getAttribute("param2") %></li>
				<li>Param 3: <%=request.getAttribute("param3") %></li>
			
			
			</ul>
		
	
	
	</fieldset>
</body>
</html>