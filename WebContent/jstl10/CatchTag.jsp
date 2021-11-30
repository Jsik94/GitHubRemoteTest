<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch 태그 </legend>
		<%--
			catch 태그!
			- EL에서 오류날때 에러처리시 주로 사용
			- 에러내용을 원하는 위치에서 출력하고자 할때 사용
			- JSTL 문법 오류는 catch가 안된다.
		  --%>
	
		<c:set var ="fnum" value ="100"/>
		<c:set var ="snum" value="0"/>
		
		<h2>에러가 안나는 경우 : 에러 내용 저장 안됨</h2>
		
		<c:catch var="error">
			\${fnum/snum }:${fnum/snum } <br/>
		</c:catch>
		
		
				
		<h2>에러가 나는 경우 : 에러 내용 저장 됨</h2>
		
		<c:catch var="error">
			\${"백"+100 } : ${"백"+100}<br/>
		</c:catch>
		\${error } : ${error}<br/>
	
	
	
		<h2>JSTL 문법 오류는 catch가 안됨</h2>
		500에러 나옴
		
		<%--
		<c:choose>
			<!--  -->
			<c:when test="false">
			dd
			</c:when>
		</c:choose>
		 --%>
	</fieldset>

</body>
</html>