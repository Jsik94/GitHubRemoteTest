<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	
	
	//2]
			
/*
		회원인 경우 Forward ForwardExamMyPage.jsp 액션태그로 이동 해당페이지에서 아이디와 비번은 처리하세여
		
		ForwardExamMyPage.jsp
			로그아웃 UI 처리하여라. ForwardExamLogin
			
		회원아닌 경우 back 하자 .
		
*/

		if(id.trim().equals("KIM") &&pass.trim().equals("1234")){
			
				session.setAttribute("U_ID", id);
				session.setAttribute("U_PW", pass);
			
			//로그인 처리
			%>
			
				<jsp:forward page="ForwardExamMyPage.jsp"></jsp:forward>
			
			<%
			
		}

	//3]
			
			/*
				리퀘스트영역에 "회원이 아닙니다." 를 넣어 액션태그로 던져 주세염
				단, id와 pass 값은 유지하세용 
			*/
			
			
			else{
				
				request.setAttribute("ERROR", "회원이아닙니다.");
				%>
				
				<jsp:forward page="ForwardExamLogin.jsp"></jsp:forward>
				<%
			}
			
%>