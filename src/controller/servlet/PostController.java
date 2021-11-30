package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostController extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		req.setCharacterEncoding("UTF-8");
		String name =req.getParameter("username");
		String pass = req.getParameter("password");
		

		req.setAttribute("method_post", "POST방식요청입니다. 아이디 : "+name +" 비밀번호 : " +pass);

		req.getRequestDispatcher("/servlet13/Servlet.jsp").forward(req, resp);
		
	}
}
