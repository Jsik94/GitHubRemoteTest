<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr/>
<h2>삽입된 이미지</h2>

<ul>
				<li>Param 1: <%=pageContext.getAttribute("param1") %></li>
				<li>Param 2: <%=pageContext.getAttribute("param2") %></li>
				<li>Param 3: <%=pageContext.getAttribute("param3") %></li>
				<li>Param 4: <%=pageContext.getAttribute("param4").toString() %></li>
			
			
</ul>