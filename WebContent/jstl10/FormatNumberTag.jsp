<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatNumberTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그 : formatNumber태그</legend>
		<!-- 
			필수 속성 : value
			type -> optional 선택자는 다음과 같다.
			
					  number :숫자 형식으로 출력(기본값)
				      percent: %형식으로 출력
					  currency:통화 형식으로 출력
					  type이 percent일때 value속성에 지정한 값에 100을곱한거와 같다
					  
			currencySymbol -> 일때나 의미가 있다.
			groupingUsed ->  콤마 
		 -->
		<c:set var="money">10000</c:set>
		<h2>필수 속성만 사용 !</h2>
		<h4> EL로 출력</h4>
			${money }
		
		<h4> JSTL 국제화 태그로 출력</h4>
		<fmt:formatNumber value="${money }"></fmt:formatNumber>	
		
		
		<h4> JSTL 국제화 태그로 출력 천단위 콤마 생략</h4>
		<fmt:formatNumber value="${money }" groupingUsed="false"></fmt:formatNumber>	
		
		
		<h4>type="currency"일 때 : 현지 통화단위로 </h4>
		<fmt:formatNumber value = "${money }" type="currency"/>
		
		
				
		<h4>type="currency"일 때 : $$ 통화단위로 </h4>
		<fmt:formatNumber value = "${money }" type="currency" currencySymbol="$"/>
		
		<h4>type="percent"</h4>
		<!-- 1값이 100%임 -->
		<fmt:formatNumber value="${money }" type="percent"/>
		
		<c:set var="per" value="${5/100 }"/>
		
		<h4>type="percent"</h4>
		<!-- 1값이 100%임 -->
		<fmt:formatNumber value="${per }" type="percent"/>
		
		<h4>원하는 위치에 출력하고자 할때</h4>
		<fmt:formatNumber value="${per }" type="percent" var ="price"/>
		${price }
		
		<h4>원하는 위치에 출력하고자 할때</h4>
		<fmt:formatNumber value="${per }" type="percent" var ="price"/>
		${price }
		
		
	</fieldset>
</body>
</html>