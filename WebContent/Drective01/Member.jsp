<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="IncludePage.jsp" %>




<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Member.jsp</title>
<link href="../css/layout.css" rel="stylesheet">
</head>
<script src="../js/validate.js"></script>
<body>

  <div class="wrap">
    <div class="header">
     
      <div class="logo"><img src="../images/logo.jpg" alt="회사 로고 이미지"/></div>
      <div class="topMenu">
      
		<%@ include file ="/template/Top.jsp"%>
      </div>
    </div>
  
    
    <div class="content">
      <div class="aside">
        
		<%@ include file ="/template/Top.jsp"%>
      </div>
      <div class="main">
        <h2>회원가입(<%=currentPage %>)</h2>
            
            <form name="frmObj" action="MemberComplete.jsp" method="post" onsubmit="return isValidate(this);">
      <table style="width:75%;border-spacing:1px;background-color:green">
          <tr style="background-color:white">
              <td>아이디</td>
              <td><input type="text" name="id" size="20" /> <span style="color:red;font-size:0.8em" id="idError"></span></td>
          </tr>
          <tr style="background-color:white">
              <td>비밀번호</td>
              <td><input type="password" name="pwd" size="20" /></td>
          </tr>
          <tr style="background-color:white">
              <td>비밀번호확인</td>
              <td><input type="password" name="pwd2" id="pwd2" size="20" /></td>
          </tr>
          <tr style="background-color:white">
              <td>성별</td>
              <td>
                  <input type="radio" name="gender" value="man" />남
                  <input type="radio" name="gender" value="woman" />녀
                  <input type="radio" name="gender" value="trans" />트랜스젠더
              </td>
          </tr>
          <tr style="background-color:white">
              <td>관심사항</td>
              <td>
                  <input type="checkbox" name="inter" value="pol" />정치
                  <input type="checkbox" name="inter" value="eco" />경제
                  <input type="checkbox" name="inter" value="spo" />스포츠
                  <input type="checkbox" name="inter" value="ent" />연예
              </td>
          </tr>
          <tr style="background-color:white">
              <td>학력사항</td>
              <td>
                  <select name="grade">
                      <option value="">==학력을 선택하세요==</option>
                      <option value="ele">초등학교</option>
                      <option value="mid">중학교</option>
                      <option value="hig">고등학교</option>
                      <option value="uni">대학교</option>
                  </select>
              </td>
          </tr>
          <tr style="background-color:white">
              <td>첨부파일</td>
              <td>
                  <input type="file" name="file" size="40" />
              </td>
          </tr>
          <tr style="background-color:white">
              <td>자기소개</td>
              <td>
                  <textarea cols="60" rows="5" name="self"></textarea>
              </td>
          </tr>
          <tr style="background-color:white">
              <td colspan="2" align="center">
                              <input type="submit" style="height:50px" value="submit버튼" title="type=submit" />
              </td>
          </tr>
      </table>
  </form>
            
      </div>
    </div>
    <div class="footer">
    <!-- html에서 태그걸때는 프로젝트명(context root)까지 필요함  -->
        <%@ include file = "/template/Footer.jsp" %>
    </div>
  </div>
</body>
</html>