<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언부
	//[멤버 상수 정의]
	
	public static final int INT_MAX = Integer.MAX_VALUE;

	public String mVariable  = "<h3> 이게 수업이지 쥐엔장 이해해버렸다구~</h3>";
	
	int getMaxNumber(int num1,int num2){
		
		return Math.max(num1,num2);
	}
	
	
	//jspService 내장 객체 변수 사용방법
	
	//sol 1. 변수 선언
	JspWriter out;
	void showMessage(String params){
		
		try{

			out.println(params);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	//sol 2. 매개변수로 전달받음
	
	void showMessage(String params,JspWriter out){
		
		try{

			out.println(params);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptingBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소</legend>
			
			<%
				//Scriptlet
				// _jspService 안에 선언하는 지역변수임
				// 파라미터로 request,response 변수를 가짐 
				//당연히 메소드 내부 요소이므로 함수정의는 불가하지~
				
				
				String localVariable = "<h4> 스크립틀릿 변수 임 쥐엔장 </h4>";

				out.println(mVariable);
				out.println(INT_MAX);
				out.println(localVariable);
				out.println("최댓값 : " + getMaxNumber(1, 10));
				
				//멤버변수와 지역변수를 이렇게 매핑해서 사용할 수 있음 
				this.out = out ;
				showMessage("<h4>this.out = out 방식으로 선언부에  선언한 내장객체전달</h4>");
				
				//파라미터를 전달받아서 사용가능 
				showMessage("<h4>파라미터로 넘겨서  선언부에  선언한 내장객체전달</h4>",out);
			%>
				
			<h3>표현식으로 출력</h3>
			
			<%
				//표현식
				//_jspService 안에 out.print()내부에 직접 넣어주는 것과 같음
							
			%>
			
			<%= getMaxNumber(1, 100) %>
	</fieldset>

</body>
</html>