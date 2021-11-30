<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.taglibs.standard.tag.el.fmt.FormatDateTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
   
 <!-- fn 사용법 : EL에서 사용, 태그형태가 아님!! -->
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunctionJSTL.jsp</title>
</head>
<body>
	<fieldset>
		<legend>jstl의 함수 라이브러리</legend>
		<!-- 
			JSTL에서 제공하는 함수들은 EL에서 호출해야한다.
				호출 방법  : \${접두어:함수명([매개변수들])}
		
		 -->
		 <!-- 데이터 준비 -->
		 <%
		 	String[] mountains={"한라산","성인봉","태백산","덕유산"};
		 	
		 %>
		 
		<fmt:formatDate value="<%=new Date() %>" var = "today" pattern="yyyy년 M일 dd일"/>
		<c:set var="todayString">오늘은 ${today }입니다.</c:set>
		<c:set var="interString">Politics,Economics,Entertainments,Sports</c:set>
		<c:set var="array" value="<%=mountains %>"/>	 
		<c:set var="collection" value="<%=new HashMap()%>"/>
		<c:set target="${collection }" property ="user" value="KOSMO"/>
		<c:set target="${collection }" property ="pass" value="11223344"/>

		<h2>int length(Object)  </h2>
		<!-- 
			문자열의 길이를 반환
			배열인 경우에는 배열의 크기 / 메모리 갯수 
			컬렉션인 경우는 컬렉션에 저장된 객체의 수를 반환
		 -->
		
		<ul>
			<li>문자열 : ${todayString }
			<li>문자열의 길이: ${fn:length(todayString) }</li>
			<li>배열의 크기 : ${fn:length(array)}</li>
			<li>컬랙션의 크기 : ${fn:length(collection)}</li>
			<li>컬랙션의 크기 : ${collection.size()}</li>
			
		</ul>
		
		<h5>컬렉션에 저장된 객체 여부 판단: JSTL함수 이용</h5>
		<c:if test="${fn:length(collection) !=0}" var="result">
			<c:forEach var="i" items="${collection}">
				${i.key} - ${i.value} <br>
			</c:forEach>
			<c:if test="${!result }">
				등록된 글이 없어요 !
			</c:if>
				
		</c:if>
		
		
		<h5>컬렉션에 저장된 객체 여부 판단: JSTL함수 이용</h5>
		<c:if test="${collection.size() != 0}" var="result">
			<c:forEach var="i" items="${collection}">
				${i.key} - ${i.value} <br>
			</c:forEach>
			<c:if test="${!result }">
				등록된 글이 없어요 !
			</c:if>
				
		</c:if>
		
		<h2>String substring(문자열,시작인덱스,끝인덱스)</h2>
		<!-- 
			문자열에서 시작인덱스부터 끝인덱스 -1까지 추출
			끝인덱스가 -1인 경우 시작 인덱스부터 문자열 끝까지 추출 
		
		 -->
		
		<ul>
			<li>Today 추출 : ${fn:substring(todayString,0,2)}</li>
			<li>날짜부분부터 끝까지 추출 : ${fn:substring(todayString,3,fn:length(todayString)) }</li>
		
		</ul>
		
		<h2>String subStringAfter(문자열,str) -> str 이후의 문자열을 반환</h2>
		"오늘" 이후의 문자열 추출 : ${fn:substringAfter(todayString,"은") }
		
		
		<h2>String subStringBefore(문자열,str) -> str 이전의 문자열을 반환</h2>
		"오늘" 이전의 문자열 추출 : ${fn:substringBefore(todayString,"은") }
		
		<h2>String replcae(문자열,src,dest)</h2>
		${fn:replace(todayString,"오늘","Tomorrow") }
		
		
		<!-- solution1 -->
		<h2>String replcae(문자열,src,dest) 바뀌이이임</h2>
		<h1>${fn:replace(fn:replace(todayString,"오늘","Tomorrow"),"03","04")}</h1>
		
		
		[트림 적용전]  : X\${"    J     S    T    L "} - X${"    J     S    T    L "} <br/>
		[트림 적용후]  : X${fn:trim("    J     S    T    L ")} <br/>
		
		
		<h2>boolean startsWith (문자열,str) : 문자열이 str로 시작하면 true,false</h2>
		
		'오'로 시작하는 문자입니까 ? ${fn:startsWith(todayString,"오") }<br/>
		'입니다.'로 끝나는 문자입니까 ? ${fn:endsWith(todayString,"입니다.") }<br/>
		
		<h2>String[] split(문자열,delim) : 문자열에서 delim(구분자)로 문자열 분리</h2>
		스플릿된 값 (주소) : ${fn:split(interString,",")}<br/>
		값은 다음과 같습니다
		<c:forEach var="atom" items='${fn:split(interString,",")}'>
			${atom}<br/>
		</c:forEach>
		
		
		<h2>String escapeXml(문자열): HTML태그를 그대로 출력하고자 할 때</h2>
		함수 라이브러리 사용 : ${fn:escapeXml("<h3>함수 라이브러리 </h3>") }<br/>
		코어 라이브러리 사용 :<c:out value="<h3>함수 라이브러리 </h3>" escapeXml="true"></c:out>
		
		<h2>String join (배열,str): 모든 배열 요소를 str로 연결해서 반환</h2>
		${fn:join(array,"▲") }
		
		<h2>int indexOf(str1,str2) : str1에서 str2 문자열의 시작 인덱스</h2>
		${fn:indexOf(todayString,"row") } <br/>
		${fn:indexOf(todayString,"2021") }
		
		<h2>boolean contains(str1,str2) : str1에 str2가 포함되었으면 true, false 반환</h2>
		${fn:contains(todayString,"오늘은") }
		
		<h2>boolean containsIgnore(str1,str2) : str1에 str2가 포함되었으면 true, false 반환 대소문자 반환 X</h2>
		${fn:containsIgnoreCase(todayString,"오늘은") }
		
		<h2> toUpperCase toLowerCase</h2>
		${fn:toLowerCase(interString) } <br/>
		${fn:toUpperCase(interString) } <br/>
	</fieldset>
</body>
</html>