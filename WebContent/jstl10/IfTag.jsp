<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>IF tag</legend>
		<c:set value="99" var="numvar"/>
		<c:set value="JSTL" var="strvar"/>
		
		<!--
		
		 종료태그와 시작태그 분리해서 쓰자  else문은 없지만 돌려쓸수있음
		
		
		
		-->
		
		<!-- test에서 진행한 결과 값이 result에 저장됨 -->
		<!-- 이 var 변수를 통해 else처럼 사용이가능함 -->
		<c:if test="${numvar mod 2 == 0}" var="result" >
		<!-- 참일때 이 안쪽이 출력된다. -->
			${numvar }는 짝수 <br/>
		</c:if>
		
		<c:if test="${!result }">
			${numvar }는 홀수 <br/>
		
		</c:if>
		
		\${result}:${result}
		
		<h2>그냥 쉬운거면 삼항써  빡치게 코드 늘리지말고~</h2>
		${numvar }는  ${numvar mod 2 == 0 ?  "짝수 <br/>" : "홀수 <br/>" }
		
		
		<h2>문자열 비교</h2>
		<c:if test="${strvar == '제이에스티엘'}" var="result">
			${strvar }는 제이에스티엘 이다 !
		</c:if>
		
		<c:if test="${strvar == 'jstl'}" var="result">
			${strvar }는 jstl 이다 !
		</c:if>
		
		<c:if test="${strvar == 'JSTL'}" var="result">
			${strvar }는 JSTL 이다 ! <br/>
		</c:if>
		
		<c:if test="${                        true}" var="result">
			항상 출력되는 HTML <br/>
		</c:if>
		
		<c:if test="${                        false}" var="result">
			항상 출력 안되는 HTML <br/>
		</c:if>
		
		<!-- 
		
			test식에는 EL식이 들어가긴하지만, 문자열이 그냥들어가면 무조건 false 반환나온다
			단, TRUE,FALSE 값은 무조건 논리식으로 처리됨 대소문자안가림
			단, test ""에서는  \${}밖에 무조건 공백이있으면안됨 
		 -->
		 
		 <h2>test 속성에 일반 값으로 조건 설정</h2>
		 <c:if test="100" var="result">
		 </c:if>
		\${result}:${result} <br/>
		
		 <c:if test="tRUe" var="result">
		 </c:if>
		\${result}:${result} <br/>
		
		 <c:if test="1000 > 20" var="result">
		 </c:if>
		\${result}:${result} <br/>
		
		<h2>조건이 참이더라도 \${} 바깥에 공백이있다면 무조건 거짓이된다 </h2>
		 <c:if test="${ 1000 > 20}" var="result">
		 1000 > 10 은 참이다 <br/>
		 </c:if>
		\${result}:${result} <br/>
		
		
		
		<h2>IF태그 연습</h2>
		
		<c:if test="${!(empty param.user) and !(empty param.pass) }">
		
			<c:if test="${(param.user == 'KIM') and (param.pass == '1234') }" var="res">
			${param.user }님 즐감하세요 <br/>
			</c:if>
			<!-- user 와 id 가 존재할때 값이 틀리면 false 가되야함  -->
			<c:if test="${!res and !(param.user=='' or param.pass =='')  }">
			아이디와 비밀번호가 일치하지 않습니다. <br/>
			</c:if>
		
		</c:if>
		
	</fieldset>
</body>
</html>