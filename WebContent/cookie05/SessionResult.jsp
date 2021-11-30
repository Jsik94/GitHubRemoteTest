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
		<legend>세션 확인 페이지</legend>
		<ul>
			<li>세션 아이디 : <%=session.getId() %> </li>
		</ul>
	</fieldset>

</body>
</html>