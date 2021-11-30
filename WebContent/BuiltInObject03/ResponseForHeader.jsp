<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	//http 1.0 적용시 
	response.setHeader("pragma","no-cache");
	//http 1.1에서 적용시 
	response.setHeader("cache-control","no-cache");
	
	
	//jsp에서는 의미가 없음 -> page의 contentType의 마임타입과 일치하는 데이터임
	//따라서jsp 에서는 의미가 없음 
	//response.setContentType()
	//response.setContentType("binary/octect-stream");
	
	
	//add set -> 맵과 비슷하다 보면 됨
	
	//오늘 날짜를 SET계열로 currentDate란 응답헤더명으로 생성하기
	Date date = new Date();
	long currentTime =date.getTime();
	//알아서 날짜형식으로 매핑됨
	response.setDateHeader("currentDate", currentTime);
	
	
	//add 계열은 추가됨
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
	//response.addDateHeader("currentDate", sdf.parse("2022년2월11일").getTime());
	response.setDateHeader("currentDate", sdf.parse("2022년2월11일").getTime());
	
	//getHeaderNames 로는 개발자가 설정한 내용만 출력됨
	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend>응답헤더</legend>
		
		<ul>
			<%
				Collection<String> keys = response.getHeaderNames();
				
				for(String key : keys ){
					String val = response.getHeader(key);
					%>
						<li>
							<%	out.print(key + " : " + val); %>
						</li>
					<%
				}
			%>
		
		
		</ul>
		
		<h2> 응답 헤더명 존재 여부 판단 : boolean containHeader("HEADERNAME")</h2>
		<h4> contentType 존재 여부 판단  </h4>
		<%= response.containsHeader("content-Type") ? "존재" : "미존재" %>
		<h4> currentDate 존재 여부 판단  </h4>
		<%= response.containsHeader("currentDate") ? "존재" : "미존재" %>
	</fieldset>

</body>
</html>