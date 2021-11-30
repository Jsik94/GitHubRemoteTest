<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForContentType</title>
</head>
<body>
	<fieldset>
		<legend>ContentType 응답헤더 </legend>
		<h3>서블릿에서 직접 브라우저로 스트림 출력(setContentType메소드 필요!!)</h3>
		<!--
		
			 서블릿으로 요청거는 방법 
			여긴 그래서 반드시 /ContextRoot/의 경로가 필요하지만 그이후는 전혀 상관이없음 
			
			단, web.xml의 url-pattern 요소에서는 context 루트 제외하고 시작 
		-->
		<a href="<%=request.getContextPath() %>/An/Bake/SetContentType.kosmo">서블릿으로 요청 보내기</a>
	</fieldset>


</body>
</html>