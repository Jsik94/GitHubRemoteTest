<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/*
		아이디 저장이 되어있는 상태에서 로그아웃이라면,
		
		-->로그아웃후에도 아이디가 남아야함
	
		-->아니라면 아이디도 지워줘야함
	*/


	String id = null;
	if(request.getCookies()!=null){
		for(Cookie cookie : request.getCookies()){
			if(cookie.getName().equals("check")){
				
				//쿠키가 빈값으로 오는 경우도 처리해야함
				if(cookie.getValue().equals("")){

				}else{
					
					id = session.getAttribute("UID").toString();			
				}
			}
		}
	}
	
	
	//세션초기화
	session.invalidate();

	
	if(id !=null){
		Cookie cookie = new Cookie("ID",id);
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
	}

	response.sendRedirect("Login.jsp");

%>