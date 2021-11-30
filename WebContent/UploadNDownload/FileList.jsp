<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>업로드든 파일 목록 </legend>
		
		<%
		
			File dir = new File(application.getRealPath("/upload"));
		
			out.println("\n컨텍스트 경로:" +application.getContextPath());
			out.println("\n컨텍스트  기본경로:" +application.getRealPath("/"));
			out.println("\n리퀘스트 경로:"+request.getContextPath());
			
			out.println("경로 :" +dir);
			File[] myfiles = dir.listFiles();
			int cnt = myfiles.length;
		
		%>
		<ul>
			<%
				int count =0;
				for(File myfile : myfiles){
					
					%>
					
						<li > <%=++count %>.파일 이름 : <a href="Download.jsp?filename=<%=myfile.getName() %>"><%=myfile.getName() %></a>&nbsp;&nbsp;&nbsp; 파일 크기 : <%= (int)Math.ceil(myfile.length()/1024.0) %>KB</li>
					
					<%
					
				}
			%>
		
		</ul>
		
		<!-- request 영역에 setAttribute("paging", pagingStr) ;
		
		
		 -->
			
		${requestScope.paging}
		
	
	</fieldset>
</body>
</html>