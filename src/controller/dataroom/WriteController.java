package controller.dataroom;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.DataRoomDAO;
import model.DataRoomDTO;
import model.FileUtils;

public class WriteController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		
		req.getRequestDispatcher("/dataroom14/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/upload"));
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
		String fname = mr.getParameter("name");
		String ftitle = mr.getParameter("title");
		String fpath = this.getServletContext().getRealPath("/upload");
		System.out.println(fpath);
		//DB -> 성공 1 실패 0 파일 용량 추가는 -1
		int successOrFail;
		
		if(mr!=null) {
			//파일 업로드가 성공했으므로 
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String password = mr.getParameter("password");
			String content = mr.getParameter("content");			
			String attachfile = mr.getFilesystemName("attachfile");
			
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = new DataRoomDTO();
			
			dto.setName(name);
			dto.setTitle(title);
			dto.setPassword(password);
			dto.setContent(content);
			dto.setAttachfile(attachfile);
			
			
			successOrFail = dao.insert(dto);
			dao.close();
			
			if(successOrFail==0) {
				FileUtils.deleteFile(req, "/upload",attachfile);
			}
			
			
		}else{
			successOrFail = -1;
		}
		
		//결과값이나 필요한값을 저장해서 이전페이지를 인지할수 있게 함
		req.setAttribute("SUCCFAIL", successOrFail);
		//다음과 같이 정의 INS입력 EDT 수정 DEL 삭제
		req.setAttribute("WHERE","INS");
		System.out.println("Write Code : " + successOrFail);
		//req.getRequestDispatcher("/dataroom14/List.kosmo").forward(req, resp);
		
		//메시지를 뿌려주는 JSP만 만듦 ( UI X)
		req.getRequestDispatcher("/dataroom14/Message.jsp").forward(req, resp);
	}
	
	
	
}
