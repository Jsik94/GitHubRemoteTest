package elTag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.PageContext;

import model.BBSDTO;
import model.BbsDAO;

//xml에 기재된 함수와 매핑될 실제 함수
//xml에 반드시 class를 기재해줘야함 
//public static으로 정의해야 한다.
//반드시 출력해야하므로 반환갑이 존재해야한다.
public class MyTagLib {

	/*
	 * 반드시 퍼플릭static 선언 
	 */
	
	//[문자열이 숫자 형식이면 true,아니면 false반환]
	public static boolean isNumber(String value) {
		for(int i=0;i < value.length();i++) {
			if(!(value.codePointAt(i) >='0' && value.codePointAt(i) <='9'))
				return false;
		}
		return true;
	}//////
	
	
	
	/*
	 * 주민번호 예]123456-1234567
	    9 : 1800 ~ 1899년에 태어난 남성
		0 : 1800 ~ 1899년에 태어난 여성
		1 : 1900 ~ 1999년에 태어난 남성
		2 : 1900 ~ 1999년에 태어난 여성
		3 : 2000 ~ 2099년에 태어난 남성
		4 : 2000 ~ 2099년에 태어난 여성
		5 : 1900 ~ 1999년에 태어난 외국인 남성
		6 : 1900 ~ 1999년에 태어난 외국인 여성
		7 : 2000 ~ 2099년에 태어난 외국인 남성
		8 : 2000 ~ 2099년에 태어난 외국인 여성	
	 */
	public static String getGender(String ssn) {
		int beginIndex = ssn.indexOf("-")+1;
		int endIndex = beginIndex+1;
		String gender = ssn.substring(beginIndex, endIndex);
		switch(Integer.parseInt(gender)) {
			case 1:
			case 3:
			case 9:return "남성";
			case 0:
			case 2:
			case 4:return "여성";
			case 5:
			case 7:return "외국인 남성";
			case 6:
			case 8:return "외국인 여성";
			default:return "유효하지 않은 주민번호입니다";
			
		}
	}/////////////
	
	public static String isMemeber(String id,String pw,PageContext page) {
		
		BbsDAO dao = new BbsDAO(page.getServletContext());
		//리턴을 안하는 이유 close 해줘야함
//		return dao.isMember(id, pw) ? (id+"님 반갑습니다<br/>") : "로그인후 이용하세요<br/>";
		
		if(dao.isMember(id, pw)) {
			dao.close();
			return id+"님 반갑습니다<br/>";
		}
		dao.close();
		return "로그인후 이용하세요<br/>";
		
	}
	
	//게시판 글가져오는 tag source
	public static List<BBSDTO> getBBS(String start,String end, PageContext page){
		
		List<BBSDTO> list = null;
		
		BbsDAO dao = new BbsDAO(page.getServletContext());
		
		Map map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		
		list =dao.selectList(map);
		dao.close();
		
		return list;
		
	}
	
	
}
