<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeResult</title>
</head>
<body>
	<fieldset>
		<legend>request 영역</legend>
			<h2>저장된 속성읽기</h2>
	
	
			<ul>
				<li>Param 1: <%=request.getAttribute("param1") %></li>
				<li>Param 2: <%=request.getAttribute("param2") %></li>
				<li>Param 3: <%=request.getAttribute("param3") %></li>
				<li>Param 4: <%=request.getAttribute("param4") %></li>
			
			
			</ul>
		
	
	
	</fieldset>
</body>
</html>