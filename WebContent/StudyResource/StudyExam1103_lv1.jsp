<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:set var="types" value="radio"/>
	<fieldset style="width: 1000px;">
		<legend>선택형 질의 응답 문제 [개념] lv1</legend>
		<form action="StudyExam1103_lv1_answer.jsp" method="get">
			JSTL prefix는 각 라이브러리를 Core - c, funtions - fn, format - fmt로 정의합니다. 
			<br/>
			<h3>Q1.다음에  해당하는 태그에 관해  옳은 것을 선택하세요</h3>

			<h4>새로운 리쿼스트를 생성하여 다른페이지 넘어가는 방식의 태그</h4>
			<div style="display: flex; width: 800px; justify-content: space-between;">
			
				<div><input type="${types }" name="pro1" value="11"/>c:import</div>
				<div><input type="${types }" name="pro1" value="12"/>f:foreach</div>
				<div><input type="${types }" name="pro1" value="13"/>f:fortokens</div>
				<div><input type="${types }" name="pro1" value="14"/>c:redirect</div>
				<div><input type="${types }" name="pro1" value="15"/>c:remove</div>
				<div><input type="${types }" name="pro1" value="16"/>c:url</div>
			
			</div>
			
			<h3>Q2.다음에  해당하는 태그에 관해  옳은 것을 선택하세요</h3>
			<h4>함수 라이브러리에서 HTML태그를 그대로 출력하고자 할때 쓰는 메서드는 ?  </h4>
			<div style="display: flex; width: 700px; justify-content: space-between;">
			
				<div><input type="${types }" name="pro2" value="21"/>indexOf</div>
				<div><input type="${types }" name="pro2" value="22"/>containsIgnore</div>
				<div><input type="${types }" name="pro2" value="23"/>escapeXml</div>
				<div><input type="${types }" name="pro2" value="24"/>toUpperCase</div>
				<div><input type="${types }" name="pro2" value="25"/>outToHTML</div>
				<div><input type="${types }" name="pro2" value="26"/>toLowerCase</div>
			
			</div>
			
			<h3>Q3.다음에  해당하는 태그에 관해  옳은 것을 선택하세요</h3>
			<h4>포멧라이브러리에서 "XXXX년 XX월 XX일"로 지정하려할 때, 사용해야할 속성은</h4>
			<div style="display: flex; width: 700px; justify-content: space-between;">
				<div><input type="${types }" name="pro3" value="31"/>var</div>
				<div><input type="${types }" name="pro3" value="32"/>type</div>
				<div><input type="${types }" name="pro3" value="33"/>itmes</div>
				<div><input type="${types }" name="pro3" value="34"/>default</div>
				<div><input type="${types }" name="pro3" value="35"/>escapeXML</div>
				<div><input type="${types }" name="pro3" value="36"/>pattern</div>	
			</div>
				
			<h3>Q4.다음에  해당하는 태그에 관해  옳은 것을 선택하세요</h3>
			<h4>코어라이브러리의 catch로 오류 해결할 수 있는 문법은 어느 문법인가 ?  </h4>
			<div style="display: flex; width: 700px; justify-content: space-between;">
			
				<div><input type="${types }" name="pro4" value="41"/>EL</div>
				<div><input type="${types }" name="pro4" value="42"/>Javascript</div>
				<div><input type="${types }" name="pro4" value="43"/>JSTL</div>
				<div><input type="${types }" name="pro4" value="44"/>JSP</div>
			
			</div>
			
			
			<h3>Q5.다음에  관하여 옳은 것을 선택하세요</h3>
			<h4> JDNI를 사용하기 위한 DBCP설정을 전역적으로 하기 위해 서버에서 수정되어야하는 파일 두가지가 옳게 묶인 것은 ?  (확장자 생략) </h4>
			<div style="display: flex; width: 900px; justify-content: space-between;">
				<div><input type="${types }" name="pro5" value="51"/>catalina - web</div>
				<div><input type="${types }" name="pro5" value="52"/>server - context</div>
				<div><input type="${types }" name="pro5" value="53"/>dbcp - web</div>
				<div><input type="${types }" name="pro5" value="54"/>tomcat - context</div>
				<div><input type="${types }" name="pro5" value="55"/>catalina- tomcat-users</div>
				<div><input type="${types }" name="pro5" value="56"/>manifest - context</div>
			</div>
			<hr/>
			
			<br/>
			
			<input type="submit" value="제출하기">
		</form>
	</fieldset>




</body>
</html>