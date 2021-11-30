<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!

	private String convert(String param){
	
		switch(param.toUpperCase()){
			
			case "ECO" : return "경제";

			case "POL" : return "경제";

			case "SPO" : return "스포츠";
			
			default : return "연예";
		
	
		}
	
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForParameter.jsp</title>
</head>
<body>
	<fieldset>
		<legend>사용자가 전송한 파라미터와 관련된 request객체의 메소드</legend>
		<h3>form태그를 이용한 값 전송</h3>
		<form method="post">
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr bgcolor="white">
					<td>성별</td>
					<td>
					남<input type="radio" name="gender" value="남자" />
					여<input 	type="radio" name="gender" value="여자" />
					</td>
				</tr>
				<tr bgcolor="white">
					<td>관심사항</td>
					<td>
					경제<input type="checkbox" name="inter" value="eco" />
					정치<input type="checkbox" name="inter" value="pol" />
					스포츠<input	type="checkbox" name="inter" value="spo" />
					연예<input type="checkbox" name="inter" value="ent" />
					</td>
				</tr>
				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="확인" /></td>
				</tr>
			</table>
		</form>
		
			<%
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
		
			String gender = request.getParameter("gender");
			
			String[] inter = request.getParameterValues("inter");
			StringBuilder data = new StringBuilder();
			
			if(name != null){
				if(!name.trim().equals("")){

					data.append("이름 : " + name.trim()+" ");
				}
			}

			if(gender != null){
				
				data.append("성별 : " + gender + " ");
			}
			

			data.append("관심사 : ");
			if(inter !=null){
				
				for(int i = 0 ; i <inter.length;i++){
				
					data.append(convert(inter[i])+" ");
				}
			}
			
			
		
		%>	
		
		
		<!--값 출력-->
		<h2><%= data.toString() %></h2>
		
		<h3>A태그를 이용한 값 전송</h3>
		<a href="RequestForParameter.jsp?name=홍길동&gender=남&inter=spo&inter=ent">GET</a>
		<h3>모든 파라미터명 얻기</h3>
		<!--
			-request객체의 getParameterNames()메소드로 얻는다
			-파라미터명 존재 여부판단-->
		<ul style="list-style-type: upper-roman;">
			<%
				
				Enumeration<String> arr = request.getParameterNames();
			
				while(arr.hasMoreElements()){
					
					String key =  arr.nextElement();
					
					if(key.equals("inter")){
						String[] vals = request.getParameterValues(key);
						String paramVal = "";
						
						for(String atom : vals){
							paramVal += convert(atom)+" ";
						}
						
						out.print("<li>"+key+": " + paramVal+"</li>");
					}else{
						
						out.print("<li>"+key+": " + request.getParameter(key)+"</li>");
					}
					
					
				}
			
			%>
		</ul>
	</fieldset>
	<h2>맵으로 모든 파라미터 받기</h2>
	<ul style="list-style-type: upper-roman;">
		<%
			Map<String,String[]> maps = request.getParameterMap();
			
			for(Map.Entry<String,String[]> entry : maps.entrySet()){
				
				String vals = "";
				if(entry.getValue().length >1){
					for(String atom : entry.getValue()){
						vals+= convert(atom)+" ";
					}
				}
				
				
				out.print("<li>"+entry.getKey()+": " + request.getParameter(entry.getKey())+"</li>");
			}
			
		
		
		%>
		
	</ul>


</body>
</html>