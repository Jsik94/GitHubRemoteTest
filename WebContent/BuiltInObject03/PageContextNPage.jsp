<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextNPage</title>
</head>
<body>

	<fieldset>
		<legend>pageContext 및  page 내장객체</legend>
		<h2>pageContext</h2>
		<hr/>
		
		<h4>request 내장 객체로 전송방식 얻기</h4>
			<%=request.getMethod() %>
		
		<h4>pageContext 내장 객체로 전송방식 얻기</h4>
			<%
				
				ServletRequest req = pageContext.getRequest();	
				String method = ((HttpServletRequest)req).getMethod();
				
				out.print(method);
			%>
			
			
		<h4>pageContext 내장 객체로 out방식 얻기</h4>
			<%
				pageContext.getOut().print("요로케 됨");
			
			%>
		<h4>application 내장 객체로 서버 물리 경로 얻기(중요)</h4>
			<%=
				//메타데이터 기준으로 있는 경로로 나옴 이클립스에서 실행시에는
				//원래는 war 배포위치에 있는 경로가 나타남 
				application.getRealPath("/images")
			
			
			
			%>
			
			<%= pageContext.getServletContext().getRealPath("/images")%>
		<h4> page 내장 객체는 jsp 페이지 자체를 의미 this 와 동일하다는게 포인트!</h4>
		<%="내장 객체 클래스명"+page.getClass().getName()+"</br>" %>
		<%="내장 객체 클래스명"+this.getClass().getName() +"</br>"%>
		<%
			if(this instanceof HttpServlet){
				out.write("서블릿이다 </br>");
			}
		
		%>
		
		
	</fieldset>

</body>
</html>