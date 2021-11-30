<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.PagingUtil"%>
<%@page import="model.BBSDTO"%>
<%@page import="model.BbsDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/isMember.jsp" %>
<%
	//검색을 위한 한글처리]
	request.setCharacterEncoding("UTF-8");


	Map map = new HashMap();
	
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	
	//검색을 위한 쿼리스트링
	String queryString_forSearch ="";
	//처음을 의미
	if(searchWord !=null){
		
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);

		queryString_forSearch=String.format("searchColumn=%s&searchWord=%s",searchColumn,searchWord);
	}
	
	
	//전체 글 목록 가져오기
	BbsDAO dao = new BbsDAO(application);
	
	int totalRowCount = dao.getTotalRowCount(map);
	int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
	int blockPage=Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));;

	int totalPage = (int)Math.ceil((double)totalRowCount/pageSize);
	
	int nowPage = request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	int start= (nowPage-1)*pageSize+1;
	int end = nowPage*pageSize;

	System.out.println("pageSize : " + pageSize);

	System.out.println("BlockSize : " + blockPage);
	
	map.put("start",start);
	map.put("end",end);

	List<BBSDTO> list= dao.selectList(map);
	int currCnt = list.size(); 
	//List<BBSDTO> list= dao.selectList();
	System.out.println("List Size : " + list.size());

	dao.close();



%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link href="<%=request.getContextPath()%>/css/layout.css"
	rel="stylesheet" />
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
				<fieldset style="width: 85%;padding:10px 20px">
					<legend>회원제 게시판 목록(<%=nowPage %>/<%=totalPage %>)</legend>
					<!-- 글쓰기 버튼 -->
					<table style="width: 100%">
						<tr>
							<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
						</tr>
					</table>
					<table style="border-spacing: 1px; background-color: gray;width:100%;">
						<tr style="background-color: white" align="center">
							<th width="10%">번호</th>
							<th width="45%">제목</th>
							<th width="15%">작성자</th>
							<th width="10%">조회수</th>
							<th>작성일</th>
						</tr>
						
						<%if(list.isEmpty()){ %>


						<tr style="background-color: white" align="center">
							<td colspan="5">등록된 글이 없어요</td>
						</tr>
						<%}else{ 

							int countNum = 0;
							for(BBSDTO dto:list){

						%>

						<!-- 아래 반복 -->
						<tr style="background-color: white" align="center">
							<td><%
								//현재페이지에서 페이지별로 내림차순으로뿌려주는 코드
								out.println(totalRowCount - (((nowPage - 1) * pageSize) + countNum));
								
								countNum++;
							
							
							%></td>
							<td style="text-align: left"><a href="View.jsp?no=<%=dto.getNo() %>&nowPage=<%=nowPage%>&currCnt=<%=currCnt%>&<%=queryString_forSearch%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getVisitCount() %></td>
							<td><%=dto.getPostDate() %></td>
						</tr>
						<%} 
						}%>
						

					</table>
					<!-- 페이징 -->
					<table width="100%">
						<tr align="center">
							<td><%= PagingUtil.pagingBootStrapStyle(totalRowCount, pageSize, blockPage, nowPage, "List.jsp?"+queryString_forSearch+"&") %></td>
						</tr>
					</table>
					<!-- 검색UI -->
					<form method="post">
						<table width="100%">
							<tr align="center">
								<td><select name="searchColumn">
										<option value="title">제목</option>
										<option value="name">작성자</option>
										<option value="content">내용</option>
								</select> 
								<input type="text" name="searchWord" /> 
								<input type="submit"value="검색" /></td>
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