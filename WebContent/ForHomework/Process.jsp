<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String idsave = request.getParameter("idsave");
	String id = request.getParameter("username");
	String pw = request.getParameter("password");



	//체크여부 판단
	if(idsave != null){
		
		//체크를 해서 넘어왔다면
		Cookie cookies = new Cookie("check","true");
		//전역적 사용
		cookies.setPath(request.getContextPath());
		cookies.setMaxAge(-1);	
		response.addCookie(cookies);
	}else{

		//체크를 안했다면 쿠키삭제
		Cookie cookies = new Cookie("check",null);
		cookies.setPath(request.getContextPath());
		cookies.setMaxAge(-1);	
		response.addCookie(cookies);
		
	}
	
	//아이디 판단
	
	
	if(id.trim().equals("KIM") && pw.trim().equals("1234")){
		
		session.setAttribute("UID", id);
		response.sendRedirect("Login.jsp");
		
	}else{
		
		request.setAttribute("Error", "회원 정보가 없습니다.");
		request.setAttribute("RID", id);
		%>
		<jsp:forward page="Login.jsp"></jsp:forward>
		<%
		
	}
	

%>