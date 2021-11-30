<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>자바로 웹 스크래핑하기</title>
	
</head>
<body>
	<fieldset>
		<legend>스크래피</legend>
		<h2>https://www.jsoup.org</h2>
	</fieldset>
	<%
	Document doc = Jsoup.connect("https://en.wikipedia.org/").get();
	out.println("<h3>"+doc.title()+"</h3>");
	Elements newsHeadlines = doc.select("#mp-itn b a");
	
	out.println("<ul>");
	for (Element headline : newsHeadlines) {
		out.println("<li>");
	 	out.println(String.format(" <a href='%s'> %s </a>", headline.absUrl("href"),headline.attr("title")));
	  	out.println("</li>");
	}
	

	out.println("</ul>");
	
	%>
	
	
	<h2 >네이버 영화, 랭킹 스크랩하기 (조회하기)</h2>
	
	<%
		String targetURL = "https://movie.naver.com/movie/sdb/rank/rmovie.naver";
		doc = Jsoup.connect(targetURL).get();

		out.println("<h3>"+doc.title()+"</h3>");
	
		System.out.println(doc.html());
		Elements infos = doc.select("#old_content > table > tbody > tr > td.title > div > a");
		
		
		int limit = 10 ;
		out.println("<ul>");
		for (Element info : infos) {
			if(--limit <0){
				break;
			}
			out.println("<li style='list-style: lower-roman;'>");
		 	out.println(String.format(" <a href='%s'>%s</a> --> %s", info.absUrl("href"),info.attr("title"),info.html()));
		  	out.println("</li>");
		}
		

		out.println("</ul>");
		

		
		//Elements myTests = doc.select("#old_content > div.tab_type_6 > ul > li > a");
		
	%>
	


</body>
</html>