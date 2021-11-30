<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamLoginProcess.jsp -->
<%

	Cookie[] cookies =  request.getCookies();
	
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	String idsave = request.getParameter("idsave");
	
	
	//아이디 KIM 비번 1234 가정

	if("KIM".equals(user.trim())&& "1234".equals(pass.trim())){
		//1로그인처리
		session.setAttribute("uid", user);
		session.setAttribute("upw", pass);
		
		if(idsave==null){
			Cookie cookie = new Cookie("checked",user);
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
			
		}else{
			//if(idsave.equals("Y")){
				Cookie cookie = new Cookie("checked",user);
				cookie.setPath(request.getContextPath());
				response.addCookie(cookie);
			//}	
		}
		
		
		response.sendRedirect(request.getContextPath()+"/cookie05/CookieExamIndex.jsp");
		
		
	}else{
		
		request.setAttribute("ERROR", "아이디/비번 불일치");
		request.getRequestDispatcher("CookieExamIndex.jsp").forward(request, response);
	}

%>