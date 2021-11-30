package controller.dataroom;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DataRoomDAO;
import model.DataRoomDTO;
import model.PagingUtil;



//1] 사용자 요청을 받을 수 있도록 서블릿 클래스로 만들기 즉, 컨트롤러 만들기


public class ListController extends HttpServlet{

/*2]사용자 요청이 GET방식이면 doGet(),POST방식이면 doPost() 오버라이딩
	
	※GET 및 POST방식을 구분하지 않고 요청을 받으려면
	service()를 오버라이딩 하거나
	혹은 위의 두 메소드 즉 doGet() ,doPost()를 오버라이딩해서
	한쪽 메소드에서 받은 요청을 다른 쪽으로 전달하면 된다.
	예]
	@Override
	protected void doPost(HttpServletRequest req,
			              HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}///////////////////////////////////
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 컨트롤러(서블릿)이 할일을 구현
	}
	*/
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(req, resp);
		

		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		
		//페이징 --
		int totalRowCount = dao.getTotalRowCount();
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		int blockPage=Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));;
		int totalPage = (int)Math.ceil((double)totalRowCount/pageSize);
		
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;

		Map map = new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		
		//페이징 --
		//요청을 받고
		//컨트롤(분석, 필요에 따라 모델사용)
	
		List<DataRoomDTO> records =  dao.selectList(map);
		
		System.out.println("List Current status : totalRowCount -> " + totalRowCount);
		System.out.println("pageSize -> " + pageSize);
		System.out.println("blockPage -> " + blockPage);
		System.out.println("nowPage -> " + nowPage);
		System.out.println("Start : " + start + " End : " + end);
		String pagingSrc=PagingUtil.pagingBootStrapStyle(totalRowCount, pageSize, blockPage, nowPage, "/dataroom/List.kosmo");
		System.out.println("Set Paging");
		System.out.println(pagingSrc);
		req.setAttribute("records", records);
		req.setAttribute("pagingSrc", pagingSrc);
		req.setAttribute("totalRowCount", totalRowCount);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageSize", pageSize);
		
		//결과값을 뿌려줄 뷰를 선택후 포워딩
		dao.close();
		
		System.out.println("Put records in RequestScope cnt"+records.size());
		req.getRequestDispatcher("/dataroom14/List.jsp").forward(req, resp);
		
	}
	
	
}/////////////////////////ListController
