<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//encording
	request.setCharacterEncoding("UTF-8");

	/*
	2]파일 업로드를 위한 MultipartRequest객체 생성
	 ※MultipartRequest객체 생성만으로 파일 업로드가 이루어짐
	
	MultipartRequest(
	 javax.servlet.http.HttpServletRequest request,
	 java.lang.String saveDirectory,
	 int maxPostSize,
	 java.lang.String encoding,
	 FileRenamePolicy policy)
	
	 ※MultipartRequest 객체 생성시,
	   최대 업로드 용량 초과시에는 예외 발생
	
	 
	  */
	  
	  
	//3] 생성자 파라미터 설정
	//3-1] 업로드할 서버의 물리적 디렉토리 설정
	String saveDirectory = application.getRealPath("/upload");   
	out.println(saveDirectory);

	
	
	//3-1] 업로드할 서버의 물리적 디렉토리 설정
	//파일을 여러개 업로드시에는 각각의 용량을 합친 크기가 최대 용량이다.
	
	int maxPostSize = 1024*500; //500KB
	String encoding = "UTF-8";
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	
	MultipartRequest mr = null;
	String name = null;
	String title = null;
	String inter = null;
	File file1 = null, file2 = null;
	
	try{
		
		//4]MultipartRequest 객체 생성
		mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
		name = mr.getParameter("name");
		title = mr.getParameter("title");
		inter = Arrays.toString(mr.getParameterValues("inter"));
		file1 = mr.getFile("attachedFile1");
		file2 = mr.getFile("attachedFile2");
		
	}catch(IOException e){
		e.printStackTrace();
		request.setAttribute("error", "업로드 용량을 초과하였습니다.");
		request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadComplete.jsp</title>
</head>
<body>
<fieldset>
		<legend>파일 업로드 결과</legend>
		<h2>type="file"요소를 제외한 폼 요소들</h2>
		<ul>
			<li>이름:<%=name %></li>
			<li>제목:<%=title %></li>
			<li>취미:<%=inter %></li>
		</ul>
		<h2>업로드된 파일 관련 정보</h2>
		<h3>첫번째 파일</h3>
		<ul>
			<li>원본 파일명: <%=mr.getOriginalFileName("attachedFile1") %></li>
			<li>실제 파일시스템에 저장된 파일명: <%=mr.getFilesystemName("attachedFile1") %></li>
			<li>컨텐츠 타입:<%=mr.getContentType("attachedFile1") %> </li>
			<li>파일크기:<%=(int)Math.ceil(file1.length()/1024.0)%>KB</li>
			<!-- 이미지 파일인경우 img태그로 표시 -->
			<% 
				String filename = file1.getName();
				String suffix = filename.substring(filename.lastIndexOf(".")+1);
				
				if(suffix.equalsIgnoreCase("JPG")||suffix.equalsIgnoreCase("PNG")){
					%>
					<c:url var="file1" value="/upload/"/>/<%=filename %>
					<li><img src="${file1}/<%=filename %>" alt="이미지" style="width:200px;height:200px"/></li>
					<%
				}
			%>
			
		</ul>
		
		<h3>두번째 파일</h3>
		<ul>
			<li>원본 파일명: <%=mr.getOriginalFileName("attachedFile2") %></li>
			<li>실제 파일시스템에 저장된 파일명: <%=mr.getFilesystemName("attachedFile2") %></li>
			<li>컨텐츠 타입:<%=mr.getContentType("attachedFile2") %> </li>
			<li>파일크기:<%=(int)Math.ceil(file2.length()/1024.0) %>KB</li>
			<!-- 이미지 파일인경우 img태그로 표시 -->
			<% 
				filename = file2.getName();
				suffix = filename.substring(filename.lastIndexOf(".")+1);
				
				if(suffix.equalsIgnoreCase("JPG")||suffix.equalsIgnoreCase("PNG")){
					%>
					
					<c:url var="file2" value="/upload/"/>/<%=filename %>
					<li><img src="${file2}/<%=filename %>" alt="이미지" style="width:200px;height:200px"/></li>
					
					<%
				}
			%>
		</ul>
	
	
	</fieldset>
</body>
</html>