<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTOB"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	List<MemberDTOB> l =(List<MemberDTOB>)application.getAttribute("list") ;
    	HashMap<String,MemberDTOB> m = (HashMap<String,MemberDTOB> )application.getAttribute("map");
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>application 영역에 저장된 속성 읽기</legend>
		<h2>리스트 계열 컬렉션</h2>
		<ul>
		
			<%
						for(MemberDTOB one : l){
					%>
					
					<li>이름 : <%=one.getName()%> 나이 : <%=one.getAge()%> 아이디 : <%=one.getId()%>등록일 :<%=one.getRegidate()%> </li>
								
					<%
														}
													%>
		
		
		
		</ul>
		<h2>맵 계열 컬렉션</h2>
		<ul>
		
			<%
						for(Map.Entry<String,MemberDTOB> entry : m.entrySet()){
								MemberDTOB one = entry.getValue();
					%>
						
						<li>이름 : <%=one.getName() %> 나이 : <%=one.getAge() %> 아이디 : <%=one.getId() %>등록일 :<%=one.getRegidate() %> </li>
					
					
					<%

				}
			
			%>

		
		</ul>
	
	</fieldset>
</body>
</html>