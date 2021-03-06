<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
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
				<h2>마이 페이지</h2>
				<table
					style="width: 300px; border-spacing: 1px; background-color: green">
					<tr style="background-color: white">
						<td style="width: 25%">아이디</td>
						<td style="padding-left: 5px"><%=session.getAttribute("USER_ID")%>
						</td>
					</tr>
					<tr style="background-color: white">
						<td colspan="2"><a href="Logout.jsp">로그아웃</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="footer">
				<jsp:include page="/template/Footer.jsp"/>
		</div>
	</div>
</body>
</html>