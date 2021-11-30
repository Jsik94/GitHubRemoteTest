<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- CookieExamCartEmpty.jsp -->
<%

	//쿠키 삭제 값을 빈값주면됨
	//요청 헤더에서 쿠키값 일기
				
				Cookie[] cookies = request.getCookies();
				
				//상품코드값을 담을 컬렉션
				List cart = new Vector();
				
				if(cookies!=null){
					for(Cookie atom : cookies){
						//쿠키명 얻기]
						String name = atom.getName();
						String val = atom.getValue();
						
						if(name.indexOf("product")!=-1){
							//1] 동일한 쿠키명으로 쿠키 생성
							Cookie cookie = new Cookie(name,"");
							cookie.setPath(request.getContextPath());
							cookie.setMaxAge(-1);
							response.addCookie(cookie);
						}
					}

					response.sendRedirect("CookieExamIndex.jsp");
				}

				

%>