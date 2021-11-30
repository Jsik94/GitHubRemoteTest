<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectETC.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장 객체들</legend>
		<h2>1. EL의 내장객체 : pageContext</h2>
		<%
			//EL에서는 JSP 보다 활용도가 높다 . 단, EL의 특성때문에 get 계열만있음
			//단, 자바빈 규칙으로 접근 가능한 메소드임 (자바빈 -> getset 기본생성자있는거)
			
			/*
				각 객체이름만으로 접근한다고 보면됨
				ex) java -> getRequest 
				EL - > pageContext.Request
				
				EL에는 pageContext 밖에없기때문에 얘로 모두 땡겨오면됨
			*/
			
		%>
		
		
		<h4>자바코드로 컨텍스트 루트(/JSPProj) 얻기</h4>
		<ul>
			<li>방법1: request 내장객체 - <%=request.getContextPath() %></li>

			<li>방법2: pageContext 내장객체 - <%= ((HttpServletRequest)pageContext.getRequest()).getContextPath()%></li>
			
			
			
			
		</ul>
		<h4>EL로 컨텍스트 루트(/JSPProj) - 얘는  typecating이 필요없음</h4>
		<!-- 자바빈의 규칙을 지키고 있는 getter setter 이므로 EL에서는 자동으로 매핑됨 -->
		\${pageContext.request.contextPath } :${pageContext.request.contextPath }
		
		<h4>자바코드로 세션의 유효 시간얻기</h4>
		<%= session.getMaxInactiveInterval() %> <br/>
		<%= request.getSession().getMaxInactiveInterval() %> <br/>
		<%= pageContext.getSession().getMaxInactiveInterval() %> <br/>
		<%= ((HttpServletRequest)pageContext.getRequest()).getSession().getMaxInactiveInterval()%>
		
		<h4>EL로 세션의 유효시간 얻기</h4>
		\${pageContext.session.maxInactiveInterval} : ${pageContext.session.maxInactiveInterval} <br/>
		\${pageContext.request.session.maxInactiveInterval} : ${pageContext.request.session.maxInactiveInterval}
		
		
		<h4>2. EL의 Header (요청해더만 얻옴 !!!!!!)</h4>
		<h5>자바코드로 요청헤더값 얻기</h5>
			<%= request.getHeader("user-agent") %>
		<h5>자바코드로 요청헤더값 얻기</h5>
		<!-- getter의 규칙을 만족하지 않으므로 안됨 -->
			\${pageContext.request.headerNames["user-agent"] } <br/>
		<!-- 속성명에 특수문자가 존재하는 경우 반드시 대괄호로 접근할것 -->
			\${header["user-agent"]} : ${header["user-agent"]}
			
			
		<h2>EL의 cookie 내장객체</h2>
		<!-- 
			EL은 쿠키 설정을 할수없다 꺼내올 수만 있을 뿐
		
		 -->
		 
		 <%
		 	Cookie cookie = new Cookie("KOSMO","한소인");
		 	cookie.setPath(request.getContextPath());
		 	cookie.setMaxAge(0);
		 	response.addCookie(cookie);
		 	
		 	
		 %>
		 <h4>자바코드로 쿠키 값 읽어오기</h4>
		 
		 <% 
		 
		 Cookie[] cookies = request.getCookies() ;
		 
			for(Cookie atom : cookies){
				
				String name = atom.getName();
				String val = atom.getValue();

			 	out.println(name + ":"  +val + "<br/>");
			}
		 %>
		 
		 
		 <h4>EL로 쿠키값 읽어오기</h4>
		 
		 \${cookie.KOSMO.value} :  ${cookie.KOSMO.value} <br/>
			 
			<h5>여기가 for each 문!</h5>	 
		 <c:forEach var ="cookie" items="${pageContext.request.cookies}">
		 	${cookie.name} : ${cookie.value} <br/>
		 </c:forEach>
		 
		<br/>
		
		 ${pageContext.request.cookies}
	
		 <h2>EL의 init 컨텍스트초기화 파라미터 </h2>
		 <!--얘는 서블릿 초기화파라미터는  못 읽어옴  -->
		 	<h4> 자바 코드로 컨텍스트 초기화 파라미터 읽기</h4>
		 	
		 		<ul>
		 			<li>ORACLE URL : <%= application.getInitParameter("ORACLE_URL") %></li>
		 		
		 			<li>ORACLE DRIVER : <%= application.getInitParameter("ORACLE_DRIVER") %></li>
		 		
		 		</ul>
		 		
		 	<h4> 자바 코드로 컨텍스트 초기화 파라미터 읽기</h4>
		 	
		 		<ul>
		 			<li>ORACLE URL : ${initParam.ORACLE_URL }</li>
		 		
		 			<li>ORACLE DRIVER : ${initParam['ORACLE_DRIVER']}</li>
		 		
		 		</ul>
		 		
		 		
		 <h2>컬렉션에 저장된 객체를 EL로 출력 </h2>
		 <%
		 	//데이터 준비
		 	MemberDTO first = new MemberDTO("KIM","1234","김길동",null,null);
		 	MemberDTO second = new MemberDTO("KIM2","1234","나길동",null,null);
		 	
		 	//리스트 계열 컬렉션에 객체 저장
		 	List<MemberDTO> list = new Vector<>();
		 	
		 	list.add(first);
		 	list.add(second);
		 	
		 	
		 	//map에 저장
		 	Map<String,MemberDTO> map = new HashMap<>();
		 
		 	map.put("first",first);
		 	map.put("second",second);
		 	
		 	
			 	
		
		 	
		 %>
		 
		 <h2>자바 코드로 출력</h2>
		 	<h4>리스트 계열 컬렉션</h4>
		 		<h6>for 문 사용</h6>
		 			<ul>
		 				<%
		 					for(MemberDTO mem : list){
		 						%>
		 						<li><%=mem %></li>
		 						<%
		 					}
		 				%>
		
		 			
		 			</ul>
		 		
		 		
		 		
		 	<h4>맵 계열 컬렉션</h4>
		 		<ul>
		 			<%
		 				for(Map.Entry<String,MemberDTO> entry : map.entrySet()){
		 					%>
		 					<li><%=entry.getKey() %> : <%=entry.getValue() %> </li>
		 					
		 			<% 	
		 				}
		 			
		 			
		 			%>
		 		
		 		
		 		
		 		</ul>
		 	
		 <h2>EL로 출력</h2>
		 <!-- 셋팅 -->
		 		<c:set var="el_list" value="<%=list %>"/>
		 		<c:set var="el_map" value="<%=map %>"/>
		 
		 
		 	<h4>리스트 계열 컬렉션</h4>
		 		<h6> Jstl 미사용시</h6>
		 		<!-- toString 오버라이딩이되어있으므로 주소가 아니라 정보가 나옴 -->
		 		\${el_list[0]} : ${el_list[0]} <br/>
		 		<ul>
		 			<li>이름 : ${el_list[0].name}</li>
		 			
		 			<li>아이디 : ${el_list[0].id}</li>
		 			
		 			<li>비번 : ${el_list[0].pwd}</li>
		 			
		 		
		 		</ul>
		 		
		 		
		 		<h6> Jstl 사용시</h6>
		 		
		 		<ul>
		 			<c:forEach var="li" items="${el_list }">
		 			
		 			<li>이름 : ${li.name}</li>
		 			
		 			<li>아이디 : ${li.id}</li>
		 			
		 			<li>비번 : ${li.pwd}</li>
		 			
		 			
		 			</c:forEach>
		 		
		 		
		 		</ul>
		 	
		 	
		 	<h4>맵 계열 컬렉션</h4>
		 		<h6> Jstl 미사용시</h6>
		 		<!-- toString 오버라이딩이되어있으므로 주소가 아니라 정보가 나옴 -->
		 		\${el_map.first} : ${el_map.first} <br/>
		 	
		 		
		 		<h6> Jstl 사용시</h6>
		 			<!-- entrySet으로 가져옴 -->
		 		<ul>
		 			<c:forEach var="i" items="${el_map}">
		 			
		 				<li> ${i.key} : ${i.value} ----> ${i.value.pwd } ----->${i.value[id]}</li>
		 			</c:forEach>
		 		
		 		
		 		</ul>
		 		
		 		<h5>컬렉션에 저장된 객체 수 el 변수 .size()</h5>
		 		<ul>
		 			<li>list size - ${el_list.size()}</li>
		 			<li>map size - ${el_map.size()}</li>
		 		</ul>
		 		
		 		
		 		
		 
	</fieldset>
		

</body>
</html>