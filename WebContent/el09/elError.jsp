<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elError.jsp</title>
</head>
<body>
	<fieldset>
		<legend>el에서 에러가 나거나 혹은 에러는 안나지만 값이 출력 안되는 Case</legend>
			<h2>+ 를 숫자형식이 아닌 문자열에 적용시 </h2>
			<ul>
			
				<li>\${"100"+100}[200] : ${"100"+100}</li>
				<li>\${"백"+100}[500ERROR] : \${"백"+100}</li>
				<li>\${"hello"+"hi"}[500ERROR] : \${"hello"+"hi"}</li>
			</ul>
			
			<h2>.index 형식으로 배열이나 리스트계열 컬렉션의 요소에 접근식(에러)</h2>
			
			<%
				String[] mountains = {"설악산","소백산","비술산","덕유산"};
				out.println(mountains[0]+"<br/>");
				List collection =Arrays.asList(mountains);
				out.println(collection.get(0)+"<br/>");
				
			%>
			
			
			<c:set value="<%=mountains %>" var="mountains"/>
			<c:set value="<%=collection %>" var="collection"/>
			<ul>
				<li>\${mountains.0 }[500ERROR][대괄호로 접근해야한다.] :  \${mountains.0}[500ERROR] </li>
			
				<li>\${mountains[0] }[200] :  ${mountains[0] }[500ERROR] </li>
				
				<li>\${collection.0 }[500ERROR][대괄호로 접근해야한다.] :  \${collection.0 }[500ERROR] </li>
			
				<li>\${collection[0] }[200] :  ${collection[0] }[500ERROR] </li>
			
			
			</ul>
			
			
			<h2>자바 OutOfbound Error  --> EL 그냥 출력안함</h2>
				<ul>
					<li>\${mountains[4] }[출력안됨] :  ${mountains[0] }[500ERROR] </li>
					<li>\${collection[4] }[출력안됨] :  ${collection[0] }[500ERROR] </li>
				</ul>
			
			<h2>없는 속성 or getter가 없는 경우 ---> 500 에러 (자바 빈에서 가져오는 경우)</h2>
				<c:set var="member" value='<%=new MemberDTO("Kim","1234","퀼길동",null,null) %>'/>
				<ul>
					<li>없는 속성 접근 [500][PropertyNotFoundException] -> \${member.addr}</li>
					<li>getter가 없는 속성 접근 [500][PropertyNotFoundException] -> ${member.id}</li>
					<li>EL변수명이 틀린경우[출력만 안됨]****** : ${mem.id}</li>
					
				</ul>
			<h2>EL 내장객체의 없는 속성으로 접근시 </h2>
			
			<!-- 
				사용자가 정의한 속성에 접근하는 경우 -> 속성이나 키값이 미존재시 null임 (에러는 안나고 출력이안됨을 의미)
				내장객체에서 없는것에 접근하는경우 -> 에러
			 -->
			
			\${null } : $:{null}
			<%
				request.setAttribute("myrequests","리퀘스트 영역");
				Map map = new HashMap();
				map.put("myMap","맵 컬랙션");
			
			%>
			
			
			<c:set var="map" value ="<%=map %>"/>
			
			<ul>
				<li>\${myrequests}: ${myrequests}</li>
				<li>\${yourrequests}[null 이므로 출력만 안됨]: ${yourrequests}</li>
				<li>\${myMap} : ${myMap}</li> 
				<li>\${yourMap} : ${yourMap}</li> 
				<li>\${param.myparam}[null 이므로 출력만 안됨] : ${param.myparam}</li> 
				
				<li>\${pageContext.noproperty}[null 이므로 출력만 안됨] : \${pageContext.noproperty}</li> 
				
				
				
			</ul>
			
			
			<h2>숫자를 0으로 나누면 INF 나옴</h2>
			\${100/0 } : ${100/0 }
			
			<h2>임의의 변수로 .을 통할떄</h2>
			
	</fieldset>

</body>
</html>