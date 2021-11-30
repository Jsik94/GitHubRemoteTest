
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="IncludePage.jsp" %>
<fieldset style="padding: 10px">
							<legend>로그인 페이지</legend>
							<span style="color: red; font-weight: bold"><%= request.getAttribute("NOT_LOGIN") ==null ? "":request.getAttribute("NOT_LOGIN") %></span>
							<form method="post" action="LoginProcess.jsp">
								<table	style="width: 300px; border-spacing: 1px; background-color: green">
									<tr style="background-color: white">
										<td style="width: 25%">아이디</td>
										<td style="padding-left: 5px">
											<input type="text"	name="user" 
											value = '<%=request.getAttribute("USER_ID") %>' />
										</td>
									</tr>
									<tr style="background-color: white">
										<td>비밀번호</td>
										<td style="padding-left: 5px">
											<input type="password" name="pass"
											value = '<%=request.getAttribute("USER_PASS") %>'/ >
										</td>
									</tr>
									<tr style="background-color: white; text-align: center">
										<td colspan="2"><input type="submit" value="로그인" /></td>
									</tr>
								</table>
							</form>
						</fieldset>