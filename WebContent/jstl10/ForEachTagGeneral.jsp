<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="/WEB-INF/tld/myTag.tld" prefix="my" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
			function showSelect(e,color){

				if(color ==1){

	                e.style.backgroundColor="red";
				}else{
					e.style.backgroundColor = "blue";
				}
				
			}

			
			function showOff(e){
				e.style.backgroundColor ="white";
			}
			
			
		
		</script>
		

</head>
<body>
	<fieldset>
		<legend>일반 for문 상태에 forEach 태그</legend>
		
		<!-- 
		필수 속성 : begin end var 속성 step은 생략가능 step에는 0보다 큰수만가능 
		-->
		<h2>자바코드로 hn태그 출력</h2>
		<% 
			for(int i = 1 ; i <= 6 ; i++){
				%>
				<h<%=i %>>제목 <%=i %></h<%=i %>>
				
				<%
			}
		%>
		
		
		<h2>EL 과 JSTL로 Hn태그 출력</h2>
		
		<c:forEach begin ="1" end = "6" var ="i">
			<h${i}>제목${i}</h>
		
		</c:forEach>
	
	
		<h2>varStatus 속성 </h2>
		
		<!-- varStatus 속성에 쏨 -->
		
		<!-- 
		varStatus에서  index는 일반 for에서는 index가 없으므로  해당 값을 반환함ㅁ 
		확장for문에서는 index 값
		-->
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<h4>${loop.count}번째 반복</h4>
			<ul>
				<li>${loop.index}</li>
				<li>${loop.first}</li>
				<li>${loop.last}</li>
				<li>${loop.current}</li>
			</ul>
		</c:forEach>
		
		
		<h2>varStatus 속성을 이용한 스타일 변경</h2>
		<c:forEach begin ="1" end = "6" var ="i" varStatus="loop">
			<c:choose>

				<c:when test="${loop.first}">
					<h${i} style="color : blue;">
				</c:when>
				<c:when test="${loop.last}">
					<h${i} style="color : cyan;">
				</c:when>
				<c:when test="${loop.index mod 2 ==0 }">
					<h${i} style="color : red;">
				</c:when>
				<c:otherwise>
					<h${i} style="color : green;">
				</c:otherwise>
			</c:choose>
			
			제목 ${i} </h>
		</c:forEach>
		
		
		<c:forEach begin ="1" end="100" var = "i">
			<c:if test="${i%2 != 0 }">
				<c:set var = "sum" value="${sum+i }"/>
			
			</c:if>
		
		</c:forEach>
		
		
		\${sum } :${sum }
		
		<h2>중첩 for문</h2>
		
		<c:forEach begin = "1" end ="5" var = "i">
			<c:forEach begin = "1" end ="5" var = "j">
		
				<c:choose>
					<c:when test="${i==j }">
						1&nbsp;
					</c:when>
					<c:otherwise>
						0&nbsp;
					</c:otherwise>
				</c:choose>
		
			</c:forEach>
			<br/>
		</c:forEach>
		
		
		<h2>구구단 출력</h2>
		<table >
		<c:forEach begin = "2" end ="9" var = "i" varStatus="loop">
			<tr onmouseover="showSelect(this,${loop.count%2})" onmouseout="showOff(this)">
			<c:forEach begin = "1" end ="9" var = "j">
			
				<c:if test="${loop.count % 2 ==0 }" var ="res">
				
				<td style="border: 1px red solid;" >
				
				</c:if>
				
				<c:if test="${!res}">
				
				<td style="border: 1px yellow solid;"  >
				
				</c:if>
				
				
				
				
				 ${i} * ${j} = ${i*j} &nbsp;&nbsp; 
				<td/>
			</c:forEach>
			<tr/>
		</c:forEach>
		
		</table>
		
		
		
	</fieldset>
</body>
</html>