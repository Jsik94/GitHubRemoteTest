<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImportTag.jsp</title>
</head>
<body>
	<fieldset>
		<lengend>Import tag</lengend>
		<!-- 
		
			리퀘스트 영역에 속성을 저장
			URL 설정시 프로젝트명 제외 (server.xml의 Context 태그의 path값에 따름)
		
		 -->
		 
		 <c:set scope="request" var ="requestvar" value="리퀘스트영역"/>
		 <h2>var 속성 미지정, 현재 위치에 바로 삽입됨(include 액션태그와 같다.)</h2>
		 <%
		 	//현재위치에 삽입될때
		 %>
		 <c:import url="ImportedPage.jsp" >
		 	<c:param name="user" value="PPAKA"></c:param>
		 	<c:param name="pass" value="1234"></c:param>
		 </c:import> 
		 
		 <h2>var 속성 미지정, 현재 위치에 바로 삽입됨(include 액션태그와 같다.)</h2>
		 <%
		 	//원하는 위치에 삽입하고자 할때 씀, 미리 준비해놓았다고생각하면됨
		 %>
		 
		<%-- 
		 <c:import url="ImportedPage.jsp" var="content" >
		 	<c:param name="user" value="PPAKA"></c:param>
		 	<c:param name="pass" value="1234"></c:param>
		 </c:import> 
		 
		 --%>
		
		<h3>아래에 import된 페이지 내용 출력</h3>
		
		
		<h3>iframe 와 url 태그를 이용하여, 아래에 nate페이지를 출력하시오. </h3>
		<h4>단, css까지 완벽하게   출력하시오.</h4>

		<%-- ANSWER LINE --%>
		
		
	<iframe src="ImportedNate.jsp" style="border: none; width: 100% ; height: 500px;">
	</iframe>
		
	</fieldset>
	
	
</body>
</html>