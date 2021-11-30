<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload way</title>
</head>
<body>
	<!-- 
		제한 조건 : 모든 문제는 Model2 방식을 적용하여 푸십시오.
		web.xml 서블릿매핑부분은 답안에 넣을 수 없으므로, 
		각 팀장님들께서는 이 부분은 상기하셔서 스터디 자료로 활용해주십시오.
		
		
		파일저장 경로는 현재경로의 하위인 upload에 저장해 주십시오.
		
		Q1과 Q2트를 통해 Controller를 완성하시오
		
		
	 -->
	
	<fieldset style="width: 450px;">
		<legend>문제</legend>
			<a href="Q2_FileList.jsp">[파일목록으로 가기]</a>
			
			<form method="post" enctype="multipart/form-data" action='<c:url value="/day2/Q2_FileListController.kosmo"/>'>
				<table cellspacing="1" bgcolor="gray">
					<tr bgcolor="white">
						<td>올린이</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr bgcolor="white">
						<td>제목</td>
						<td><input type="text" name="title" /></td>
					</tr>
					<tr bgcolor="white">
						<td>관심사항</td>
						<td><input type="checkbox" name="inter" value="정치" />정치 <input
							type="checkbox" name="inter" value="경제" />경제 <input
							type="checkbox" name="inter" value="스포츠" />스포츠</td>
					</tr>
					<tr bgcolor="white">
						<td>첨부파일1</td>
						<td><input type="file" name="attachedFile1" /></td>
					</tr>
					<tr bgcolor="white" align="center">
						<td colspan="2"><input type="submit" value="파일업로드" /></td>
					</tr>
				</table>
				
					<input type="hidden" name="url" value = "<%= request.getRequestURI() %>"/>
			</form>

	</fieldset>



</body>
</html>