<%@page import="java.io.File"%>
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
		<legend>업로드든 파일 목록 </legend>
		
		<ul>
		 	<li>이름 : ${name }</li>
		 	<li>제목 : ${title }</li>
		 	<li>관심사항 : ${inters }</li>
		 	<li>첨부파일 : ${filename }</li>
		 	<li>첨부파일 용량 : ${ filesize}</li>
		
		</ul>
		
	
	</fieldset>
</body>
</html>