package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetController extends HttpServlet{
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Destroyed");
		
		
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Life-Cycle is ON");
		
	}
	
	
	
	


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);//부모에서 post get 판별해줌
		System.out.println("서블릿의 service()");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		req.setAttribute("method_get", "GET방식 요청 입니다");
		
		req.getRequestDispatcher("/servlet13/Servlet.jsp").forward(req, resp);
		
	}
	
	
}
