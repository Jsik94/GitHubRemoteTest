<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	*{
	
		font-size: 34px;
	
	}

</style>
<body>


	<%
		Integer[] answers = {14,23,36,41,52};
	
	%>
	<c:set var="answers" value="<%= answers %>"/>
	<c:set var="result"/>

	<fieldset style="width: 200px; justify-content: center">
		<legend> Result</legend>
		
		<table style="border : 2px black solid;">
			<tr >
				<th>번호</th>
				<th>결과</th>
			</tr>
			
			
			<c:forEach var="answer" items="${answers }" varStatus="loop">
				<c:set var="input">pro${loop.count}</c:set>
				<tr>
					<td style = "border: 1px black solid;">${loop.count }번</td>
					<td style = "border: 1px black solid;">${answer eq param[input] ? "정답" : answer} </td>
				</tr>
	
			</c:forEach>

		
		</table>
	
	
	</fieldset>

</body>
</html>