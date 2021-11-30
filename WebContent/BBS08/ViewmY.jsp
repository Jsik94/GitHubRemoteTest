<%@page import="model.BBSDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/common/isMember.jsp"%>

<% 


	String no = request.getParameter("no");
	
	BbsDAO dao = new BbsDAO(application);
	
	
	String referer = request.getHeader("referer");
	out.println(referer);

	String prevPage = "";
	
	
	BBSDTO dto = dao.selectOne(no,prevPage);


%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Write.jsp</title>

<link href="<%=request.getContextPath()%>/css/layout.css"
   rel="stylesheet" />



</style>
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
                        <td width="30%" align="center">작성자</td>
                        <td style="padding: 5px">홍길동</td>
                     </tr>
                     <tr bgcolor="white">
                        <td align="center">작성일</td>
                        <td style="padding: 5px">2021-12-12</td>
                     </tr>
                     <tr bgcolor="white">
                        <td align="center">조회수</td>
                        <td style="padding: 5px">34</td>
                     </tr>
                     <tr bgcolor="white">
                        <td align="center">제목</td>
                        <td style="padding: 5px">제목입니다</td>
                     </tr>
                     <tr bgcolor="white">
                        <td align="center">내용</td>
                        <td style="padding: 5px">내용입니다</td>

                     </tr>
                     <tr bgcolor="white" align="center" style="height:50px">
                        <td colspan="2">
                        
                        	<% 
                        	
                        	if(dto.getId().equals(session.getAttribute("USER_ID"))){
                        		
                        		
                        		
                        	%>
                        	
                     		   수정 | 삭제 | 
                     		   
                     		<%
                        		}
                     		%>   
                     		   
                     		   <a href="List.jsp">목록</a>
                        
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