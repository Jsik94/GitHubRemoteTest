<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BBSDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	
	// 검색솔루션------------------------------------

	String searchColumn = request.getParameter("searchColumn");

	String searchWord = request.getParameter("searchWord");
		//검색을 위한 쿼리스트링
		String queryString_forSearch ="";
		//처음을 의미
		if(searchWord !=null){

			queryString_forSearch=String.format("searchColumn=%s&searchWord=%s",searchColumn,URLEncoder.encode(searchWord,"UTF-8"));
		}
		
		
	
	BbsDAO dao = new BbsDAO(application);
    dao.delete(no);
	dao.close();


	
    int curCnt = Integer.parseInt(request.getParameter("curCnt"));

	int nowPage=Integer.parseInt( request.getParameter("nowPage"));
	if(curCnt ==1){
		if(nowPage!=1){
			nowPage-=1;
		}else{
			nowPage =1;
		}
	}
	System.out.println("delete 에서 컬럼 : " +searchColumn);
	System.out.println("delete 에서 값 : " + searchWord);
    response.sendRedirect("List.jsp?nowPage="+nowPage+"&"+queryString_forSearch);

%>
    