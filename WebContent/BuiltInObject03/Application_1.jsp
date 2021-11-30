<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!

	private String getRealPath(){
		return this.getServletContext().getRealPath("/images");
	}

	private String getRealPath(ServletContext req){
		return req.getRealPath("/images");
		
	}
	
	private ServletContext application;
	private String getRealPath2(){
		return application.getRealPath("/images");
	}

	
	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>Application 내장 객체의 주요 메소드 </legend>
		
			<ul>
			<!--
		    -컨텍스트 초기화 파라미터 (cf-서블릿 초기화 파라미터랑 다름)
			목적]웹 어플리케이션(컨텍스트)을 구성하는 모든  jsp(서블릿)
			     에서 스트링형 상수를 공유하기 위함.
			STEP1] web.xml에 컨텍스트 초기화 파라미터 등록
			STEP2] ServletContext의 getInitParameter("파라미터명")
			         메소드로 얻기		
		 	-->
				<li>오라클 드라이버 <%=application.getInitParameter("ORACLE_DRIVER") %></li>
				<li>오라클 주소 <%=application.getInitParameter("ORACLE_URL") %></li>
				<li>this. <-얘는  컨텍스트파라미터임 	: <%=this.getServletContext().getInitParameter("ORACLE_DRIVER") %></li>
				<li>this. <-얘는 서블릿 파라미터임(컨텍스트 파라미터는 안나옴!) 	: <%=this.getInitParameter("ORACLE_DRIVER") %></li>
				<li>this. 서블릿 파라미터 call : <%= this.getInitParameter("SERVLET_INIT") %></li>
				<li>config 파라미터 : <%= config.getInitParameter("") %></li>
				
			</ul>
			
			
			<h2>컨텍스트 초기화 파라미터 </h2>
			
			<ul>
				<%
					Enumeration<String> names = application.getInitParameterNames();
					while(names.hasMoreElements()){
						
						String key = names.nextElement();
						String val = application.getInitParameter(key);
						%>
						
						<li> <%=key %> : <%=val %></li>
						<%
					}
				
				%>
			
			
			
			</ul>
			
			
			<h2>서버의 물리적 경로 얻기</h2>
			<!-- 
				반드시 / 로 시작
				단 웹상경로는 ContextRoot를 제외하고 시작
			 -->
			
			<ul>
				<li>application 내장객체  : <%=application.getRealPath("/css") %></li>
				<li>request 내장객체 : <%= request.getServletContext().getRealPath("/css") %>
			</ul>
			
			
			<h2>선언부에서 물리적 경로 얻기</h2>
			
			<ul>
				<li>this :  <%=getRealPath() %></li>
				<li>with using param :  <%=getRealPath(application) %></li>
				<% this.application = application; %>
				<li>member val :  <%=application.getRealPath("/images") %></li>
			
			</ul>
	
	</fieldset>

</body>
</html>