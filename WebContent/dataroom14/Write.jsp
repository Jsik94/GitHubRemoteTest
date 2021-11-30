<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 상단메뉴  -->
<jsp:include page="/template/Top_dataroom.jsp" />
<div class="container">
   <div class="jumbotron">
      <h1>
         자료실 <small>목록 페이지</small>
      </h1>
   </div>
   <div>
   	
      <form id="myform" class="form-horizontal" method="post" enctype="multipart/form-data" action="<c:url value="/dataroom/Write.kosmo"/>">
         <div class="form-group">
            <label class="col-sm-2 control-label">작성자</label>
            <div class="col-sm-4">
               <input type="text" class="form-control" name="name"
                  placeholder="이름을 입력하세요?">
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">제 목</label>
            <div class="col-sm-4">
               <input type="text" class="form-control" name="title"
                  placeholder="제목을 입력하세요?">
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">파일 업로드</label>
            <div class="col-sm-8">
               <input type="file" name="attachfile">
               <p class="help-block">파일을 첨부하세요</p>
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-4">
               <input type="password" class="form-control" name="password"
                  placeholder="비밀번호를 입력하세요">
            </div>
         </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">내 용</label>
            <!-- 중첩 컬럼 사용 -->
            <div class="col-sm-10">
               <div class="row">
                  <div class="col-sm-8">
                     <textarea rows="5" class="form-control" name="content"
                        placeholder="내용을 입력하세요"></textarea>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
               <button class="btn btn-primary">등록</button>
            </div>
         </div>
      </form>
   </div>
   
</div>
<!-- container -->


<div class="modal  fade" id="small-modal" data-backdrop="static">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-body">
            <button class="close" data-dismiss="modal">
               <span>&times;</span>
            </button>
            <h5 class="modal-title"><span class="glyphicon glyphicon-bullhorn"></span> 확인 메시지</h5>
            <h5 id="warningMessage" style="color:red"></h5>
         </div>
      </div>
   </div>
</div>






<jsp:include page="/template/Footer_dataroom.jsp" />



<script>
	$(function(){
		
		var focusObject;
		//j쿼리 돔객체임 var jQueryDom = $('input[name=attachFile]')
		//전환
		var jsDom = $('input[name=attachfile]').get(0);
		//var jsDom = $('input[name=attachfile]').get(0);
		      

		//모달창이 닫히면 발생하는 이벤트  셋업
		$('#small-modal').on('hidden.bs.modal', function () {
			focusObject.focus();
			
		});

		
		
		//이벤트명 -> 이벤트 내용
		$('#myform').on('submit',function(){
			
			//js 폼 객체로 전환
			var form = $(this).get(0);
			
			//form객체가 되겠지, 거기에 이름이 attachfile인 input 타입 받아옴
			var file = $(this).get(0).attachfile;
			
			if(form.name.value==""){
				
				$('#warningMessage').html('이름을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
			
			if(form.title.value==""){
				
				$('#warningMessage').html('제목을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
			
			
			//스크립단에서도 충분히 파일 정책을 validation 할 수 있음
			if(file.value==""){
				$('#warningMessage').html('파일을 삽입하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
				
			}else{
				
				//file 자체는 이름으로 불러오는거라 인덱스로 접근해야 해당객체가됨
				console.log('파일 크기 : ', file.files[0].size)
				console.log('파일 이름 : ', file.files[0].name)
				console.log('파일 타입 : ', file.files[0].type)
				
				if(file.files[0].size>500*1024){
					$('#warningMessage').html('업로드 제한을 초과하였습니다.');
					$('#small-modal').modal('show');
					focusObject = form.name;
					return false;
				}
				
			}
			
			if(form.password.value==""){
				
				$('#warningMessage').html('제목을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
			
			if(form.title.value==""){
				
				$('#warningMessage').html('제목을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
			
			if($('textarea').val()==""){
				
				$('#warningMessage').html('내용을 입력하세요');
				$('#small-modal').modal('show');
				focusObject = form.name;
				return false;
			}
		})
		
	});
	
	
	
	



</script>






