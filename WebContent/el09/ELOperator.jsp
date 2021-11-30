<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- tag lib -->
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELOperator.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 연산자들</legend>
		<!-- EL에서 null이 연산에 참여시 0으로처리된다. -->
	
		<!-- 역슬래쉬 사용시 문자열로 그냥 나온다. -->
		<ul>
		
			<li>\${null+10} : ${null+10}</li>
		
			<li>\${null*10} : ${null*10}</li>
			
			<!-- 
			param get계열만있음 builtIn object임
			
			-->
			<li>param 내장 객체  : ${param} </li>
			<!-- null 이 나오므로 10으로 출력됨 null(0)전환 -->
			<li>/${param.myparam+10} : ${param.myparam+10} </li>
			<li>/${param['myparam']+10} : ${param["myparam"]+10} </li>
			
			<% 
				//스크립틀릿 변수안에 선언한 변수
				String varInScriptlet = "스크립틀릿에서 선안한 변수";
			%>
			
			<!-- EL은 null일시 아무것도 출력안함 -->
			
			<!-- 
			
				스크립트 요소 변수 사용못함 -> 그래서 null이 되어 -> 값이 출력이안됨 
				변수를 사용하고 싶다면 JSTL과 같이 사용하라!
			 -->
			<li>/${varInScriptlet} : ${varInScriptlet} </li>
			
		</ul>
		
		<h2>JSTL로 EL에서 사용할 변수 선언</h2>
		
		
		<!-- 액션태그형태 -->
		
		<c:set var="varInScriptlet" value="<%=varInScriptlet %>"/>
		<ul>
			<li>/${varInScriptlet} : ${varInScriptlet} </li>
		</ul>
		<h2>EL변수에 값 할당 불가 :el-api.jar 변경됨</h2>
		<!-- 톰캣 8.0부터는 할강가능하나 비권장  -->
		<c:set var ="fnum" value = "9"/>
		<c:set var ="snum" value = "5"/>
		<% //default scope가 page이므로 pagescope가 생략된거임 %>
		\${fnum = 100} : ${fnum = 100}
		
		<h2>EL의 산술 연산자</h2>
		<ul>
		
			<li>\${fnum+ snum } : ${fnum+ snum } </li>
			<li>\${fnum- snum } : ${fnum- snum } </li>
			<li>\${fnum+ snum } : ${fnum+ snum } </li>
			<li>\${fnum* snum } : ${fnum* snum } </li>
			<li>\${fnum/ snum } : ${fnum/ snum } </li>
			<li>\${fnum div snum } : ${fnum div snum } </li>
			<li>\${fnum% snum } : ${fnum% snum } </li>
			<li>\${fnum mod 3 } : ${fnum mod 3 } </li>
			
			<li>\${'100' + snum } : ${'100' + snum } </li>
			
			<%
			// 숫자로 형변환이 안되므로 에러난다 
			//<!-- <li>\${'Hello' + "World!"  } : ${'Hello' + "World!" } </li> -->
			
			%>
		</ul>	
		
		<h2>EL의 비교 연산자</h2>		
		<c:set var ="fnum" value = "100"/>
		<c:set var ="snum" value = "9"/>
		<ul>
		<!-- 
			JSTL에서 선언한 변수 
			
			PageContext.setAttribute("fmun","100") 과 같으므로 문자열로 저장됨을 의미한다고 보면됨
			비교는 compareTo로 비교하게됨 
			
			따라서 snum의 첫문자가 더 크니까 이사단이난겅미
		 -->
			<li>\${fnum > snum } : ${fnum > snum }</li>
			<li>\${"100" > '9' } : ${'100' > '9' }</li>
			<li>\${"100" > '9' } : ${'100' > '9' }</li>
			
			<!-- 
			
				문자열 비교시 자바에서는 equals() 메소드로 비교하나 EL에서는 ==로 비교
			
			 -->		
		
			<li>\${'JSP' == "JSP" } :  ${'JSP' == "JSP" }</li>
			<li>\${'JSP' eq "JSP" } :  ${'JSP' eq "JSP" }</li>
			<li>\${'JSP' != "JSP" } :  ${'JSP' != "JSP" }</li>
			<li>\${'JSP' ne "JSP" } :  ${'JSP' ne "JSP" }</li>
			
		</ul>
		
		
		<h2>EL의 논리 연산자</h2>	
		
		<ul>
			<li>\${ 5 > 2 && 10 != 10 } :  ${ 5 > 2 && 10 != 10 } </li>
			<li>\${ 5 > 2 && 10 != 10 } :  ${ 5 > 2 && 10 != 10 } </li>
			<li>\${ 5 gt 2 and 10 ne 10 } :  ${ 5 gt 2 and 10 ne 10 } </li>
			<li>\${ 5 >= 2 || 10 < 10 } : ${ 5 >= 2 || 10 < 10 }</li>
			<li>\${ 5 ge 2 or 10 lt 10 } : ${ 5 ge 2 or 10 lt 10 }</li>
		
		</ul>
		
		<h2>EL의 유일한 제어 삼항 연산자</h2>	
		<ul>
			<li>\${10 gt 9 ? "10은 9보다 크다" : "10은 9보다 작다."  } : ${10 gt 9 ? "10은 9보다 크다" : "10은 9보다 작다."  } </li>
		
		
		</ul>
		<h2>EL의 EMPTY 연산자</h2>
		<%
			//null 빈값 size==0 length==0 이런 모든 경우에 true를 반환한다.
		%>
		<ul>
			
			<li>\${empty "" } : ${empty "" }</li>
			
			<% 
				String nullString =null;
				String emptyString ="";
				Integer[] zeroLength = new Integer[0];
				Collection zeroSize = new Vector();
			%>
		
		
			<c:set var="nullString" value="<%=nullString %>" />
			<c:set var="emptyString" value="<%=emptyString %>" />
			<c:set var="zeroLength" value="<%=zeroLength %>" />
			<c:set var="zeroSize" value="<%=zeroSize %>" />
			
			<li>\${empty nullString } : ${empty nullString }</li>
			<li>\${empty emptyString } : ${empty emptyString }</li>
			<li>\${empty zeroLength } : ${empty zeroLength ? '크기가 0 인배열이다' : '크기가 0인 배열이 아니다.' }</li>
			<li>\${empty zeroSize } : ${!empty zeroSize ? '객체가 저장되어있다.' : '객체가 저장되어있지 않다.'}</li>
			
		</ul>
			
			
	</fieldset>
	
	
</body>
</html>