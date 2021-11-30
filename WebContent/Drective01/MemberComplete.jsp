<%@page import="java.io.IOException"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	errorPage="Errorinfo.jsp"
    
	%>

<%@ include file="IncludePage.jsp"%>

<%!
	private String radio(String type,String target){
	
		if(type.equals(target)){
			return "Checked=''";
		}
	
		return "";
	}
	
	private String select(String type,String target){
		
		if(type.equals(target)){
			return "Selected=''";
		}
	
		return "";
	}

	private String checked(String target,HttpServletRequest req){
	
		String[] checks = req.getParameterValues("inter");
		for(String val : checks){
			
			if(val.equals(target)){
				return "Checked=''";
			}
		}

	return "";
	}
	

	private boolean isValidate(JspWriter out , String param,String msg){
		if(param !=null || param.trim().equals("")){
			
			
			try{
			out.print("<script>");
			out.print("alert('"+msg+"');");
			out.print("history.back();");
			out.print("</script>");
			
			}catch(IOException e){
				e.printStackTrace();
				return false;
			}
				
		}
		
		
		return true;
	}
	
	
	private boolean isValidate(JspWriter out , String[] param){
		
		
		if(param !=null || param.length<3){
			
			
			try{
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			
			}catch(IOException e){
				e.printStackTrace();
				return false;
			}
				
		}
		
		
		return true;
	}
	
	
%>


<%
	//if(!request.getMethod().equals("POST")){
		
		
		
	//}else{

		request.setCharacterEncoding("UTF-8");
		Map<String,String[]> datas  = request.getParameterMap();

		
		String id = datas.get("id")[0];
		String pwd = datas.get("pwd")[0];
		String gender_select = datas.get("gender")[0];
		String select = datas.get("grade")[0];
		String self_intro = datas.get("self")[0];
	//}


%>





<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MemberComplete.jsp</title>
<link href="../css/layout.css" rel="stylesheet">

</head>
<body>
	<div class="wrap">
		<div class="header">

			<div class="logo">
				<img src="../images/logo.jpg" alt="회사 로고 이미지" />
			</div>
			<div class="topMenu">

				<%@ include file="/template/Top.jsp"%>
			</div>
		</div>
		<div class="content">
			<div class="aside">
				<ul>
					<li>서브메뉴1</li>
					<li>서브메뉴2</li>
					<li>서브메뉴3</li>
					<li>서브메뉴4</li>
					<li>서브메뉴5</li>
					<li>서브메뉴6</li>
					<li>서브메뉴7</li>
					<li>서브메뉴8</li>
					<li>서브메뉴9</li>
					<li>서브메뉴10</li>
				</ul>
			</div>
			<div class="main">
				<h2>
					회원가입 완료<%= getDate("yyyy-MM-dd") %></h2>
				<table
					style="width: 75%; border-spacing: 1px; background-color: green">
					<tr style="background-color: white">
						<td>아이디</td>
						<td><input type="text" name="id" size="20" value ="<%= id %>"/></td>
					</tr>
					<tr style="background-color: white">
						<td>비밀번호</td>
						<td><input type="password" name="pwd" size="20" value ="<%= pwd %>" /></td>
					</tr>
					
					<tr style="background-color: white">
						<td>성별</td>
						<td><input type="radio" name="gender" value="man" <%=radio("man", gender_select) %> />남 <input
							type="radio" name="gender" value="woman" <%=radio("woman", gender_select) %> />녀 <input type="radio"
							name="gender" value="trans" <%=radio("trans", gender_select) %>/>트랜스젠더</td>
					</tr>
					<tr style="background-color: white">
						<td>관심사항</td>
						<td><input type="checkbox" name="inter" value="pol" <%=checked("pol",request) %> />정치 <input
							type="checkbox" name="inter" value="eco" <%=checked("eco",request) %>/>경제 <input
							type="checkbox" name="inter" value="spo" <%=checked("spo",request) %>/>스포츠 <input
							type="checkbox" name="inter" value="ent" <%=checked("ent",request) %>/>연예</td>
					</tr>
					<tr style="background-color: white">
						<td>학력사항</td>
						<td><select name="grade" >
								<option value="ele" <%=select("ele", select) %> >초등학교</option>
								<option value="mid" <%=select("mid", select) %>>중학교</option>
								<option value="hig" <%=select("hig", select) %>>고등학교</option>
								<option value="uni" <%=select("uni", select) %>>대학교</option>
						</select></td>
					</tr>
					<tr style="background-color: white">
						<td>첨부파일</td>
						<td>sample.txt으갸갸갸갸갸갸갸</td>
					</tr>
					<tr style="background-color: white">
						<td>자기소개</td>
						<td><textarea cols="60" rows="5" name="self"><%= self_intro%></textarea></td>
					</tr>
					
				</table>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/template/Footer.jsp"%>
		</div>
	</div>
</body>
</html>