package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.Janso_Boards;
import vo.JspfileIp;

import java.sql.PreparedStatement;





public class Co_Controller {
	
	
	JspfileIp jip = new JspfileIp();
	String ip = jip.ipcheck();
	String id = jip.id();
	String pw = jip.pw();
	
	DataSource ds;
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	String forname = "com.mysql.cj.jdbc.Driver";

	public void conn()
	{
		try
		{
		  conn = DriverManager.getConnection("jdbc:mysql://"+ip+":3306/learnup?useUnicode=true&characterEncoding=utf8",id,pw);
		}catch (Exception s) {
			// TODO: handle exception
		}
		
	}
	public void diconn() 
	{
		try {
			conn.close();
			stmt.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO �옄�룞 �깮�꽦�맂 catch 釉붾줉
			e.printStackTrace();
		}
	}
	public Co_Controller()
	{
		conn();
	}
	
	
	//페이징처리를위한 작업
	public int selectListCount() {
		pstmt = null;
		rs = null;
		int listCount= 0;
		String sql = "select count(*) from boards";	

		
		try{
		Class.forName(forname);
		conn();
	    if(conn == null)
	    {
	    	throw new Exception("nooooo");
	    }
	    	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	   
		if(rs.next()){
			listCount=rs.getInt(1);
		}
	      
		}catch (Exception e) {
		
		}finally {
			try {
					
				diconn();
					
			} catch (Exception ignored) {
					
			}
		}
		return listCount;
	}
	
	
	
		
	public void board_insert(String emails , String titles, String writes,String check ,String fileName ,String fileRealName  )
	{	
		
		try{

			Class.forName(forname); //�븘臾닿쾬�룄�뾾�씠 �뾾�씠�븯硫� �씠寃� �뿉�윭媛��궃�떎 �꽕�젙�씠 �븘�슂
			conn();
			System.out.println("mysql connection success");
			String s = String.format("insert into boards(title,writes,email,open_check,fileName,fileRealName)values('%s','%s','%s','%s','%s','%s')",titles,writes,emails,check,fileName,fileRealName);
			stmt = conn.createStatement();	
			stmt.executeUpdate(s);  
		
 		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				
			diconn();
				
			} catch (Exception e2) {
				System.out.println("jjjj");
			}
		}

	}
	
	//寃뚯떆湲� �궘�젣
	public void board_deleate(String a)
	{	

		try{

			Class.forName(forname); //�븘臾닿쾬�룄�뾾�씠 �뾾�씠�븯硫� �씠寃� �뿉�윭媛��궃�떎 �꽕�젙�씠 �븘�슂
			conn();
			System.out.println("mysql connection success");
			String s = "delete from boards where board_id='"+a+"';";
			stmt = conn.createStatement();	
			stmt.executeUpdate(s);  
			
 		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				
			diconn();
				
			} catch (Exception e2) {
				System.out.println("�븞�뤌 吏쒖떇�븘");
			}
		}
	}
	
	//寃뚯떆湲� �닔�젙
		public void board_update(String num, String title, String wirites)
		{	

			try{

				Class.forName(forname); //�븘臾닿쾬�룄�뾾�씠 �뾾�씠�븯硫� �씠寃� �뿉�윭媛��궃�떎 �꽕�젙�씠 �븘�슂
				conn();
				System.out.println("mysql connection success");
				String s = "update boards set title ='"+title+"', writes ='"+wirites+"'  where board_id='"+num+"';";
				stmt = conn.createStatement();	
				stmt.executeUpdate(s);  
				
	 		}
			catch (Exception e) {
				System.out.println(e);
			}
			finally {
				try {
					
				diconn();
					
				} catch (Exception e2) {
					System.out.println("�븞�뤌 吏쒖떇�븘");
				}
			}
		}
	
	//셀렉 페이징
	public ArrayList<Janso_Boards> boardselect(int startpage,int pageSize) {
		pstmt = null;
		rs = null;
		String sql = "select * from boards order by board_id desc limit ?,?";	
		ArrayList<Janso_Boards> list = new ArrayList<Janso_Boards>();
		int startrow=(startpage-1)*10; 
		
		try{
		Class.forName(forname);
		conn();
	    if(conn == null)
	    {
	    	throw new Exception("nooooo");
	    }
	    
	   		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startrow); //시작행-1 (시작 row 인덱스 번호)
		pstmt.setInt(2, pageSize); // 페이지크기 (한번에 출력되는 수)
		
		rs = pstmt.executeQuery();
	   // rs = stmt.executeQuery("select * from boards order by board_id desc, desc limit -1,3");
	    while(rs.next())
	    {  
	    	Janso_Boards vo = new Janso_Boards();
	    	
	    	vo.setBoard_id(rs.getInt("board_id"));
			vo.setTitle(rs.getString("title"));
			vo.setEmail(rs.getString("email"));
			vo.setWrites(rs.getString("writes"));
			vo.setDate(rs.getString("date"));
			vo.setOpen_check(Integer.parseInt(rs.getString("open_check")));
	
			
			list.add(vo);

	    }
	      
		}catch (Exception e) {
		
		}finally {
			try {
					
				diconn();
					
			} catch (Exception ignored) {
					
			}
		}
		return list;
	}
	
	//寃뚯떆湲� 媛쒕퀎���젆	
	public Janso_Boards boardselect2(String board_id) {
			
			Janso_Boards vo = new Janso_Boards();
			int a = Integer.parseInt(board_id);
			try{
			Class.forName(forname);
			conn();
		    if(conn == null)
		    {
		    	throw new Exception("nooooo");
		    }
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("select * from boards where board_id ='"+ a + "';");
		    while(rs.next())
		    {  
		    	vo.setBoard_id(rs.getInt("board_id"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setWrites(rs.getString("writes"));
				vo.setDate(rs.getString("date"));
				vo.setOpen_check(Integer.parseInt(rs.getString("open_check")));
				vo.setFileName(rs.getString("fileName"));
			
		    }
		      
			}catch (Exception e) {
			
			}finally {
				try {
						
					diconn();
						
				} catch (Exception ignored) {
						
				}
			}
			return vo;
		}
	
	
	//寃뚯떆湲� 寃��깋
	public ArrayList<Janso_Boards> boardsearch(String search) {
		
		ArrayList<Janso_Boards> list = new ArrayList<Janso_Boards>();
		System.out.println(search);
		try{
		Class.forName(forname);
		conn();
	    if(conn == null)
	    {
	    	throw new Exception("nooooo");
	    }
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery("select * from boards where title like '%"+search+ "%'order by board_id desc;");
	    while(rs.next())
	    {  
	    	Janso_Boards vo = new Janso_Boards();
	    	
	    	vo.setBoard_id(rs.getInt("board_id"));
			vo.setTitle(rs.getString("title"));
			vo.setEmail(rs.getString("email"));
			vo.setWrites(rs.getString("writes"));
			vo.setDate(rs.getString("date"));
			vo.setOpen_check(Integer.parseInt(rs.getString("open_check")));
	
			
			list.add(vo);

	    }
	      
		}catch (Exception e) {
		
		}finally {
			try {
					
				diconn();
					
			} catch (Exception ignored) {
					
			}
		}
		return list;
	}
	
	
	
	
}


