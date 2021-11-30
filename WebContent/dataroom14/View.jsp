<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 상단메뉴  -->
<jsp:include page="/template/Top_dataroom.jsp" />

<style>
<!--

-->

	.btn.btn-success{
		margin-right:5px;
	}
	
	.modal-dialog.modal-sm{
	
		width : 325px;
		
	}
	.glyphicon.glyphicon-lock{
	
		margin-right : 10px;
	}
		


</style>


<div class="container">
	<div class="jumbotron">
		<h1>
			자료실 <small>상세보기 페이지</small>
		</h1>
	</div>

	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번 호</th>
					<td>${record.no }</td>
				</tr>
				<tr>
					<th class="text-center">제 목</th>
					<td>${record.title }</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${record.name}</td>
				</tr>
				<tr>
					<th class="text-center">첨부파일</th>
					<td><a class="downfile"
						href="<c:url value="/dataroom/Download.kosmo?filename=${record.attachfile}&no=${record.no }"/>">${record.attachfile}</a></td>
				</tr>
				<tr>
					<th class="text-center">다운로드</th>
					<td id="downcount">${record.downcount}</td>
				</tr>
				<tr>
					<th class="text-center">등록일</th>
					<td>${record.postdate}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내 용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content }</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="pillMenu" class="nav nav-pills center-block"
				style="width: 200px; margin-bottom: 10px">
				<li><a href="#" class="btn btn-success" data-toggle="modal"
					data-target="#passwordModal">수정</a></li>
				<!-- confirm창에서  취소시에는 모달창이 뜨지 않도록 data-toggle="modal" 제거 그리고 자스로 제어해서 모달창을 띄운다(삭제 확인버튼 클릭시에만) -->
				<li><a href="#" class="btn btn-success"
					data-target="#passwordModal">삭제</a></li>
				<li><a href="<c:url value="/DataRoom/List.kosmo?nowPage=${param.nowPage }"/>"
					class="btn btn-success">목록</a></li>
			</ul>
		</div>
	</div>



</div>
<!-- container -->



<!-- 수정 삭제용 모달임 !! -->
<div class="modal  fade" id="passwordModal" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">    				
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal">
   						<span>&times;</span>
   					</button>   					
   					<h4 class="modal-title">비밀번호 입력창</h4>
   				</div>
   				<div class="modal-body">
   					<form class="form-inline" id="passwordForm" method="post" action="<c:url value="/dataroom/Password.kosmo"/>">
   						<!-- 키값 -->
   						<input type="hidden" name="no" value="${record.no }"/>
   						<!-- 수정/삭제 판단용 -->
   						<!-- JS롱 value를 셋팅하기 위한 모듈임  -->
   						<input type="hidden" name="mode"/>
   						<!-- 업로드된 파일명:삭제메뉴 클릭시 테이블 데이타 삭제후 업로드된 기존 파일 삭제하기 위함 -->
   						<input type="hidden" name="originalFilename" value="${record.attachfile}"/>
   						<!-- 현재 페이지번호 -->

   						<div class="form-group">
   							<label><span class="glyphicon glyphicon-lock"></span></label>
   							<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요"/>
   						</div>
   						<div class="form-group">
   							<input type="submit" class="btn btn-info" value="확인"/>
   						</div>
   					</form>
   				</div>   							
   		</div>
		
		
	</div>
</div>






<jsp:include page="/template/Footer_dataroom.jsp" />



<script>

	//모든 태그에 이벤트를 검 그러나 href가 우선임
	$('#pillMenu a').not(':last').click(function(){
		console.log($(this).html());
		
		var text = $(this).html().trim();
		
		if(text =='수정'){
			$('input[name=mode]').val('UPDATE')
		}else{
			if(confirm('정말로 삭제하시겠습니까?')){

				$('input[name=mode]').val('DELETE')
				$('.modal-title').html("삭제용 비밀번호 입력창");
				
				
				$('#passwordModal').modal('show');
			}else{
				
			}
		}
	});
	
	
	$('.modal-title').html("수정용 비밀번호 입력창");

	console.log("뭐가나오냐너는 ")
	
	console.log("%O",$('#pillmenu a'));





</script>



<script>

	$('.downfile').click(function(){
		var downcount = parseInt($('downcount').html()) +1;
		$('#downcount').html(downcount);
	
	})


</script>


