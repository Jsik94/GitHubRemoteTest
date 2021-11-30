<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.BBSDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/isMember.jsp"%>
<%
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가하기 위함
	String referer=request.getHeader("referer");
	System.out.println(referer);
	String prevPageName=referer.substring(referer.lastIndexOf("/")+1);
	String nowPage=request.getParameter("nowPage");
	String currCnt = request.getParameter("currCnt");
	BBSDTO dto = dao.selectOne(no,prevPageName);
	
	//이전글 다음글 조회하기 
	
	Map<String,BBSDTO> map  = dao.prevNext(no);
	
	System.out.println(map.toString());
	
	
	// 검색솔루션------------------------------------
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	System.out.println("뷰 검색 쿼리값: "+searchColumn+"\t"+searchWord);
	
	//검색을 위한 쿼리스트링
	String queryString_forSearch ="";
	//처음을 의미
	if(searchWord !=null){
		
		queryString_forSearch=String.format("searchColumn=%s&searchWord=%s",searchColumn,searchWord);
	}
	System.out.println("뷰 검색 쿼리값: "+queryString_forSearch);
	
	
	dao.close();


%>




<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />
</head>
<body>

	<div class="wrap">
		<div class="header">
			<div class="logo">
				<img src="<%=request.getContextPath()%>/images/logo.jpg"
					alt="회사 로고 이미지" />
			</div>
			<div class="topMenu">
				<jsp:include page="/template/Top.jsp" />
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
				<fieldset style="width: 85%; padding: 10px 20px">
					<legend>글 상세보기 페이지</legend>
					<form action="WriteOk.jsp" method="post">
						<table width="75%" bgcolor="gray" cellspacing="1">
							<tr bgcolor="white">
								<td width="10%" align="center">작성자</td>
								<td style="padding: 5px"><%=dto.getName() %></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">작성일</td>
								<td style="padding: 5px"><%=dto.getPostDate() %></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">제목</td>
								<td style="padding: 5px"><%=dto.getTitle() %></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">조회수</td>
								<td style="padding: 5px"><%=dto.getVisitCount() %></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">내용</td>
								<td style="padding: 5px"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
							</tr>
							<tr bgcolor="white" align="center" style="height:50px">
								<td colspan="2">
								
								<%if(dto.getId().equals(session.getAttribute("USER_ID"))){ %>
								 <a href="Edit.jsp?no=<%=dto.getNo()%>&nowPage=<%=nowPage%>&<%= queryString_forSearch%>&currCnt=<%=currCnt%>">수정</a> |
								  <a href="javascript:alt()">삭제</a>
								  | 
								  <script>
  										function alt() {
											var flag = confirm('정말 삭제하실? ');
												
											if(flag){
												location.href="Delete.jsp?no=<%=dto.getNo()%>&nowPage=<%=nowPage%>&curCnt=<%= currCnt %>&<%= queryString_forSearch%>";
											}
										}

								</script>
								  
								
								<%} %>
								<a href="List.jsp?nowPage=<%=nowPage%>&<%= queryString_forSearch%>">목록</a>
								</td>
							</tr>
						</table>
						
						<!-- 이전글/다음글 -->
							<table style="width: 75%">
								<tr>
									<td style="width: 15%">이전글</td>
									<td><%= map.get("PREV")==null ? "이전글이 없습니다." : 
										String.format("<a href='View.jsp?no=%s'> %s </a>",map.get("PREV").getNo(),map.get("PREV").getTitle()) %></td>
								</tr>
								<tr>
									<td style="width: 15%">다음글</td>
									<td><%= map.get("NEXT")==null ? "다음글이 없습니다." : 
										String.format("<a href='View.jsp?no=%s'> %s </a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle()) %></td>
								</td>
								</tr>
							</table>
					</form>


				</fieldset>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="/template/Footer.jsp" />
		</div>
	</div>
</body>
</html>