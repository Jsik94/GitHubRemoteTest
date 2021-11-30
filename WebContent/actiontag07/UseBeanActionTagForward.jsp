<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- 
			UseBeanActionTagForward.jsp
		
		
	 -->
	
	<% MemberDTO mem = (MemberDTO)request.getAttribute("member"); %>	 
 	 <h2>리퀘스트 받아서 쓰기!</h2>
 	<ul>
			<li>아이디 : <%=mem.getId() %> </li>
			<li>비번  : <%=mem.getPwd() %></li>
			<li>이름 :  <%=mem.getName() %> </li>
			<li>나이 :  <%=mem.getAge() %></li>
		
		
	</ul>
	<jsp:useBean id="member" scope="request" type="model.MemberDTO"/>
	
	<h2>액션 태그로 읽어오기 </h2>
		<ul>
			<li>아이디 :<jsp:getProperty property="id" name="member"/>  </li>
			<li>비번 :<jsp:getProperty property="pwd" name="member"/>  </li>
			<li>나이 :<jsp:getProperty property="name" name="member"/>  </li>
			<li>이름 :<jsp:getProperty property="age" name="member"/>  </li>

		
		
		</ul>
		
 	<h2>빈에서 받아서 쓰기 !</h2>
 	<ul>
			<li>아이디 : <%=member.getId() %> </li>
			<li>비번  : <%=member.getPwd() %></li>
			<li>이름 :  <%=member.getName() %> </li>
			<li>나이 :  <%=member.getAge() %></li>
		
		
	</ul>
 	
 	
 
 
</body>
</html>