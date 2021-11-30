<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	/*
		EL은 내장객체 (Scope 영역만큼) 내장 객체를 제공함
		
		읽어올때 : 스코프명.속성명 or 스코프명["속성명"]
		생략시 가장 작은영역부터 값을 찾아옴 ;
		
		
		일반적으로 request영역에 저장함 
	*/
	
	pageContext.setAttribute("scopeVar", "페이지 영역");
	request.setAttribute("scopeVar", "리퀘스트 영역");
	session.setAttribute("scopeVar", "세션 영역");
	application.setAttribute("scopeVar", "어플리케이션 영역");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectScope.jsp</title>
</head>
<body>

	<fieldset>
		<legend>EL에서 영역에서 가져가는 특성</legend>
		<%
			//JSTL set 사용시 Scope 기준으로 각영역에 저장됨
			
			//EL에서 호출시 가장작은 Scope부터 변수명을 파싱한다.
			
			
		%>
		
		<ul>
			<li> \${pageScope.scopeVar }: ${pageScope.scopeVar }</li>
			<li> \${requestScope['scopeVar'] }: ${requestScope['scopeVar'] }</li>
			<li> \${sessionScope['scopeVar'] }: ${sessionScope['scopeVar'] }</li>
			<li> \${applicationScope['scopeVar'] }: ${applicationScope['scopeVar'] }</li>
		
		</ul>
		
		<h2>영역 미지정시 출력</h2>
		
		<ul>
			<li> \${scopeVar }: ${scopeVar }</li>
			<li> \${scopeVar }: ${scopeVar }</li>
			<li> \${scopeVar }: ${scopeVar }</li>
			<li> \${scopeVar }: ${scopeVar }</li>
		
		</ul>
	</fieldset>

</body>
</html>

<jsp:forward page="InnerObjectScopeForwarded.jsp"></jsp:forward>]