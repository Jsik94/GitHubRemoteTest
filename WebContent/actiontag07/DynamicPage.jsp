<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DynamicPage.jsp</title>
</head>
<body>
<fieldset>
		<legend>페이지를 선택해서 동적으로 페이지 포함하기</legend>
		<form>
			<select name="pageName">
				<option value="">페이지를 선택하세요</option>
				<option value="DirectivePage.jsp">DirectivePage.jsp</option>
				<option value="ActionPage.jsp">ActionTagPage.jsp</option>
			</select>
			<input type="submit" value="페이지 선택" />
		</form>
		
		<%
			String name = request.getParameter("pageName");
		
			if(name != null && name.length()!=0){
				
				%>
				<jsp:include page="<%=name %>"></jsp:include>
				<%
			}
		%>
		
	</fieldset>
	<fieldset>
		<legend>계절에 따른 페이지 변환</legend>
		<%
			String season = "";
			Calendar cal = Calendar.getInstance();
			
			switch(cal.get(cal.MONTH)+1){
			
				case 1:
				case 2:
				case 3:
					season = "Spring.jsp";
					break;
				case 4:
				case 5:
				case 6:
					season = "Summer.jsp";
					break;
				case 7:
				case 8:
				case 9:
					season = "Atumn.jsp";
					break;
				case 10:
				case 11:
				case 12:
					season = "Winter.jsp";
					break;
			
			
			}
			
		
		
		%>
		<%=cal.get(cal.MONTH)+1 %>
		<jsp:include page="<%=season %>"></jsp:include>
		
	</fieldset>
</body>
</html>