<%@page import="model.BBSDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/common/isMember.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가하기 위함
	String referer=request.getHeader("referer");
	
	//out.println(referer);
	String prevPageName=referer.substring(referer.lastIndexOf("/")+1);

	String nowPage=request.getParameter("nowPage");
	BBSDTO dto = dao.selectOne(no,prevPageName);

	String currCnt = request.getParameter("currCnt");
	
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");

		
	
	
	dao.close();
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />
</head>
<body>

	<div class="wrap">
		<div class="header">
			<div class="logo">
				<img src="<%=request.getContextPath()%>/images/logo.jpg" alt="회사 로고 이미지" />
			</div>
			<div class="topMenu">
				<jsp:include page="/template/Top.jsp"/>
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
				<fieldset style ="width:85% ; padding : 15px 10px 15px 10px ; margin-left: 15px;">
							<legend>글 수정 페이지</legend>
						<form action="EditOk.jsp" method="post">
								<table width="100%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td style="padding: 5px">
											<input type="text" name="title"	style="width: 98%" 
												value='<%= dto.getTitle()%>'
											
											 />
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
											<textarea rows="10" style="width: 98%" name="content"><%= dto.getContent().trim() %>
											</textarea>
										</td>
									</tr>
									<tr>
										<input type="text" name="No" value="<%=dto.getNo() %>" hidden="h"/>
										<input type="text" name="nowPage" value="<%=nowPage %>" hidden="h"/>
										<input type="text" name="searchColumn" value="<%=searchColumn %>" hidden="h"/>
										<input type="text" name="searchWord" value="<%=searchWord %>" hidden="h"/>
										<input type="text" name="currCnt" value="<%=currCnt %>" hidden="h"/>
										
									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="수정" /></td>
									</tr>
								</table>
						</form>		
								
				</fieldset>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="/template/Footer.jsp"/>
		</div>
	</div>
</body>
</html>