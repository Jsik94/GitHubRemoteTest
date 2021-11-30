<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>url 태그</legend>
		<!-- 
			url 생성시 사용 
			-절대경로로 생성시에는 역시 컨텍스트 루트 제외 즉 컨텍스트 루트 신경쓸필요로 없다.
			-var 속성 미지정시 바로 출력
			url이 출력됨 ( 파라미터 url로 전달됨)
		
		 -->
		 
		<h2>var속성 미지정</h2>
		<c:url value="/jstl10/ImportedPage.jsp" >
			<c:param name="user" value="KKMM"></c:param>
			<c:param name="pass" value="2232"></c:param>
		</c:url>
		
		<h2>var 속성을 미지정</h2>
		<c:url value="/jstl10/ImportedPage.jsp" var ="url">
			<c:param name="user" value="KKMM"></c:param>
			<c:param name="pass" value="2232"></c:param>
		</c:url>
		<h2>내가 원하는 위치에서 URL 사용 </h2>
		<a href="${url }"> move to page</a>
		
		
		<h2>HTML 태그안에서 JSTL로 절대 경로를 지정할때</h2>
		<a href="<c:url value ="/jstl10/ImportedPage.jsp?user=kkkk&pass=2223333" />"> move to page</a>
	</fieldset>
</body>
</html>