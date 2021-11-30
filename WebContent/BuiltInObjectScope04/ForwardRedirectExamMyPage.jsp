<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardRedirectExamPage</title>
</head>
<body>
	<fieldset>
		<legend>마이 페이지</legend>
		<h2>request영역에서 읽어오기</h2>
		
		<ul>
			<li>아이디 : <%=request.getAttribute("id") %> </li>
			<li>비번 :  <%=request.getAttribute("pwd")  %></li>
		
		
		</ul>
		
		<h2>파라미터에서 읽어오기</h2>
		
		<ul>
			<li>아이디 : <%= request.getParameter("id")%>  </li>
			<li>비번 :  <%=  request.getParameter("pwd")%></li>
		
		
		</ul>
		
		
	</fieldset>

</body>
</html>