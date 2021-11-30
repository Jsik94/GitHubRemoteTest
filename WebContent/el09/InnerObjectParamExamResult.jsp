<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<%
	//JSTL foreach
	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] inters = request.getParameterValues("inter");
	String grade = request.getParameter("grade");
	
	

	
%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
		<legend>자바코드(스크립팅 요소)로 파라미터 받기</legend>
		<h3>getParameter() /getParmeterValues() 계열로</h3>
		<ul>
			<li>이름: <%=name %></li>
			<li>성별: <%=gender %></li>			
			<li>관심사항: 
			<% 
				for(String inter : inters){
					out.write(inter +" ");
				}
			%>
			</li>
			
			<li>학력:<%=grade %></li>
		</ul>
		
		
		<h3>getParmeterMap() 계열로</h3>
		<%
			
			Map<String,String[]> map = request.getParameterMap();
			
			for(Map.Entry<String,String[]> entry : map.entrySet()){
				if(entry.getValue().length!=1){
					
				}
			}
			
			
		%>
		
		<ul>
			<li>이름: <%=map.get("name")[0] %></li>
			<li>성별: <%=map.get("gender")[0] %></li>			
			<li>관심사항: <%= Arrays.toString(map.get("inter")).toString() %></li>
			<li>학력:<%=map.get("grade")[0] %></li>
		</ul>
	</fieldset>
	
		
	
	<fieldset>
		<legend>EL로 파라미터 받기</legend>
		<!--
			하나받을때:param.파라미터명 혹은 param["파라미터명"]
			여러개 받을때:paramValues.파라미터명 혹은 paramValues["파라미터명"]
        -->
		<ul>
			<li>이름: ${param.name}</li>
			<li>성별: ${param.gender}</li>
			<li>관심사항: 
			<c:forEach var="inters" items="${paramValues.inter}" varStatus="status">
				${status.count}: ${inters} &nbsp;
			</c:forEach>
			</li>
			
			<li> 관심사항 역순 출력하기 :
			<c:set var="interSize" value="${fn:length(paramValues.inter)}" />
				
			<c:forEach var="i"  begin = "1" end="${interSize}">
				${interSize-i+1}. ${paramValues.inter[interSize-i]} &nbsp;
			</c:forEach>
			</li>
			<li>학력: ${param.grade }
			
			</li>
		</ul>
	</fieldset>

</body>
</html>