<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! 

	private String isAble(List cart,String val){
	
		if(cart.contains(val)){
			return "disabled";
		}
	
	
		return "";
	}

%>

    
<%
	//요청 헤더에서 쿠키값 일기
	
	Cookie[] cookies = request.getCookies();
	
	//상품코드값을 담을 컬렉션
	List cart = new Vector();
	
	String username = "";
	
	if(cookies!=null){
		for(Cookie atom : cookies){
			//쿠키명 얻기]
			String name = atom.getName();
			String val = atom.getValue();
			
			if(name.indexOf("product")!=-1){

				cart.add(val);
			}
			
			if("checked".equals(name)) username = val;
		}
	}

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamIndex.jsp</title>
</head>
<body>
<fieldset>
		<legend>쿠키를 이용한 장바구니 예제</legend>
		<form action="CookieExamCartProcess.jsp">
			<input type="checkbox" name="cart" value="product1" <%=isAble(cart, "product1") %>/> 상품1
			<input type="checkbox" name="cart" value="product2" <%=isAble(cart, "product2") %>/> 상품2
			<input type="checkbox" name="cart" value="product3" <%=isAble(cart, "product3") %>/> 상품3
			<input type="checkbox" name="cart" value="product4" <%=isAble(cart, "product4") %>/> 상품4
			<input type="checkbox" name="cart" value="product14" <%=isAble(cart, "product14") %> /> 상품14
			<input type="checkbox" name="cart" value="product190"<%=isAble(cart, "product190") %> /> 상품190
			<input type="submit" value="장바구니 담기" />
		</form>
		<form action="CookieExamCartEmpty.jsp">
			<input type="submit" value="장바구니 비우기" />
		</form>
		<a href="CookieExamCartResult.jsp">장바구니 보기</a>
	</fieldset>
	<fieldset>
		<legend>쿠키를 이용한 아이디 저장 예제</legend>
		
		<% 
			if(session.getAttribute("uid") ==null){
				
			
			
		%>
		
		​ ​ <span style="color: red; font-weight: bold">
			<%=request.getAttribute("ERROR")==null ? "" : request.getAttribute("ERROR") %>
		</span>
		
		
		
		<form method="post" action="CookieExamLoginProcess.jsp">
			<table	style="width: 400px; border-spacing: 1px; background-color: green">
				<tr style="background-color: white">
					<td style="width: 25%">아이디</td>
					<td>
						<input type="text" name="user" value='<%=
						request.getAttribute("uid")==null ? username : request.getAttribute("uid") 
						%>' />
						<input type="checkbox"	name="idsave" value="Y" <%= username.length() ==0 ? "" : "checked=''" %> /> 아이디저장
					</td>
				</tr>
				<tr style="background-color: white">
					<td>비밀번호</td>
					<td><input type="password" name="pass" value='<%=
						request.getAttribute("uid")==null ? "" : request.getAttribute("uid") 
						%>' /></td>
				</tr>
				<tr style="background-color: white; text-align: center">
					<td colspan="2"><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
			<%} else { %>
		​<a href="CookieExamLoginLogout.jsp" >로그아웃</a>
		<% }%>
</body>
</html>