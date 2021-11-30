<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Download.jsp -->

<%
	/*
		1]컨텐트 타입을 인식하지 못하는 값으로 쏘면 웹브라우저가 자체 다운로드창을 띄움
		
		2]서버에 저장된 파이을 출력스트림을 통해 웹브라우저에 출력한다.
	*/
	
	String filename = request.getParameter("filename");
	String saveDirectory = application.getRealPath("/upload");
	
	//옵션] 프로그래스바 - 파일 크기를 알아야함 

	File file = new File(saveDirectory+File.separator+filename); 
	long len = file.length();
	
	
	// 컨텐트타입 설정
	response.setContentType("application/octet-stream");
	
	//프로그래스바 설정을 위한거임
	response.setContentLengthLong(len);
	
	/*
		응답헤더명 : Content-Disposition
		헤더값 : attachment; filename=파일명
		
		setHeader에 추가 
	
		브라우저 종류에 따라 한글이 깨질 수 있음 -> 따라서 각 브라우저에 맞게 인코딩 방식을 따라야함
	*/
	
	
	//IE 판단  : 헤더에  MSIE , EDGE 값이 있거나 11.0 의 값이 존재할 경우
	boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") !=-1 || 
			request.getHeader("user-agent").indexOf("11.0") !=-1 ||
			request.getHeader("user-agent").toUpperCase().indexOf("EDGE") !=-1 ? true : false;
	
	if(isIe){
		filename = URLEncoder.encode(filename,"UTF-8");
	}else{
		//기타브라우저
		//charset 8859_1의 인코딩 방식을 따른다 
		//문자열을 위의 인코딩방식으로 byte배열로 바꾼다.
		
		filename = new String(filename.getBytes("UTF-8"),"8859_1");
		
		
	}
	

	response.setHeader("Content-Disposition", "attachment;filename="+filename+"");
	
	
	//IO work
	
	/*
		IO작업을 통해서 서버에 있는 파일을 웹브라우저에 바로출력
	
		SRC -> 파일 -> 노드 스트림 : FileInputStream 
					  필터 스트림 : Buffered
		
					  
		DEST-> 웹부라우저 -> 노드 스트릠 : response.getOutputStream()
						필터 스트림 : Buffered
						
						
		
	*/
	
	/*
	 ERROR 내용 -> 응답을 위해 getOutputStream()이 이미 호출
	이미 out객체가 있어서 내장객체와 Collision 발생
	
	solution은  생성전 clear 하고 다시 넣어주면됨

	*/
	
	out.clear();
	 out = pageContext.pushBody();
	
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		
		int data;
		while((data=bis.read())!=-1){
			
			bos.write(data);
			
			//bos.flush();
		}
		bis.close();
		bos.close();

	
%>