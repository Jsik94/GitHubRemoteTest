<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="my" uri="/WEB-INF/tld/myTag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachExtend.jsp</title>
</head>
<body>
	<fieldset>
		<legend>확장 for문 형태의 forEach 태그</legend>
		<!-- 
			필수 속성 : items 및 var
			-배열이나 컬랙션에서 값을 꺼내올때 사용
			-varStatus에 지정한 LoopStatusTag객체의 index 속성은 항상  0부터 시작
		
		
		 -->
		 <%
		 	String[] colors = {"red","green","yellow","#2233a5"};
		 
		 
		 %>
		 
		 <h2>자바코드로 배열 출력</h2>
		 <%for(String color: colors){
		  %>
			 <h4 style = "color:<%=color%>">Java Server Page</h4>
		 <%
		 	}	 
		%>
		
		 <h2>EL에서 JSTL로 출력</h2>
		 <c:set var ="colors" value="<%=colors %>"/>
		 
		 <c:forEach var="color" items="${colors }">
		 
		 	<h4 style = "color:${color}">Java Server Page</h4>
		 
		 </c:forEach>
		 
		 <h2>리스트 계열 컬렉션</h2>
		 
		 <%
		 	//데이터 준비
		 	
		 	
		 	List list = Arrays.asList(new MemberDTO("KIM","1234","김길동",null,null),
		 			new MemberDTO("CIM","1234","나길동",null,null),
		 			new MemberDTO("BIM","1234","다길동",null,null),
		 			new MemberDTO("GIM","1234","라길동",null,null));
		 	
		 
		 %>
		 
		 <c:set var ="list" value="<%=list %>"/>
		 
		 <h2>일반 for문 형태의 foreach 태그 출력 </h2>
		 
		 
		 <ul>
			 <c:forEach begin="0" end="${list.size()-1 }" var="i" varStatus="loop">
			 	<li> ${i+1 } : list[${i }]</li>
			 	
			 
			 </c:forEach>
			 
		 </ul>
		 
		 
		 
		 
		 <ul>
			 <c:forEach var = "atom" items="${list }" varStatus="loop">
			 	
			 	<li> ${loop.count } : ${atom }</li>
			 
			 </c:forEach>
		 
		 
		 </ul>
		 
		 
		 
		 <h2>맵 컬랙션</h2>
		 <%
		 	Map map = new HashMap();
		 	map.put("first", list.get(0));
		 	map.put("seoncd", list.get(1));
		 	map.put("third", list.get(2));
		 
		 %>
		 
		 <c:set var = "map" value="<%=map %>"/>
		 
		 <h4>키값을 알때 :</h4>
		 
		 	<ul>
		 		<li>아이디 : ${map['first'].id } 비밀번호 :${map["first"]['id'] } 이름 :${map.first['id'] }</li>
			 	<li>아이디 : ${map['second'].id } 비밀번호 :${map["second"]['id'] } 이름 :${map.second['id'] }</li>
				<li>아이디 : ${map['third'].id } 비밀번호 :${map["third"]['id'] } 이름 :${map.third['id'] }</li>
		 
		 	 
		 
			</ul>
		 
		 <h4>키값을 모를 때</h4>
		 <ul>
		 
		 	<c:forEach var="item" items="${map }" varStatus="loop" >
		 	
		 		<li> 키값 : ${item.key} ====> value : ${item.value}
		 	
		 	
		 	</c:forEach>
		 
		 
		 </ul>
		 
	</fieldset>

	<fieldset>
		<legend>게시판 글 읽어오기</legend>
		<table style="width: 70%; background-color: green; border-spacing: 1px">
			<tr style="background-color: white;">
				<th style="width: 10%">번호</th>
				<th>제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
			</tr>
			
			

			<c:forEach var="item" items="${my:getBBS('1','10',pageContext) }" varStatus="loop">
						<tr style = "background: white">
							<td>${item.no}</td>
							<td>${item.title}</td>
							<td>${item.id}</td>
							<td>${item.postDate}</td>
						</tr>		
			
			</c:forEach>
			

		</table>
	</fieldset>
	
	
	
	
	

	
	
</body>
</html>