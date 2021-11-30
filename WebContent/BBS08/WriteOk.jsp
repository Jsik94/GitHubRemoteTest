<%@page import="model.BbsDAO"%>
<%@page import="model.BBSDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id =(String)session.getAttribute("USER_ID");
	
	
	BBSDTO dto = new BBSDTO(null,id,title,content,null,null);
	
	BbsDAO dao = new BbsDAO(application);
	int affect = dao.insert(dto);
	
	if(affect ==1){
		response.sendRedirect("List.jsp");
	}else{
		%>
			<script>
				alert('등록 실패하였습니다.');
				history.back();
			
			</script>
		
		<%
	}
%>


