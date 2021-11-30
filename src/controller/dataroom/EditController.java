package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.DataRoomDAO;
import model.DataRoomDTO;
import model.FileUtils;

public class EditController extends HttpServlet{
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(req, resp);
		

		//mode 로 분기 한다. view에서 왔단 얘기임 
		
		System.out.println("이전 URL : " + req.getHeader("referer"));
		
		if(req.getParameter("mode")!=null) {
			
			String no = req.getParameter("no");
			String mode = req.getParameter("mode");
			String originalFilename = req.getParameter("originalFilename");
			String password = req.getParameter("password");
			
			DataRoomDAO dao = new DataRoomDAO(getServletContext());
			DataRoomDTO dto = dao.selectOne(no);
			dao.close();
			req.setAttribute("record", dto);
			req.getRequestDispatcher("/dataroom14/Edit.jsp").forward(req, resp);
		}else {
			
			
			
			req.setCharacterEncoding("UTF-8");
			
			MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/upload"));
			//MultipartRequest 생성시 req의 모든 파라미터를 가로채서 포워드시켰을 때 잡히지가 않는다. 
			//따라서 리퀘스트를 해야함
			
			
			
			System.out.println("mr addr: " + mr);
			//DB 수정-> 성공 1 실패 0 , 파일 용량 추가는 -1
			int successOrFail;
			
			if(mr!=null) {
				//파일 업로드가 성공했으므로 

				String no = req.getParameter("no");
				String name = mr.getParameter("name");
				String title = mr.getParameter("title");
				String password = mr.getParameter("password");
				String content = mr.getParameter("content");			
				String attachfile = mr.getFilesystemName("attachfile");
				String originalFilename = req.getParameter("originalFilename");
				
				//파라미터를 속성으로변환하여 저장
				req.setAttribute("no", no);
				req.setAttribute("originalFilename", originalFilename);
				
				//attachfile로 수정시 업로드가 되었는지 되지 않았는지 확인해야됨
				
				if(attachfile==null) {
					attachfile =originalFilename;
				}else {
					
					
				}
				
				DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
				DataRoomDTO dto = new DataRoomDTO();
				
				dto.setNo(Integer.parseInt(no));
				dto.setName(name);
				dto.setTitle(title);
				dto.setPassword(password);
				dto.setContent(content);
				dto.setAttachfile(attachfile);
				
				
				successOrFail = dao.update(dto);
				dao.close();
				
				//데이터 수정 실패 시 업로드된 파일 삭제 ( 삽입이 성공하고, 데이터가 변경되었을때만  기존파일을 지우면된다.)
				if(successOrFail==1 && mr.getFilesystemName("attachfile")!=null ) {
					// ??? 그럼 이전파일을 지워야되는거 아닌가 ?? attacfile이면 
					FileUtils.deleteFile(req, "/upload",originalFilename);
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

	/*
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		String no = req.getParameter("no");
		String mode = req.getParameter("mode");
		String originalFilename = req.getParameter("originalFilename");
		String password = req.getParameter("password");

		DataRoomDAO dao = new DataRoomDAO(getServletContext());
		
		
		DataRoomDTO dto = dao.selectOne(no);
		dao.close();
		
		if(dto ==null) {
			//데이터 가져오기 실패 // 그럴일은 없겠지만
			
			
		}else{
			//데이터를 잘 가져왔다면
			req.setAttribute("record", dto);
			req.getRequestDispatcher("/dataroom14/Edit.jsp").forward(req, resp);
			
		}
		
		

		
	}
	*/

}
