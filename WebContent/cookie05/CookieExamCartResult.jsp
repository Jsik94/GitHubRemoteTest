<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	private String getProductName(String code){
	
	
		return code.replace("product", "상품");
	}

 %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>장바구니 예제 : 장바구니에 담은 상품들</legend>
		<ul>
					
						    
			<%
				//요청 헤더에서 쿠키값 일기
				
				Cookie[] cookies = request.getCookies();
				
				//상품코드값을 담을 컬렉션
				List cart = new Vector();
				
				if(cookies!=null){
					for(Cookie atom : cookies){
						//쿠키명 얻기]
						String name = atom.getName();
						String val = atom.getValue();
						
						if(name.indexOf("product")!=-1){
							out.write(String.format("<li>%s %s</li>", getProductName(name), val));
						}
					}

				}
			
			%>
		</ul>
	</fieldset>
</body>
</html>