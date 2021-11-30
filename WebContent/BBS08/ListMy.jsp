<%@page import="model.BBSDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/common/isMember.jsp" %>



<%


	//한글처리 ]
	request.setCharacterEncoding("UTF-8");
	
	BbsDAO dao = new BbsDAO(application);

	List<BBSDTO> list = dao.selectList();
	System.out.println(list);
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
							<legend>회원제 게시판 목록(3/24)</legend>
							<!-- 글쓰기 버튼 -->
							<table style="width: 100%; border: none;" >
								<tr>
									<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
								</tr>
							</table>
							<table width="100%"	style="border-spacing: 1px; background-color: gray ; width: 100%">
								<tr style="background-color: white" align="center">
									<th width="10%">번호</th>
									<th width="45%">제목</th>
									<th width="15%">작성자</th>
									<th width="10%">조회수</th>
									<th>작성일</th>
								</tr>	
								
								
								<%
									if(list==null){
										
								
								
								%>
								
								<tr style="background-color: white" align="center">
									<td colspan="5">등록된 글이 없어요</td>
								</tr>
								
								
								<% 
									}else{
										
										for(int i = 0 ; i < list.size() ; i++){
										
										
								%>
								
								<!-- 아래 반복 -->
								<tr style="background-color: white" align="center">
									<td>1</td>
									<td style="text-align: left">
										<a href="View.jsp?no=<%=list.get(i).getId() %>"><%=list.get(i).getTitle() %></a>
										</td>
									<td><%=list.get(i).getId()%></td>
									<td><%=list.get(i).getVisitCount() %></td>
									<td><%=list.get(i).getPostDate() %></td>
								</tr>
								
								
								<%
										}
									}
									
								%>
	
								
							</table>
							<!-- 페이징 -->
							<table width="100%"  style="border: none;">
								<tr align="center">
									<td>1 2 3 4 5 6 7  8 9 10</td>
								</tr>
							</table>
							<!-- 검색UI -->
							<form method="post">
								<table width="100%" style="border: none;">
									<tr align="center">
										<td>
											<select name="searchColumn">
													<option value="title">제목</option>
													<option value="name">작성자</option>
													<option value="content">내용</option>
											</select>
											<input type="text" name="searchWord" />
											<input type="submit" value="검색" />
										</td>
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