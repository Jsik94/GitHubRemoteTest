package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DataRoomDAO;
import model.DataRoomDTO;

public class ViewController extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(arg0, arg1);
		String no = req.getParameter("no");
		
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		DataRoomDTO dto = dao.selectOne(no);
		
		System.out.println(dto.getContent().replace("\r\n", "<br/>"));
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		
		req.setAttribute("record", dto);
		
		req.getRequestDispatcher("/dataroom14/View.jsp").forward(req, resp);
		
		dao.close();
		
	}
	
}
