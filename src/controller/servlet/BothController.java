package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BothController extends HttpServlet{

	
	//하나의 컨트롤러로 두가지 방식의 요청을 처리하기
	
	// sol1] service 호출하여 잡기 
	/*@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(req, resp);
		
		req.setAttribute("method_both",req.getMethod()+"방식");
		
		req.getRequestDispatcher("/servlet13/Servlet.jsp").forward(req, resp);
	}
	*/
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		doGet(req, resp);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		req.setAttribute("method_both",req.getMethod()+"방식");
		
		req.getRequestDispatcher("/servlet13/Servlet.jsp").forward(req, resp);
		
	}
	
	

}
