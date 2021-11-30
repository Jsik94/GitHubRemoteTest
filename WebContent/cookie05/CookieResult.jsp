<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키값 확인</legend>
		<%
			Cookie[] data = request.getCookies();
			if(data!=null){
				for(Cookie atom : data){
					out.write(atom.getName()+" : " + atom.getValue()+"</br>");	
				}
			}

		
		%>
	</fieldset>
</body>
</html>