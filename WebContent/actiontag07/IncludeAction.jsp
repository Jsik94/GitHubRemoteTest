<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!--
※include지시어의 file속성과
 include액션태그의 page속성에
 절대경로로 페이지 포함시에는 Context 루트 제외한
 경로.
 단,server.xml의 Context엘리먼트의 path속성을 ""으로
 설정시에는 request.getContextPath()로 해도 상관없다.
 
 *******
※include지시어의 file속성에는 표현식 사용불가
 include액션태그의 page속성에는 표현식 사용가능
  단,표현식을 사용할때는 page속성에 표현식만 와야한다.'
  
 자바코드로 변해야하기때문에 표현식만 와야함 뒤에 문자열 추가 못함 
 ********
  
[include지시어와 include 액션태그의 차이점]

include 지시어 ->
include 액션태그 -> 모듈화시 쓴다 

  include 지시어를 사용한 페이지 include(포함)]
    -소스 그대로 해당 위치에 포함됨
    -include지시어를 통해 포함된 페이지는 현재 페이지와 같은
          페이지를 의미
 include 액션태그를 사용한 페이지 include(포함)]
    -JSP컨테이너에 의해 실행된 결과가  해당 위치에 포함됨
    -서로 다른 페이지를 의미
    -단, request영역 공유
    
  변수처럼 사용가능한 장점이 제일 크다.
-->

<%
	String directivePath = "DirectivePage.jsp";
	String actionPath = "ActionPage.jsp";

	pageContext.setAttribute("pageVar", "페이지 영역입니다.");
	request.setAttribute("requestVar", "리퀘스트 영역입니다.");
	

%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>include 지시어와 &lt;jsp:include &gt; 액션태그</legend>
			<h2>지시어로 삽입하기</h2>	
			<%--@ include file = "<%--= directivePAth " --%>
			
			<%@ include file="DirectivePage.jsp" %>
			
			<h2> &lt;jsp:include &gt; 액션태그로 삽입하기 </h2>
			<jsp:include page="<%=actionPath %>"/>
			
			<h2> 지시어로 삽입된 페이지  </h2>
			<ul>
				<li>directiveString : <%=directiveString %></li>
			</ul>
			
			<h2> 액션 태그로 선언한 변수 사용  </h2>
			<ul>
			<!-- 
				액션 태그로 삽입된 데이터는 사용불가 
			 -->
				<li>directiveString : <%=directiveString %></li>
			</ul>
	</fieldset>




</body>
</html>