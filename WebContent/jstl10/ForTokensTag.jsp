<%@page import="java.util.StringTokenizer"%>
<%@page import="sun.util.locale.StringTokenIterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>forTokens 태그</legend>
		<%
			String str = "red,blue,green,yellowgreen,#2233af";
			out.println("<h2>"+str+" foreach 이용</h2>");
			for(String atom : str.split(",")){
				out.println("<h4 style = 'color:"+atom+";'>" + str +"</h4>");
			}
			
			StringTokenizer stk = new StringTokenizer(str,",");
			
			out.println("<h2>"+str+" Tokenizer 이용</h2>");
			
			while(stk.hasMoreTokens()){
				
				out.println("<h4 style = 'color:"+stk.nextToken()+";'>" + str +"</h4>");
				
			}
			
		%>
		
		<h2>JSTL Tokens 이용</h2>
		
		<c:set var="str" value="<%=str %>"/>
		<c:forTokens items="${str}" delims="," var="it">
			<h4 style ='color : ${it};'> 이게 가독성 씹 개꿀 이네 </h4>
		
		</c:forTokens>
		
		
	</fieldset>
</body>
</html>