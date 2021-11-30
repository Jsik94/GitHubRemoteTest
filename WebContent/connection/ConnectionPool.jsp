<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
	/*
		커넥션 pool을 이용한 커넥션 객체 사용]
		-톰캣 서버가 커넥션 pool에 미리 생성해 놓은 conection 객체를 갖다 사용하는 것
	
		
		
	*/
	
	
	Context context = new InitialContext();
	
	/*
		//여기까지가 드라이버 로딩 까지단계임
	context = (Context)context.lookup("java:/comp/env");
 
	//이제 안에서 파싱
	DataSource ds = (DataSource)context.lookup("jdbc/jsp");
 	*/
 	
 	
 	DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/jsp");
	Connection con = ds.getConnection();
	String connString;
	if(con !=null) connString="<h3>데이터 베이스 연결 성공 !</h3>";
	else connString="<h3>데이터 베이스 연결 실패!</h3>";
	
	if(con ==null) con.close();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend>커넥션 풀</legend>
		<%=connString %>
	</fieldset>

</body>
</html>