package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DataRoomDAO;
import model.FileUtils;

public class DownloadController extends HttpServlet{

	//다운로드는 브라우저가 제어하므로 
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		String filename = req.getParameter("filename");
		String no = req.getParameter("no");
		
		
		//Download 모델
		
		FileUtils.download(req, resp,filename, "/upload");
		
		DataRoomDAO dao = new DataRoomDAO(getServletContext());
		
		dao.updateDownCount(no);
		
		dao.close();
		
	}
	
}
