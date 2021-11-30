<%@page import="model.MemberDTO"%>
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
		<legend>InnerObjectParamIndex에서 넘어온 값들(EL = param 내장 객체) </legend>
		<h2>자바 코드로 영역에 저장된 값 불러오기</h2>
		
		<%
		
			MemberDTO member =(MemberDTO)request.getAttribute("DtoObject");
		
		%>
		

		
		<h2>자바 코드로 영역에 저장된 속성</h2>
		<ul>
			<li><%= member.toString() %></li>
			<li><%= request.getAttribute("StringObject").toString() %></li>
			<li><%= request.getAttribute("IntegergObject").toString() %></li>
			
		</ul>
		
		<h2>자바 코드로 파라미터에 저장된 속성</h2>
		<%
			int first = Integer.parseInt(request.getParameter("first"));
			int second = Integer.parseInt(request.getParameter("second"));
		
		%>
		
		두 영역에 저장된 값 : <%= first + second %>
		
		<h2>EL로 영역에 저장된 속성 및 파라미터로 저장된 전달값 읽기</h2>
		
		<!-- 
			param -> getParam
			paramValues -> getParameterValues 와 같음
		
		 -->
		 
		 <h4> 영역에 저장된 속성</h4>
			<ul>
				<li>${DtoObject }</li>
				<li>${StringObject }</li>
				<li>${requestScope.IntegerObject }</li>
				
			</ul>
			
		<h4>파라미터로 전잘된 값</h4>
		<!-- Param 내장객체는 생략하면 안된다. -->
			두 영역에 저장된 값 : ${param.first+param.second }
	</fieldset>
</body>
</html>