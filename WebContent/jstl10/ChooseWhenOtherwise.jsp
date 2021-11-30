<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="/WEB-INF/tld/myTag.tld" prefix="my" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChooseWhenOtherwise.jsp</title>
</head>
<body>

	<fieldset>
		<legend>choose ~ when ~ otherwise 태그 </legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="99"/>
		<c:set var="strvar" value="자바"/>
		<h2>if 태그로 짝/홀수 판단</h2>
		<c:if test="${numvar % 2 == 0}" var="result">
			${numvar }는 짝수  <br/>
		</c:if>
		
		<c:if test="${!result}" >
			${numvar }는 홀수 <br/>
		</c:if>
		
		<h2>Choose ~ when ~ otherwise 태그</h2>
		<!-- choose 바로 안쪽에는 주석이 불가능하다. -->
		<c:choose>
			<c:when test="${numvar % 2 == 0  }">
				<!-- 주석가능 -->
				
				${numvar }는 짝수 <br/>
			
			</c:when>
			<c:otherwise>
				<!-- 주석가능 -->
				${numvar }는 홀수 <br/>
			
			</c:otherwise>

		</c:choose>
		
		
		
		<h2>Choose ~ when ~ otherwise 태그로 문자열 비교</h2>
		<c:choose>
			<c:when test="${strvar =='JAVA' }">
			${strvar }는 'JAVA' 다 <br/>
			</c:when>
			<c:when test="${strvar =='java' }">
			${strvar }는 'JAVA' 다 <br/>
			</c:when>
			<c:when test="${strvar =='JAvA' }">
			${strvar }는 'JAVA' 다 <br/>
			</c:when>
			<c:otherwise>
			${strvar }는 '자바' 다 <br/>
			</c:otherwise>
		</c:choose>
		<fieldset>
			<legend>점수 확인</legend>
			<form>
			국어 <input type="text" name="kor"/>
			영어 <input type="text" name="eng"/>
			수학 <input type="text" name="math"/>
			<input type="submit" value="확인"/>
		</form>
		<!-- 국영수 점수를  받아서 평균이
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL만을 사용하여라
		   -->
		
		<c:if test="${!(empty param.kor) and !(empty param.eng) and !(empty param.math) }">
		
			<c:if test="${my:isNumber(param.kor) and my:isNumber(param.eng) and my:isNumber(param.math)}" var = "res">

			<c:set var="total" value="${(param.kor+param.eng+param.eng)/3 }"/>
						총점은 ${total } 입니다!<br/>
				<c:choose>
					<c:when test="${total >= 90 }">
					A학점 <br/>
					</c:when>
					<c:when test="${total >= 80 }">
					B학점 <br/>
					</c:when>
					<c:when test="${total >= 70 }">
					C학점 <br/>
					</c:when>
					<c:when test="${total >= 60 }">
					A학점 <br/>
					</c:when>
					<c:otherwise>
					F학점 <br/>
					</c:otherwise>
				</c:choose>
				
			
			
			</c:if>
			
			
			<c:if test="${!res }">
			<h3 style="color : red;"> 숫자만 입력해주세요!</h3>
			</c:if>
			
					
		</c:if>


	</fieldset>
	<fieldset>
			<legend>로그인</legend>
			<form>
				아이디 <input type="text" name="user"/>
				비밀번호 <input type="password" name="pass"/>
				<input type="submit" value="로그인"/>
			</form>
			 <!--
	           회원인 경우 "?님 반갑습니다"
	           아닌 경우 "로그인후 이용하세요"출력.
	           단,자신만의 태그라이브러리를 만들어
	           EL식으로 호출하여라 그리고
	           실제 멤버 테이블을 연동(BBS게시판에서 사용했던 회원테이블 연동)하여라.
	        -->
	        <c:if test="${!(empty param.user) && !(empty param.pass) }">
	       	 	${my:isMember(param.user,param.pass,pageContext) }
	        </c:if>
	</fieldset>


</body>
</html>