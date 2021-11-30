<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamCartProcess.jsp -->
<%
String[] codes = request.getParameterValues("cart");
for(String code: codes) {
   Cookie cookie = new Cookie(code, code);
   cookie.setPath(request.getContextPath());
   response.addCookie(cookie);   
}
response.sendRedirect("CookieExamIndex.jsp");
%>