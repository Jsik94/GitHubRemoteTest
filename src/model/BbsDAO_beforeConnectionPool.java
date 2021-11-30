package model;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;

import com.sun.javafx.geom.Vec2d;

/*
 *  CRUD 작업이 가능한 로직을 만들어야함
 * 
 * 
 */
public class BbsDAO_beforeConnectionPool {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	

	public BbsDAO_beforeConnectionPool(ServletContext context) {
		
//		Path relativePath = Paths.get("");
//	    String path = relativePath.toAbsolutePath().toString();
//	    System.out.println("Working Directory = " + path);
//		
//		Properties p = new Properties();
//		try {
//			p.load(new FileReader("/resources/database.properties"));
//		} catch (FileNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
//	
//		String user = p.getProperty("id");
//		String password = p.getProperty("pw");
//		
//		System.out.println(user + " : " + password);
//		
		
//		InputStream is = context.getResourceAsStream("/WebContent/resources/database.properties");
//		Properties prop = new Properties();
//		
//		
//		try {
//			prop.load(is);
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
//		System.out.println("id : " + prop.get("id") + " pw: " + prop.get("pw"));
		//properties는 웹이라 구조가 좀다름
		//properties 설정 -> 반드시 class path에 위치시켜야함
		ResourceBundle resouce = ResourceBundle.getBundle("database"); // 확장자 제외할 것
		String username = resouce.getString("id");
		String password = resouce.getString("pw");
		
//		System.out.println("id : " + prop.get("id") + " pw: " + prop.get("pw"));
		try {
			
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			con = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),"JSP","JSP");
			System.out.println("연결 성공 !");
			
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}
	
	
	public void close() {
		
		try {
			
			if(psmt !=null) psmt.close();
			if(rs !=null) rs.close();
			if(con !=null) con.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
//	
//	public BBSDTO selectOne(String no,String prevPage) {
//		BBSDTO newone =null;
//		
//		
//		//트랜잭션이 필요한 case
//		
//		// 1. update 조회수 증가
//		// 2. select 내용 조회 
//		
//		try {
//			con.setAutoCommit(false);
//			String sql;
//			
//			
//			if(prevPage.toUpperCase().indexOf("LIST")!= -1) {
//				//이때만 1번 수행 
//				
//				sql = "UPDATE BBS SET VISITCOUNT = VISITCOUNT+1 WHERE no = ?";
//				
//				psmt = con.prepareStatement(sql);
//				psmt.setString(1, no);
//				psmt.executeUpdate();
//				
//				
//			}
//			
//			//레코드 조회
//			
//			sql = "SELECT B.*,M.NAME \r\n" + 
//					"FROM BBS B JOIN MEMBER M ON B.ID = M.ID"+
//					"WHERE no = ?";
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, no);
//			psmt.executeQuery();
//			
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			
//			try {
//				con.rollback();
//			} catch (SQLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//		}
//		
//		
//		return newone;
//	}
//	
	
	//맵쓰면 편함 
	public boolean isMember(String id,String pw) {
		
		String quary = "SELECT COUNT(*) FROM MEMBER WHERE ID = ? AND PWD = ?";
		try {
			psmt = con.prepareStatement(quary);
			
			
			psmt.setString(1,id);
			psmt.setString(2,pw);		
			
			rs = psmt.executeQuery();
			
			rs.next();
			
			if(rs.getInt(1) ==0 ) {
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		
		return true;
	}
	
	
	
	public int insert(BBSDTO dto) {
		int affected = 0;
		System.out.println(dto.toString());
		String quary = "INSERT INTO BBS(no,id,title,content) VALUES (SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			
			//generateKey 자동되는 primary key만 반환 
			//근데 오라클은 안댐 
			
			//입력된 행의 키값 가져올때 오라클에서는 index 번호배열 혹은 String으로 칼럼명으로 파싱한다. (= new int[]{1})
			psmt = con.prepareStatement(quary, new String[] {"no"});
			
			
			
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getTitle());		
			psmt.setString(3,dto.getContent()); 
			affected= psmt.executeUpdate();
			rs = psmt.getGeneratedKeys();
			System.out.println(rs);
			if(rs.next()) {
				//컬럼명써도됨rs.getLong("no");
				System.out.println("키 값 (no): " + rs.getLong(1));
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		
		
		
		return affected;
	}
	
	
//	
//	//전체 목록 로드
//	//페이징
//	// 전체 목록 쿼리를 구간쿼리로 변경
//	// 총 레코드 수 구하는 메소드 추가
//	public List<BBSDTO> selectList(){
//		System.out.println("시작");
//		List<BBSDTO> list = new Vector<>();
//		
//		String sql = "SELECT B.*,M.NAME \r\n" + 
//				"FROM BBS B JOIN MEMBER M ON B.ID = M.ID\r\n" + 
//				"ORDER BY NO DESC;";
//		try {
//			psmt = con.prepareStatement(sql);
//			rs = psmt.executeQuery();
//			BBSDTO newone = new BBSDTO();
//			while(rs.next()) {
//				newone.setNo(rs.getString(1));
//				newone.setId(rs.getString(2));
//				newone.setContent(rs.getString("content"));
//				newone.setTitle(rs.getString("Title"));
//				newone.setName(rs.getString("name"));
//				newone.setVisitCount(rs.getString("visitcount"));
//				newone.setPostDate(rs.getDate("postdate"));
//				list.add(newone);
//			}
//			System.out.println(list);	
//			return list;
//		}catch(SQLException e) {
//			
//		}
//		
//		
//		
//		
//		return null;
//		
//	}
	
	
	// 구간쿼리 
	//총레코드 수 
	public List<BBSDTO> selectList(Map map){
		List<BBSDTO> list = new Vector<>();
		
		try {
			String sql="SELECT * FROM ( SELECT T.*,ROWNUM as R FROM ( SELECT B.*,NAME FROM BBS B JOIN MEMBER M ON B.ID = M.ID ";
			
			if(map.get("searchColumn")!=null) {
				sql += " WHERE "+ map.get("searchColumn") + " LIKE '%"+map.get("searchWord")+"%' ";
			}
			
			sql+=" ORDER BY NO DESC) T ) WHERE R BETWEEN ? AND ?";
			System.out.println(sql);
			psmt = con.prepareStatement(sql);
			
			System.out.println("start : "+map.get("start").toString());
			System.out.println("end : "+map.get("end").toString());
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				BBSDTO dto = new BBSDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(7));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitCount(rs.getString(5));
				list.add(dto);
				System.out.println(dto.toString());
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return list;
	}////selectList
	
	
	
	
	public int getTotalRowCount(Map map) {
		int totalRowCount = 0;
		
		String sql = "SELECT COUNT(*) FROM BBS B JOIN MEMBER M ON B.ID = M.ID ";
		
		//검색 적용 코드 
		if(map.get("searchColumn")!=null) {
			sql += " WHERE "+ map.get("searchColumn") + " LIKE '%"+map.get("searchWord")+"%' ";
		}
		
		try {
			
			psmt= con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			totalRowCount= rs.getInt(1);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("총 갯수는 " + totalRowCount + " 입니다!");
		return totalRowCount;
	}
	
	
	
// 전체 목록 쿼리 페이징 이전
//	public List<BBSDTO> selectList(){
//		List<BBSDTO> list = new Vector<>();
//		String sql="SELECT b.*,name FROM bbs b JOIN member m ON m.id = b.id ORDER BY no DESC";
//		try {
//			psmt = con.prepareStatement(sql);
//			rs=psmt.executeQuery();
//			while(rs.next()) {
//				BBSDTO dto = new BBSDTO();
//				dto.setContent(rs.getString(4));
//				dto.setId(rs.getString(2));
//				dto.setName(rs.getString(7));
//				dto.setNo(rs.getString(1));
//				dto.setPostDate(rs.getDate(6));
//				dto.setTitle(rs.getString(3));
//				dto.setVisitCount(rs.getString(5));
//				list.add(dto);
//			}
//		}
//		catch(SQLException e) {e.printStackTrace();}
//		
//		return list;
//	}////selectList
//	

	
	public BBSDTO selectOne(String no,String prevPageName) {
		BBSDTO dto=null;
		try {
			con.setAutoCommit(false);
			String sql;
			
			//목록에서 넘어온 경우에만 조회수 증가
			if(prevPageName.toUpperCase().indexOf("LIST") != -1) {
				//조회수 업데이트
				sql="UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, no);
				psmt.executeUpdate();
			}
			//레코드 하나 조회
			sql="SELECT b.*,name FROM bbs b JOIN member m ON m.id = b.id WHERE no=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new BBSDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(7));
				dto.setNo(rs.getString(1));
				dto.setPostDate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitCount(rs.getString(5));
			}
			con.commit();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			}
			catch(SQLException e1) {e1.printStackTrace();}
		}
		
		return dto;
	}//////selectOne
	
	
	
	public Map<String,BBSDTO> prevNext(String no){
		
		 Map<String,BBSDTO>	map = new HashMap<>();
		 
		
		 
		 try {
			 String sql = "SELECT NO,TITLE FROM BBS WHERE NO = (SELECT MIN(NO) FROM BBS WHERE NO > ?)";
			 
			 psmt = con.prepareStatement(sql);
			 psmt.setString(1, no);
			 rs = psmt.executeQuery();
			 
			 
			 if(rs.next()) {
				 
				 BBSDTO dto = new BBSDTO();
				 dto.setId(rs.getString(1));
				 dto.setTitle(rs.getString(2));
				 
				 map.put("PREV", dto);
				 
			 }
			 sql = "SELECT NO,TITLE FROM BBS WHERE NO = (SELECT MAX(NO) FROM BBS WHERE NO < ?)";
			 
			 psmt = con.prepareStatement(sql);
			 psmt.setString(1, no);
			 rs = psmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 BBSDTO dto = new BBSDTO();
				 dto.setId(rs.getString(1));
				 dto.setTitle(rs.getString(2));
				 
				 map.put("NEXT", dto);
				 
				 
				 
			 }
			 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }
		 
		 
		 
		 return map;
		 
		 
	}
	
	
	public int update(BBSDTO dto) {
		
		int affect =-1 ;
		System.out.println("게시판넘버 --->"+dto.getNo());

		System.out.println(dto.getContent());
		System.out.println(dto.getNo());
		try {

//			String sql = "UPDATE BBS SET TITLE= '"+dto.getTitle()+"', CONTENT='"+dto.getContent().trim()+"' WHERE NO = "+dto.getNo();
			String sql2 = "UPDATE BBS SET TITLE= ?, CONTENT=? WHERE NO = ?";

			System.out.println(sql2);
			psmt = con.prepareStatement(sql2); 	
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent().trim());
			psmt.setString(3, dto.getNo());
			
			affect =  psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
	
		}
		
		
		
		return affect ;
	}
	
	
	public void delete(String no) {


		try {


			String sql = "DELETE FROM BBS WHERE NO = ?";
			System.out.println(sql);
			psmt = con.prepareStatement(sql); 	
			psmt.setString(1, no);
			
			psmt.execute();
			System.out.println("삭제 완료~~");
		}catch(SQLException e) {
			e.printStackTrace();
	
		}
		
		
		return;
		
		
	}
	
	
}
