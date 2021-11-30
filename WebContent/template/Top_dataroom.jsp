<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>DataRoom</title>

<!-- 부트스트랩 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
body {
	min-height: 2000px;
	/* 패딩은 최소 50은 줘야함 default static 이 50px 임  화면을 가리지 않게 padding으로 처리해야됨*/
	padding-top: 70px;
}
</style>

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->

			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#collapse-menu">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				
				<!-- CI표시  -->
				<a class="navbar-brand" href="#"><span
					class="glyphicon glyphicon-education">KOSMO</span></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<!-- 화면이 클때 보여지고 작을땐 header 밑에 딸려나옴  -->
			<div class="collapse navbar-collapse" id="collapse-menu">

				<!-- default는 right 임 -->
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="검색">
					</div>
					<button type="submit" class="btn btn-info">확인</button>
				</form>


				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/dataroom/Index.kosmo"/>">홈</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="<c:url value="/dataroom/List.kosmo"/>">자료실</a></li>
					<li><a href="#">공지사항</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">메뉴3 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Menu1</a></li>
							<li><a href="#">Menu2</a></li>
							<li><a href="#">Menu3</a></li>
							<li class="divider"></li>
							<li><a href="#">Menu4</a></li>
							<li class="divider"></li>
							<li><a href="#">Menu5</a></li>
						</ul></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>