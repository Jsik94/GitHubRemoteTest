<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그 :formatDate 태그</legend>
		<!-- 삽입시 datetype으로 넣어줘야함 안그러면 String으로 인식함 -->
		
		<c:set value="<%=new Date() %>" var="today"/>
		<!-- 
			type 속성  : date(날짜) time(시간)
			dateStyle 기본값 : default 
		 -->
		
		<h2>필수 속성만 사용</h2>
		<h4>EL로 출력 </h4>
		${today}
		<h4>JSTL의 formatDate 태그로 출력</h4>
		<fmt:formatDate value="${today }"/>
		
		
		<h4>JSTL의 formatDate 태그로 출력 디폴트 명시 지정</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="default" />
		
		
		<h4>JSTL의 formatDate 태그로 출력 스타일 FULL</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="full" />
		
		<h4>JSTL의 formatDate 태그로 출력 스타일 short</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="short" />
		
		<h4>JSTL의 formatDate 태그로 출력 스타일 LONG</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="long" />
		
		
		
		<h4>JSTL의 formatDate 태그로 출력 타입 time</h4>
		<fmt:formatDate value="${today }" type="time" dateStyle="full" />
				
		<h4>JSTL의 formatDate 태그로 출력 타입 time 스타일 short</h4>
		<fmt:formatDate value="${today }" type="time" dateStyle="short" />
	
		<h4>JSTL의 formatDate 태그로 출력 타입 both</h4>
		<fmt:formatDate value="${today }" type="both" dateStyle="full" />
		
				
		<h4>JSTL의 formatDate 태그로 출력 타입 both + short</h4>
		<fmt:formatDate value="${today }" type="both" dateStyle="short" />
		
				
		<h4>JSTL의 formatDate 태그로 Pattern 활용</h4>
		<fmt:formatDate value="${today }" pattern ="yyyy년MM월dd일 HH시mm분ss초"/>
		
		<h4>JSTL의 formatDate 태그로 Pattern 활용</h4>
		<fmt:formatDate value="${today }" pattern ="a HH시mm분ss초"/>
		
		
		<h4>JSTL의 formatDate 태그로 Pattern 활용</h4>
		<fmt:formatDate value="${today }" pattern ="a hh시mm분ss초" var ="times"/>
		현재 시간 : ${times}
		
		
		
	</fieldset>
</body>
</html>