<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("member", new MemberDTO("idds","1234","가학래",null,"23"));
	

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend>삽입하는 페이지에 파라미터 전달</legend>
		<!-- include 는 직접 쿼리를 가진 jsp 페이지를 전달 못함 -->
		<jsp:include page="InlcudedPage.jsp">
			<jsp:param value="idds" name="id"/>
			<jsp:param value="1234" name="pwd"/>
			<jsp:param value="가학래" name="query"/>
		</jsp:include>
	
	</fieldset>


</body>
</html>