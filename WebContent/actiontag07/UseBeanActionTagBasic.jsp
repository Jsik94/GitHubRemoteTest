<%@page import="model.MyDTO"%>
<%@page import="model.MemberDTOB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션 태그 </legend>
		
		<%
			//속성
			//id 값에 지정된게 instance 변수가 된다. 
			//class -> 클래스명 명시, 이때 패키지명까지 포함해야됨
			//scope [page, request, session, application]
					
					// page -> 지역변수만 
					// request -> 지역변수와 request 영역에 둘.다. 저장됨 
					// 
			//type -> type은 리퀘스트영역에 이미 있어야 진행이 가능함 
			
			
			
					
		%>
		<jsp:useBean id="member" class="model.MemberDTO" scope="request"></jsp:useBean>
		
		
		<%
			//MemberDTO member ; // useBean에 의한 중복지역변수
			
			//request scope 자동화 
			/* member = (MyDTO)request.getAttribute("member");
			if(member ==null){
				member = new MyDTO();
				request.setAttribute("member", member);
			}*/
			
			
		%>
		
		
		<%
			//bean 을 활용하기 위해 properties를 조절할 수 있는 Property 태그를 제공한다.
			
			// property ->필드명
			// name
			//setter 호출과 같은 결과임 
					
		%>
		
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="name" name="member" value="김길동"/>

		<h2>속성 설정 후 출력</h2>
	
				
		<%= member.toString() %>
		
		<h2>getter 로 출력</h2>
		<ul>
			<li>아이디 : <jsp:getProperty property="id" name="member"/> </li>
			<li>비번  : <jsp:getProperty property="pwd" name="member"/></li>
			<li>이름 :   <jsp:getProperty property="name" name="member"/> </li>
			<li>나이 :  <jsp:getProperty property="age" name="member"/></li>
		
		
		</ul>
		
		<jsp:forward page="UseBeanActionTagForward.jsp"></jsp:forward>
		
	</fieldset>


</body>
</html>