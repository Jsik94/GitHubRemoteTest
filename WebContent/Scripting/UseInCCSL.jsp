<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
		request.setCharacterEncoding("UTF-8");
    
    	String default_font = "맑은 고딕 ";
    	String default_color = "black";
	
    	String req_color= request.getParameter("color");
    	String req_font= request.getParameter("font");
    	
    	out.print(req_color + " - " + req_font);
    	
    	if(req_color !=null ){
    		default_color = req_color;
    	}
    	

    	if(req_font !=null){
    		default_font = req_font;	
    	}
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!--

-->


	span{
	
		color:<%=default_color %>;
		font-family:<%=default_font %>;
	
	}

</style>
</head>
<body>

	
	<fieldset>
		<legend>HTML 안에서 스크립팅 요소 사용 </legend>
		<% for(int i = 1 ; i < 7 ; i++){ %>
		
			<h<%=i %>> 제목<%=i %></h<%=i %>>

		<% } %>
		<form >
			<input type="text" name="counter"/>
			<input type="submit" value="이미지 카운터"/>
		</form>
		<% 
			String counter = request.getParameter("counter");
		
			if(counter !=null){
				
				for(char a : counter.toCharArray()){
				
					if( (a-'0')>=0 && (a-'0')<=9){
						%>
						
						<img src="../images/num_<%=(a-'0') %>.gif" alt="<%=(a-'0') %>번 이미지">
						
						<%
					}
				}
				
			}
		
		%>	
		
		
	</fieldset>
	
	<fieldset>
		<legend>CSS 안에서 스크립팅 요소 사용 </legend>

		
		<span>CSS를 적용한 텍스트</span>
		<form method="post">
			[글자색] <select name="color">
				<option value="">색상 선태요망</option>
				<option value="Red">빨강</option>
				<option value="Green">그린</option>
				<option value="Blue">블루</option>
			</select>
			[글꼴] <select name="font">
				<option value="">글꼴 선태요망</option>
				<option value="굴림체">굴림체</option>
				<option value="바탕체">바탕체</option>
				<option value="휴먼옛체">휴먼옛체</option>
			</select>
			<input type="submit" value="글꼴 및 색상 변경" />
		</form>
		
		<!-- 
			값으로 인식이안된다.-> quatation 으로 감싸야한다. 
			
		 -->
		
		<script>
			
		
		
		
		
		</script>
		
		
	</fieldset>
	
	<fieldset>
		<legend>JS 안에서 스크립팅 요소 사용 </legend>
		<form method="post">
			아이디 <input type="text" name="id" />
			비밀번호 <input type="password" name="pwd" />
				<input type="submit" value="로그인" />
		</form>
	</fieldset>
		<script>
		<%--
			<% 
			//방법 [1]
				String user = request.getParameter("id");
				String pwd = request.getParameter("pwd");
			
				if(user !=null){
					if("KIM".equals(user)&&"1234".equals(pwd)){
				%>
						alert('<%= user %>님이 접속하셨습니다.');
				
				<%		
					}else{
					%>
					
						alert('아재 회원가입부터 하쇼...');
					
					
					<%
					
					}
				}
			%>
		
		--%>
		
		//방법[2]
			<%
			String user = request.getParameter("id");
			String pwd = request.getParameter("pwd");
				if(user !=null){
					if("KIM".equals(user)&&"1234".equals(pwd)){

						out.print("alert(\'"+user+"님이 접속하셨습니다.\')");
					}else{

						out.print("alert(\'가입부터 하자....\')");
					}
				}
				
			%>
		
		
		</script>

</body>
</html>