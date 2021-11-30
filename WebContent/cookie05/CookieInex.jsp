<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieInex</title>
</head>
<body>
	<fieldset>
		<legend>쿠키</legend>
		<h2>쿠키 설정하기 </h2>
		
		<%
							//Cookie key / value 
			Cookie cookie = new Cookie("uid","KOSMO");
			
			//쿠키적용Path를 제한할 수 있다.
			
			//전체적용
			cookie.setPath(request.getContextPath());
			
		
			//쿠키 유효시간 설정
			
				//설정안하면 웹메모리에 올라와있음 웹닫을때 사라짐
				
				//설정하면 PC에 저장되므로 시간설정이가능
				
			
				
			//쿠키를 헤더에 붙임
			
			response.addCookie(cookie);
		%>
		
		<h2>쿠키를 생성하는  현재 페이지에서 쿠키값 읽기</h2>
		
		<%
			Cookie[] data = request.getCookies();
			if(data!=null){
				for(Cookie atom : data){
					out.write(atom.getName()+" : " + atom.getValue()+"</br>");	
				}
			}

		
		%>
		<h2>페이지 이동 후 쿠키값 확인</h2>
		<a href="CookieResult.jsp">쿠키값 확인</a>
	</fieldset>

</body>
</html>