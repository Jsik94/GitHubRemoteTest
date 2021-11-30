<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend>Remove 태그</legend>
		<!-- 각 영역에 JSTL을 이용해서 속성 저장 -->
		
		<my:set var="pagevar" value="페이지 영역"/>
		<my:set var="pagevar" value="리퀘스트 영역1" scope="request" />
		<my:set var="requestvar" value="리퀘스트 영역2" scope="request" />
		<my:set var="sessionvar" value="세션 영역1" scope="session" />
		<my:set var="applicationvar" value="어플리케이션 영역" scope="application" />
		<h2>삭제 전</h2>
		<ul>
			<li>pageVar : ${pagevar }</li>
			<li>pageVar : ${requestScope.pagevar }</li>
			<li>requestVar : ${requestvar }</li>
			<li>sessionVar : ${sessionvar }</li>
			<li>applicationVar : ${applicationvar }</li>
		
		</ul>
		<h2>속성명은 존재하나 영역이 틀린경우 [에러는 나지 않는다.]</h2>
		
		<my:remove var="requestvar" scope="session"/>
		<h4>영역이 다른 속성을 삭제후 출력했을때</h4>
		<ul>
			<li>pageVar : ${pagevar }</li>
			<li>pageVar : ${requestScope.pagevar }</li>
			<li>requestVar : ${requestvar }</li>
			<li>sessionVar : ${sessionvar }</li>
			<li>applicationVar : ${applicationvar }</li>
		
		</ul>
		
		
	
		<h4>동일한 속성명이 여러 영역에 존재하는 경우 scope 미지정 삭제</h4>
		
		<my:remove var="pagevar" />
	
		<ul>
			<li>pageVar : ${pagevar }</li>
			<li>pageVar : ${requestScope.pagevar }</li>
			<li>requestVar : ${requestvar }</li>
			<li>sessionVar : ${sessionvar }</li>
			<li>applicationVar : ${applicationvar }</li>
		
		</ul>
		
		
		
	</fieldset>

</body>
</html>