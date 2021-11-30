<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="Errorinfo.jsp"
    
    %>
    
<%
	//사용자가 입력한 나이 받기
	String data_age = request.getParameter("age");

	String err_msg ="";
	int after10year =-1;
	if(data_age !=null){
		//try catch 로 에러 우회
		/*try{

			after10year = Integer.parseInt(data_age)+10;
		}catch(NumberFormatException e){
			err_msg = "나이는 숫자만 입력해주세요";
		}*/
		//out.println("age : "+data_age);
		
		//페이지 사용
		after10year = Integer.parseInt(data_age)+10;
		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러가 발생 할 페이지</legend>
		<form >
			나이를 입력하세요.
			<input type="text" name = "age" />
			<input type="submit" name = "확인" />
		</form>
		
		<h3>
		
			<% if(after10year !=-1){ %>
			당신의 10년 후 나이는 <%= after10year  %> 살 입니다.
			
			<%} %>
			<%= err_msg %>
		</h3>
	</fieldset>
</body>
</html>