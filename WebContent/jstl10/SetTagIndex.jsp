<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set 태그</legend>
		<!-- 
				var 속성 : 문자열만
				value 속성 : 값 ,  표현식 , EL식 모두 가능
				scope속성 : 문자열 4가지 영역
				
				
		 -->
		
		<h2> set 태그로 EL에서 사용할 변수 설정</h2>
		<ul>
			<li>value 속성에 직접 값 설정 : <c:set var="directvar" value="100"/> </li>
			<li>value속성에 EL 값 설정 : <c:set var="elvar" value ="${directvar }"/> </li>
			<li>value속성에 표현식  : <c:set var="expvar" value ="<%= new java.sql.Date(new java.util.Date().getTime()) %>"/> </li>
			<li>시작 태그와 종료 태그 사이에 값 설정[content양이많을때 씀]  : 
						<c:set var="betweenvar">
							<h3>시작 태그와 종료 태그 사이에 내용이 많을때 쓴다 </h3>
							그때 사이에 값을 사용해요~
						</c:set> 
			
			</li>
		
		</ul>
		
		
	
	</fieldset>
	
	
	
	<fieldset>
		<legend>set 태그로 설정한 값을 읽어오기 </legend>
		
		<h2>스크립팅 요소로 출력하기</h2>
		
		<ul>
			<li>directvar : <%=pageContext.getAttribute("directvar") %></li>
			<li>elvar : <%=pageContext.getAttribute("elvar") %></li>
			<li>expvar : <%=pageContext.getAttribute("expvar") %></li>
			<li>between : <%=pageContext.getAttribute("betweenvar") %></li>
		
		</ul>
		
		
		<h2>EL 요소로 출력하기</h2>
		
		<ul>
			<li>directvar : ${directvar } </li>
			<li>elvar : ${elvar }</li>
			<li>expvar : ${expvar }</li>
			<li>between :${between }</li>
		
		
		</ul>
	
	</fieldset>
	
	
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var = "pagevar" value ="페이지 영역"/>
		<c:set var = "requestvar" value ="리퀘스트 영역" scope="request"/>
		<c:set var = "sessionvar" value ="세션 영역" scope="session"/>
		<c:set var = "applicationvar" value ="어플리케이션 영역" scope="application"/>
	
	
		<h2>스크립팅 요소로 출력하기</h2>
		
		<ul>
			<li>page : <%=pageContext.getAttribute("pagevar") %></li>
			<li>request : <%=request.getAttribute("requestvar") %></li>
			<li>session : <%=session.getAttribute("sessionvar") %></li>
			<li>application : <%=application.getAttribute("applicationvar") %></li>
		
		</ul>
		
			
		<h2>스크립팅 요소로 출력하기</h2>
		
		<ul>
			<li>page : ${pagevar }</li>
			<li>request :${requestvar } </li>
			<li>session : ${sessionvar }</li>
			<li>application : ${applicationvar }</li>
		
		</ul>
	
	
	
	</fieldset>
	
	
	<fieldset>
		<legend>set 태그로  자바빈 객체 설정 </legend>
		<h2>기본 생성자로 생성 </h2>
		<c:set scope="request" var="defaultmember" value = "<%=new MemberDTO() %>"/>
	
		<h2>스크립팅 요소로 출력하기</h2>
		
		<ul>
		
			<li> 이름 : <%=((MemberDTO)request.getAttribute("defaultmember")).getName() %></li>
			<li> 아이디 : <%=((MemberDTO)request.getAttribute("defaultmember")).getId() %></li>
			<li> 비밀번호 : <%=((MemberDTO)request.getAttribute("defaultmember")).getPwd() %></li>
			
		
		</ul>
		
		
			
		<h2>EL로 출력</h2>
		
		<ul>
		
			<li> 이름 : ${defaultmember.name }</li>
			<li> 아이디 : ${defaultmember.id }</li>
			<li> 비밀번호 : ${defaultmember.pwd }</li>
			
		
		</ul>
		
		<h2>인자 생성자로 생성 </h2>
		<c:set scope="request" var="argsmember" value = '<%=new MemberDTO("kim","1234","다다다",null,null) %>'/>
		
		<h2>스크립팅 요소로 출력하기</h2>
		
		<ul>
		
			<li> 이름 : <%=((MemberDTO)request.getAttribute("argsmember")).getName() %></li>
			<li> 아이디 : <%=((MemberDTO)request.getAttribute("argsmember")).getId() %></li>
			<li> 비밀번호 : <%=((MemberDTO)request.getAttribute("argsmember")).getPwd() %></li>
			
		
		</ul>
		
		
			
		<h2>EL로 출력</h2>
		
		<ul>
		
			<li> 이름 : ${argsmember.name }</li>
			<li> 아이디 : ${argsmember.id }</li>
			<li> 비밀번호 : ${argsmember.pwd }</li>
			
		
		</ul>
		
		<!--
		set태그의 target속성과 property속성은
		자바빈 객체나
		컬렉션계열 객체 설정할때
		사용할 수 있는 속성.
		
		list는 index 처럼 쓰면 됨 (왜냐면 property가없거든 ) 
		타겟에 넣었을때 ->
		
		※target속성:반드시 EL식이나 표현식만 가능
		 property속성:값,표현식,EL식 모두 가능.
		  자바빈 인 경우-속성명(멤버변수명)
		 Map컬렉션 - 키값  	
		
		※scope속성은 var속성을 지정한 태그에서만   설정 가능
	 -->
		<!-- 
		
		******************************************************
		target과 property를 사용해서
	         자바빈이나 컬렉션에 값을 설정할때는
	         var속성을 지정하면 안된다. 즉, 스코프 지정이 불가능하다.
	    ******************************************************     
	 -->
		<!-- target속성과 property속성을 이용해서
	            자바빈 객체의 속성값 설정
	  -->

	<!--  값만 설정 가능하다. -->
	<c:set target="${defaultmember}" property="id" value="PARK"></c:set>
	<c:set target="${defaultmember}" property="pwd" value="1234"></c:set>
	<c:set target="${defaultmember}" property="name" value="박길동"></c:set>


		<h2>target 속성과 property 속성으로 값 설정 후 EL로 출력 </h2>
		
		<ul>
		
			<li> 이름 : ${defaultmember.name }</li>
			<li> 아이디 : ${defaultmember.id }</li>
			<li> 비밀번호 : ${defaultmember.pwd }</li>
			
		</ul>

	<!-- 리스트 계열 컬렉션 -->
	<%
	
		List list =new Vector();
		list.add(request.getAttribute("defaultmember"));
		list.add(request.getAttribute("argsmember"));
	%>	
		
		<c:set var="list" value="<%=list %>" scope="request"/>
		
		<h4>속성값 변경 전 출력</h4>
		<ul>
			
			<li> 이름 : ${list[0].name}</li>
			<li> 아이디 : ${list[0].id }</li>
			<li> 비번 : ${list[0].pwd }</li>
		</ul>
	
	
		<h4>target 및  property 속성으로 값 변경</h4>
		<c:set target="${list[0]}" property="name" value = '한소인' />
		<c:set target="${list[0]}" property="id" value = 'KOSMO' />
		<c:set target="${list[0]}" property="pwd" value = '1231234' />
	
		<ul>
			
			<li> 이름 : ${list[0].name}</li>
			<li> 아이디 : ${list[0].id }</li>
			<li> 비번 : ${list[0].pwd }</li>
		</ul>
		
		
		<%
			//map 계열 collections
			
			Map map = new HashMap();
			map.put("default",request.getAttribute("defaultmember"));
			map.put("args",request.getAttribute("argsmember"));
			
		
		%>
		
		
		<c:set var="map" value="<%=map %>" scope="request"/>
		
		<h4>target 및  property 속성으로 값 변경</h4>
		<ul>
		<%
		
			//default는 EL에서 예약어이므로 대괄호 접속해야함
		%>
			<li>이름 : ${map["default"].name}</li>
			<li> 아이디 : ${map["default"]['id'] }</li>
			<li> 비번 : ${map["default"].pwd }</li>
		
		</ul>
		
		<h4>target 및 property 속성으로 값 변경</h4>
		<c:set target="${map['default']}" property="name" value="하소인2"/>
		<c:set target="${map['default']}" property="id" value="KOSMO2"/>
		<c:set target="${map['default']}" property="pwd" value="2222333"/>
	
		<ul>
		<%
		
			//default는 EL에서 예약어이므로 대괄호 접속해야함
		%>
			<li>이름 : ${map["default"].name}</li>
			<li> 아이디 : ${map["default"]['id'] }</li>
			<li> 비번 : ${map["default"].pwd }</li>
		
		</ul>
		
		
		
	
	</fieldset>
	

		
	<jsp:forward page="SetTagResult.jsp">
		<jsp:param value="android" name="subject"/>
	</jsp:forward>
	
	
	
	
	

</body>
</html>