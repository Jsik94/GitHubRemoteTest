<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//[멤버 변수]
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private JspWriter out;
	
	
	private void connect(ServletContext application){
		
		try{
			Class.forName(application.getInitParameter("ORACLE_DRIVER"));
			
			con = DriverManager.getConnection(application.getInitParameter("ORACLE_URL"),"scott","tiger");
			
		}catch(SQLException e){
			
			try{

				out.println("console.log('DB 연결 실패')");
			}catch(IOException e1){
				
			}
		
		
		
		}catch(ClassNotFoundException e){
			
			try{

				out.println("console.log('드라이버 로딩 실패')");
			}catch(IOException e1){
				
			}
		}
		
		
		
	}
	
	
	private void closed(){
		

			try{		
				if(con!=null){
					con.close();
				}
				
				if(pst!=null){
					pst.close();
				}
				
				if(rs!=null){
					con.close();
				}
			}catch(SQLException e){
				try{

					out.println("console.log('DB 닫기 실패')");
				}catch(IOException e1){
					
				}
			}
		
		
	}
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptingPractice.jsp</title>
</head>
<body>
<fieldset>
		<legend>스크립팅 요소 연습하기</legend>
		<h2>표현식으로 출력</h2>
		<table style="border-spacing:2px;background-color: green">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<!-- 아래 tr을 반복 -->
			<%
				this.out = out ;

				connect(application);
				out.print("alert('여까지성공')");
				String quary = "SELECT * FROM EMP";
				pst =  con.prepareStatement(quary,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				
				rs =pst.executeQuery();
				
				while(rs.next()){
					
					%>
								<tr style="background-color: white">
									<td><%=rs.getString(1) %></td>
									<td><%=rs.getString(2) %></td>
									<td><%=rs.getString(3) %></td>
									<td><%=rs.getDate(5) %></td>
									<td><%=rs.getString(6) %></td>
									<td><%=rs.getString(7)==null ? "" : rs.getString(7) %></td>
									<td><%=rs.getString(8) %></td>
								</tr>
					
					
					
					<%
		
				}
				
			%>
			
			
					

			
		</table>
		<h2>out내장객체로 출력</h2>
		<table style="border-spacing:2px;background-color: green">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			
			<%
				this.out = out ;
				
	
				
				out.println("<tr style='background-color: white'>");
				while(rs.previous()){
					
					
							out.println("<tr style=\"background-color: white\">");
							out.println("<td>"+rs.getString(1)+"</td>");
							out.println("<td>"+rs.getString(2)+"</td>");
							out.println("<td>"+rs.getString(3)+"</td>");
							out.println("<td>"+rs.getDate(5)+"</td>");
							out.println("<td>"+rs.getString(6)+"</td>");
							out.println("<td>"+rs.getString(7)==null ? "" : rs.getString(7)+"</td>");
							out.println("<td>"+rs.getString(8)+"</td>");
								
			
		
				}
				
				out.println("</tr>");
				closed();
				
			%>
			
			
			
			
		</table>
				
		
	</fieldset>
</body>
</html>