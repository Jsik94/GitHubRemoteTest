<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%

	/*
	
		주의!!
		redirect 태그는 절대 경로 설정시 contextRoot 제외
		sendRedirect 이동시에는 필요
	
	*/

%>

<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>


<%

	//response.sendRedirect(request.getContextPath()+ "/jstl10/ImportedPage.jsp?user=asd&pass=1234");


%>



<!-- JSTL 태그로 -->

<!-- 
	<c:redirect url="/jstl10/ImportedPage.jsp">
		<c:param name="user" value="KOSMO"></c:param>
		<c:param name="pass" value="123224"></c:param>
	
	</c:redirect>
 -->
 
 <!-- 
 
 
 	context 속성 : 다른 웹 /어플의 /로 시작하는 프로젝트명
  -->
 
 	<c:redirect url="/Index.jsp" context="/App">
		<c:param name="user" value="KOSMO"></c:param>
		<c:param name="pass" value="123224"></c:param>
	
	</c:redirect>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


