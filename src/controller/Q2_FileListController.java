package controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class Q2_FileListController extends HttpServlet{
	
	public static void mkDir(String saveDir) {

		File folder = new File(saveDir);
		if (!folder.exists()) {
			try {
				folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
			return;
		}

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		int maxPostSize = 1024*500; //500KB
		String encoding = "UTF-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		String realpath = req.getServletContext().getRealPath("StudyResource/second_study_data");
		String saveDirectory = realpath+"/upload/";
		MultipartRequest mr = null;
		String name = null;
		String title = null;
		String inter = null;
		File file1 = null;
		
		try{
			
			//디렉토리 생성
			mkDir(saveDirectory);
			
			
			//4]MultipartRequest 객체 생성
			mr = new MultipartRequest(req,saveDirectory,maxPostSize,encoding,policy);
			//encording
			req.setCharacterEncoding("UTF-8");
			name = mr.getParameter("name");
			title = mr.getParameter("title");
			inter = Arrays.toString(mr.getParameterValues("inter"));
			file1 = mr.getFile("attachedFile1");
			req.setAttribute("name",name);
			req.setAttribute("title",title);
			req.setAttribute("inters",inter);
			req.setAttribute("filename",file1.getName());
			req.setAttribute("filesize",file1.length());
		}catch(IOException e){
			e.printStackTrace();
			req.setAttribute("error", "업로드 용량을 초과하였습니다.");
			req.getRequestDispatcher("/StudyResource/second_study_data/Q1_upload.jsp").forward(req, resp);
		}
		

		RequestDispatcher rs =  req.getRequestDispatcher("/StudyResource/second_study_data/Q2_FileList.jsp");
		
		rs.forward(req, resp);
		
		
	}

}
