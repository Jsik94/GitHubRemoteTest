<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission1</title>
</head>
<body>

	<%--
	
	
	
	
		문제 lv1 유효성평가
			자바 스크립트만을 이용하여, 다음에 경우에만 제출시 페이지 이동하도록 검사하십시오.
			
			1. 모든 칸이 선택되어있다. (select 박스는 "선택하세요" 가 선택되어잇다면, 페이지 이동 안되게)
			2. 제목엔 반드시 문자가 포함되어야한다. ( 안되는예 ->123213123 되는예 -> 1ㅇ라아 or 아아아23)
			3. 체크박스는 반드시 한개이상 선택되어야한다.
			
			
			제출버튼을 눌렀을 때 위에 조건에 맞지 않다면, 알람을띄워 현재페이지에 남도록하고, 조건에 맞다면 다음페이지로 넘기십시오.(다음 페이지가 없다면, 만드십시오.)
		
		문제 lv2 
			
			1. 다음페이지에서 받은 데이터를 JSP를 이용하여 출력하시오.
			2. 평가점수가 4점인 초딩에 한에서만  "수석"이라고 화면에 출력하시오. 출력태그는 <h1>
			
		
		문제 lv3
			
			1.mission1.jsp 에서  평가점수 밑에 파일 업로드를 추가하고 , 구현하십시오.
			(단, 파일은 유효성검사에 포함시키지 마십시오.)
			
			2.제출한뒤 평가점수가 1점인 고딩에 한에서 mission1.jsp로 돌아가를 "졸업불가 수정요구"문구 를 빨간색 <h3>태그를 이용하여 화면에 출력하십시오
			출력위치는 legend태그 우측입니다.
			
		
		문제 lv4
			
			mission1.jsp 와 result1.jsp의 출력화면만 보고
			새 jsp파일을 생성하여 똑같이 구현하십시오.
	
	
	 --%>



	<fieldset>
		<legend>미션 폼1<span style="color: red; font-size: 1.8em; font-weight: bold;"></span>
		</legend>

		<form method="post" enctype="multipart/form-data" action="result1.jsp">
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
					<td>
						<input type="checkbox" name="inter" value="정치" />정치 
						<input type="checkbox" name="inter" value="경제" />경제 
						<input type="checkbox" name="inter" value="스포츠" />스포츠
					</td>
				</tr>
				<tr bgcolor="white">
					<td>학력</td>
					<td>
						<select name ="grade">
							<option value="">선택하세요</option>
							<option value="ele">초딩</option>
							<option value="mid">중딩</option>
							<option value="high">고딩</option>
						</select>
						
					</td>
				</tr>
				<tr bgcolor="white">
					<td>평가 점수 </td>
					<td>
						<input type="radio" name="score" value="10" />1 
						<input type="radio" name="score" value="20" />2 
						<input type="radio" name="score" value="30" />3 
						<input type="radio" name="score" value="40" />4 
						<input type="radio" name="score" value="50" />5 
						
					</td>
				</tr>

			</table>
		</form>
	</fieldset>
</body>
</html>