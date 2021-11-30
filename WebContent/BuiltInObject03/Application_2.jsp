<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="jdk.internal.util.xml.impl.Input"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application_2</title>
</head>
<body>
	<fieldset>
		<legend>application 내장 객체의  getResourceAsStream</legend>
		<h2>자바 io 사용 하여 파일 내용을 웹브라우저로 출력</h2>
		
		<%
			//source : file
			// dest : browser
		
			//1] 물리경로 얻기
			String path = application.getRealPath("/BuiltInObject03/Out.jsp");
			
			//연결
			BufferedReader br = new BufferedReader(new FileReader(path));
			
			String data;
			
			//입력
			while((data = br.readLine())!=null){
				
				out.println(data);
				
			}
			
			//out.close();
		%>
		
		<h2> getResourceAsStream</h2>
		<%
			InputStream is = application.getResourceAsStream("/BuiltInObject03/Out.jsp");
		
			br = new BufferedReader(new InputStreamReader(is));
			

			//입력
			while((data = br.readLine())!=null){
				
				out.println(data);
				
			}
			
			out.close();
			
			
		%>
		
	</fieldset>

</body>
</html>