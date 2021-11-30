package controller.dataroom;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DataRoomDAO;
import model.FileUtils;

public class PasswordController extends HttpServlet {

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	super.doPost(req, resp);
		
		
		req.setCharacterEncoding("UTF-8");
		
		
		String no = req.getParameter("no");
		String mode = req.getParameter("mode");
		String originalFilename = req.getParameter("originalFilename");
		String password = req.getParameter("password");
		
		
		System.out.println("모드 : " + mode );
		
		
		DataRoomDAO dao = new DataRoomDAO(getServletContext());
		boolean flag = dao.isCorrectPassword(no,password);
		
		dao.close();
		
		
		if(!flag) {
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = resp.getWriter();
			pw.println("<script>");
			pw.println("alert('비밀번호가 일치하지 않습니다!'");
			pw.println("history.back();");
			pw.println("</script>");
			return;
		}
		
		if(mode.equals("UPDATE")) {
			req.getRequestDispatcher("/dataroom/Edit.kosmo").forward(req, resp);
			
			
			
			
		}else {
			//db 삭제
			dao = new DataRoomDAO(getServletContext());
			int succOrfail = dao.delete(no);
			dao.close();
			//파일 삭제
			if(succOrfail ==1) {
				FileUtils.deleteFile(req, "/upload", originalFilename);
			}
			
			req.setAttribute("SUCCFAIL", succOrfail);
			req.getRequestDispatcher("/dataroom14/Message.jsp").forward(req, resp);
		}
		
		
		
	}
}
