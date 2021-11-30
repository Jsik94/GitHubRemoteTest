package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MultiController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		String logic = req.getParameter("crud");
		String msg;
		
		switch(logic) {
		
			case "create":
				msg = "입력처리 요청입니다.";
				
			break;
			case "read":
				msg = "조회처리 요청입니다.";
			
			break;		
			case "update":
				msg = "수정처리 요청입니다.";
			
			break;		
			default:
				msg = "삭제처리 요청입니다.";
			
			break;
		
		}
		
		req.setAttribute("crud_msg", msg);
		
		req.getRequestDispatcher("/servlet13/Servlet.jsp").forward(req, resp);
		
		
	}
	
	
}
