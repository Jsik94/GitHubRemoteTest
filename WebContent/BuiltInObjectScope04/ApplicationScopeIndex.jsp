<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDTOB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDTOB m1 = new MemberDTOB.Builder("ids","123","가길동좌")
				.build();

	MemberDTOB m2 = new MemberDTOB.Builder("ids","1234","나길동좌")
				.build();
	
	MemberDTOB m3 = new MemberDTOB.Builder("ids","1235","다길동좌")
				.build();
	
	MemberDTOB m4 = new MemberDTOB.Builder("ids","1236","라길동좌")
				.setAge("20")
				.build();

	List<MemberDTOB> mylist = Arrays.asList(m1,m2,m3,m4);

	//맵계열 컬렉션에 객체 저장
	Map<String,MemberDTOB> map = new HashMap<>();
	
	map.put("first",m1);
	map.put("second",m2);	
	map.put("third",m3);	
	map.put("fourth",m4);
	   //application영역에 컬렉션들 저장
	application.setAttribute("list", mylist);
	application.setAttribute("map", map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
	<legend>application 영역</legend>
	<h2>사용자 클릭으로 페이지 이동</h2>
	
	<a href = "ApplicationScopeResult.jsp"> 하잉</a>
	
	<%
		//request.getRequestDispatcher("/BuiltInObjectScope04/ApplicationScopeResult.jsp").forward(request, response);
	%>
	
	<%
		//반드시 리다이렉트시엔 contextRoot 붙여야함
		response.sendRedirect(request.getContextPath()+"/BuiltInObjectScope04/ApplicationScopeResult.jsp");
	
	%>
	
</fieldset>

</body>
</html>