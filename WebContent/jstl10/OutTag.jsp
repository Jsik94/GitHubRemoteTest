<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OutTag</title>
</head>
<body>
	<fieldset>
		<legend>out태그</legend>
		<c:set var="htmlString">
			<h3>h3로 감싼 문자열~~</h3>
		</c:set>
		
		<h2>EL로 출력</h2>
		\${htmlString }: ${htmlString }
		
		<h2>JSTL의 out 태그로 출력</h2>
		
		<!-- html태그를 실행하느냐 text로 실행하느냐 얘끼하는 거임  -->
		<!-- default 값이 텍스트 출력임 -->
		<c:out value="${htmlString }"/>
		
		<h2>Escape XML 사용시 -> html 태그 작동</h2>
		<!-- escape false 시 -->
		<c:out value="${htmlString }" escapeXml="false"/>
		
		
		<h2>Default 속성 </h2>
		<!-- 빈문자열이 있는 경우 -> 값이 있는경우로 처리 -->
		<c:out value="      " default="빈 문자열이다."/>
		<c:out value="${param.yoon }" default ="null 이에요 ~~ "/>
		
		
		<h3>페이지 링크에 응용</h3>
		<c:url value="/BBS08/List.jsp?nowPage="/> <br/>
		<c:out value="${param.nowPage }" default="1"/><br/>
		<a href='<c:url value="/bbs08/List.jsp?nowPage="/><c:out value="${param.nowPage }" default="1"/>'>리스트 </a>
		
		
		
		
		
		
		
	</fieldset>
</body>
</html>