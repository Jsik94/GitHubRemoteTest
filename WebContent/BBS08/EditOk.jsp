<%@page import="java.net.URLEncoder"%>
<%@page import="model.BBSDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("No");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println("게시판넘버 -->"+no);
	BBSDTO dto = new BBSDTO();
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);

	String nowPage=request.getParameter("nowPage");
	String currCnt = request.getParameter("currCnt");
	
	
	BbsDAO dao = new BbsDAO(application);
	boolean flag = dao.update(dto)!=-1 ? true : false;
	
	
	//검색솔루션----------------------------------------
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	//검색을 위한 쿼리스트링
	String queryString_forSearch ="";
	//처음을 의미
	if(searchWord !=null){
		queryString_forSearch=String.format("searchColumn=%s&searchWord=%s",searchColumn,URLEncoder.encode(searchWord,"UTF-8"));
	}
		
	
	
	//response.sendRedirect("View.jsp?no="+no+"&nowPage="+nowPage+"&"+queryString_forSearch);
	
	if(flag){
		
	
	%>
	<form action="View.jsp">
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="searchColumn" value="<%=nowPage%>">		
		<input type="hidden" name="searchWord" value="<%=nowPage%>">
		<input type="hidden" name="currCnt" value="<%=currCnt%>">
		
	</form>
	<script>
	
	   document.forms[0].submit();
		
	
	</script>
	
	<% }else{
		
		%>
		<script>
			alert('수정 실패!');
			history.back();
			
		
		</script>
		
		<%
	}
	

%>
