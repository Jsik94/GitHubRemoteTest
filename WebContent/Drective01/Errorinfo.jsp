<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Errorinfo.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러 발생</legend>
		<h2>관리자에게 문의하세요: 010-1234-5678</h2>
		<h2>에러 내용</h2>
		<% 	//page 에서 isErroPage 로 설정하면 exception 내장객체를 사용할 수 있다.
			// 심지어 페이지 인덱스도 오류 발생인덱스임 
			%>
		<%= exception.getMessage() %>
	</fieldset>

</body>
</html>