<%@page import="java.nio.channels.SeekableByteChannel"%>
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
		<legend>요청한 서버와 클라이언트에 대한 정보</legend>
		<form method = "post">
			<input type="submit" value = "서버로 가즈ㅏㅏ"/>
			
		
		</form>
		<ul>
			
	
			<li>Http 메소드 : <%= request.getMethod() %></li>
			<li>전체 URL : <%= request.getRequestURL() %></li>
			<li>도메인을 제외한 URI : <%= request.getRequestURI() %></li>
			<li>요청 프로토콜 : <%= request.getProtocol() %> </li>
			<li>서버 이름 : <%= request.getServerName() %></li>
			<li>포트 : <%= request.getServerPort() %></li>
			<li>Service Path : <%= request.getServletPath() %></li>
			<li>Client IP : <%= request.getRemoteAddr() %></li>
			<li>Client Host : <%= request.getRemoteHost() %></li>
			<li>요청과 관련된 세션 객체 얻기(서블릿에서 사용 - 인증처리) : <%= request.getSession() %></li>
			<li>세션 내장 객체 : <%= session%></li>
			
		</ul>
	
	
	
	</fieldset>

	<!-- 
	
		JSP에서는 웹 어플리케이션 전체 영역을 Context라고 한다  
		HTML에서 절대경로로 링크를 걸때 주로 사용 
	
	-->


	<fieldset>
		<legend>Context Root 얻기</legend>
			<ul>
				<li> 프로젝트 path : <%= request.getContextPath() %></li>
				<li> 프로젝트 type : <%= request.getContentType() %> </li>
			</ul>
	
	</fieldset>

</body>
</html>