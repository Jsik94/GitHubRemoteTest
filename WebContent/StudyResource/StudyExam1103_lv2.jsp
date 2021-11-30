<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	
	<h2>1.JSTL을 이용하여 다음과 같이 만들어 주세요</h2>
	*<br/>
	**<br/>
	***<br/>
	****<br/>
	*****<br/>
	<h2>결과를 여기 밑에 내어주세요</h2>
	
	<%-- ANSWER LINE --%>


	<h2>2.다음 결과를 내어주세요</h2>
	<%
		Map<String,List> myMap = new HashMap<>();
		myMap.put("a",Arrays.asList("apple","ace","accept","asian","air"));
		myMap.put("b",Arrays.asList("base","basic","bus"));
		myMap.put("c",Arrays.asList("cannon","cater","cut","crops"));
	%>

	<c:set var="myMap" values=<%=myMap %>/>
	<ul>
		<li>key값이 a 인 배열의 길이를 구해주세요. : <%-- ANSWER LINE --%></li>
		<li>"bus"를 출력해 주세요  : <%-- ANSWER LINE --%></li>
		<li>"cut"을 대문자로 출력해 주세요 : <%-- ANSWER LINE --%></li>
	
	</ul>
	
		
		
	<h3>3.iframe 와 url 태그를 이용하여, 아래에 nate페이지를 출력하시오. </h3>
	<h4>단, css까지 완벽하게   출력하시오.</h4>
	<%-- ANSWER LINE --%>
	
	
	<h3>4.다음을 ForTokenTag를 통해 나눠 각각 출력하시오.  </h3>
	<% 
		String str="나는 지금 너무 배고프고 집에 가고싶다. 가고싶다. 보내달라... 보내달라.... 한문제남았다...";
	%>
	<%-- ANSWER LINE --%>
	
	<h3>5.fmt 태그를 이용해서 현재 시간을 '오전or오후 XX시XX분XX초' 형식으로 출력하시오.</h3>
	
	<%-- ANSWER LINE --%>
	
	
</body>
</html>