<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 
	String id = request.getParameter("user");
	String pass = request.getParameter("pass");
	String error =(String)request.getAttribute("ERROR");
	
	
	String s_id = (String)session.getAttribute("U_ID");
	String s_pw = (String)session.getAttribute("U_PW");
 	
	if(s_id!=null && s_pw!=null){
		id = s_id;
		pass = s_pw;
	}
	

	session.invalidate();
	
 %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardExamLogin.jsp</title>
</head>
<body>
<script>

	console.log('<%=error!=null ? error : ""%>');
</script>
<fieldset>
		<legend>forward 액션태그-로그인 예제</legend>
		<form action="ForwardExamProcess.jsp" method="post">
		아이디 <input type="text" name="user" value='<%= id !=null ? id : "" %>' />
		비밀번호 <input type="password" name="pass" value='<%= id !=null ? pass : "" %>'/>
		<input type="submit" value="로그인"/>
		</form>
		<span style="color:red"><%=error!=null ? error : ""%></span>
	</fieldset>
</body>
</html>