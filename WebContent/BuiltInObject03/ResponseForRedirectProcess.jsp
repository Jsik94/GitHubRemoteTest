<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%
	if(!request.getMethod().equals("POST")){
		%>
			<script>
				alert("잘못된 접근입니다.");		
				history.back();
			
			
			</script>
		
		<%
		return ;
	}
	/*
		회원인 경우 -> 마이페이지
		회원이 아닌 경우 -> 로그인 페이지로 back
		
		ex) kim 1234 가 회원으로 있다고 가정하자. 
		
	*/
	
	//1] 사용자 입력값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//원래는 세션객체로 이동시켜서 timeout control 가능할 듯  ?
	
	//validation
	
	if(id.toUpperCase().equals("KIM") && pwd.toUpperCase().equals("1234")){
		
		
		//sol1) sendRedirect방식 단 get 방식을 활용한 쿼리스트링을 이용해야됨
			//response.sendRedirect(request.getContextPath()+"/BuiltInObject03/ResponseForMyPage.jsp");
		
		//sol2)js로 메세지 띄운 후 이용 
		
			//이유  페이지 전환이 일어나기 때문에 페이지 조차안감 자바스크립트로 처리를 해줘야함
			//out.println("<script>");
			//out.println("alert('Login Success')");	
			//out.println("location.replace('ResponseForMyPage.jsp?username="+id+"&pwd="+pwd+"')");
			//out.println("</script>");
			
			%>
				<form action="ResponseForMyPage.jsp" method = "post">
					<input type = "hidden" name = "username" value = "<%=id%>"/>
					<input type = "hidden" name = "pwd" value = "<%=pwd%>"/>
				</form>
				<script>
					document.forms[0].submit();
				</script>
			<% 
			
	}else{
			//back으로 돌림 
			%>
				<script>
					alert('틀렷응!');
					/* location.href='ResponseForRedirectIndex.jsp'; */
					history.back();
				</script>
			<%
	}

%>

<script>




</script>
    
    
   