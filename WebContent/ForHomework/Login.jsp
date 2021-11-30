<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	request.setCharacterEncoding("UTF-8");
	boolean login = false;
	boolean auto_save = false;
	String id = (String)session.getAttribute("UID");
	//세션에 id 가 있다면, 로그인 상태임
	if(id!=null){
		login = true;
	}else{
		//id가 없는 Case : 1) 처음 페이지 접속 or 2) 로그아웃 했을 때
		//비밀번호가 틀렸을땐 ,request로 id가 전달되므로 해당 경우엔 id 기입해줘야한다.
		id = request.getAttribute("RID") !=null ? request.getAttribute("RID").toString() : "";
	}
	
	

	
	//check 쿠키가 존재하는 Case : 1) 아이디 저장 버튼을 누르고 전송했을 때, 2) 아이디 저장버튼을 누르고 접속한 뒤 로그아웃 했을 때 
	
	Cookie[] cookies = request.getCookies();
	if (cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("check")){
				
				//정신나간 쿠키가 가끔 공백값으로 전달되므로 "" 값도 체크해야함 (이것때문에 500 error 많이본듯 )
				if(cookie.getValue()==null || cookie.getValue().length()==0){
					auto_save =false;
				}else{
					auto_save = true;
				}
				

			}else if(cookie.getName().equals("ID")){
				//2번 케이스 
				//아이디가 써져있어야함
				id = cookie.getValue();
				
				//쓴 쿠키는 버려줍시다~
				cookie.setValue(null);
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			
		}
	}

	
%>	

	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<script>
	function onLogout() {
		if(confirm('진짜 로그아웃하실 ? ')){
			location.href = "Logout.jsp"
		}else{
			return false;
		}
	}

	
	
	function isValidate(){
		var id = document.getElementsByName("username")[0].value;
		var pw = document.getElementsByName("password")[0].value;
	
	    if(id.length == 0 || pw.length==0){
	      alert('아이디, 비번을 모두 입력해주세요.')
	      return false
	    }else{
	      return true;
	    }

	}
</script>
</head>
<body>
	<fieldset>
		<legend>웹 스토리지를 이용한 아이디 저장</legend>
		​<span style="color: red; font-weight: bold">
		<!-- 여기에 아이디/비번 불일치시 에러 메시지 출력 -->
		
		<%= request.getAttribute("Error")!= null ? request.getAttribute("Error").toString() : "" %>
		
		</span>
		<form method="post" action="Process.jsp" onsubmit="return isValidate()">
			<table style="width:400px; border-spacing: 1px; background-color: green">
				<tr style="background-color: white">
					<td style="width: 25%"> 아이디</td>
					<td>
						<input type="text" name="username"   <%= "value='"+id+"'" %> <%= login ? "disabled=''" : "" %>/>
						<input type="checkbox" name="idsave"  <%= auto_save ? "checked=''" : "" %> <%= login ? "disabled=''" : "" %>/> 아이디저장
					</td>
				</tr>
				<tr style="background-color: white">
					<td> 비밀번호</td>
					<td><input type="password" name="password" <%= login ? "disabled=''" : "" %>/></td>
				</tr>
				<tr style="background-color: white; text-align: center">
					<td colspan="2"><input type="submit" value="로그인" <%= !login ? "" : "hidden=''" %> /></td>
				</tr>
			</table>
		</form>
		<hr/>
		<!-- 아래 버튼 클릭시 Logout.jsp로 이동. 로그아웃 처리 -->
		​<input type="button" value="로그아웃" <%= login ? "" : "hidden=''" %> onClick="onLogout()"/>
		
		
	
</body>
</html>