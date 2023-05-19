package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.JspfileIp;
import vo.NoticedataType;

public class Noticedata {
	JspfileIp jip = new JspfileIp();
	String ip = jip.ipcheck();
	String id = jip.id();
	String pw = jip.pw();
	String forname = "com.mysql.cj.jdbc.Driver";
	
	Connection conn = null;
	Statement stmt = null;
	
	public void connect(){
		try {
			Class.forName(forname);
			 conn = DriverManager.getConnection("jdbc:mysql://"+ip+":3306/learnup?useUnicode=true&characterEncoding=utf8",id,pw);
		}catch(Exception e) {
			System.out.println(e+"�����Դϴ�.");
		}
	}
	
	public void diconnect() {
		try {
			conn.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void datainsert(NoticedataType data) {
		try {
			connect();
			stmt = conn.createStatement();
			String recordadd = "insert into notice(title, text, nickname, file) "
					+ "values('"+data.getTitle()+"', '"+data.getText()+"', '"+data.getNickname()+"', '"+data.getFile()+"')";
			stmt.executeUpdate(recordadd);
		}catch(Exception e){
			System.out.println(e+"�����Դϴ�.");
		}finally {
			try {
				diconnect();
			}catch(Exception e) {
			}
		}
	}
	public ArrayList<NoticedataType> mainselect() {
		ResultSet rs = null;
		ArrayList<NoticedataType> s = new ArrayList<NoticedataType>();
		NoticedataType data = null;
		try{
	   		connect();
	   		if(conn==null)
	   			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
	   		stmt = conn.createStatement();
	   		rs = stmt.executeQuery("select @rownum:=@rownum+1 as 'number', noticenum, title, nickname, text, file, date_format(createdate, '%Y�� %m�� %d��') as 'date' from notice where (@rownum:=0)=0");
	   		while(rs.next())
	   		{
	   			data = new NoticedataType();
	   			data.setNoticenum(rs.getInt("noticenum"));
	   			data.setTitle(rs.getString("title"));
	   			data.setNickname(rs.getString("nickname"));
	   			data.setText(rs.getString("text"));
	   			data.setFile(rs.getString("file"));
	   			data.setCreatedate(rs.getString("date"));
	   			s.add(data);
	   		}
	    }catch(Exception e){
	    	System.out.print("����� �����ϴ�");
	   	}finally{
	   		try{
	   			diconnect();
	   		}catch(Exception ignored){
	   		
	   		}
	   	}
		return s;
	}
	public ArrayList<NoticedataType> titleselect(String tt) {
		ResultSet rs = null;
		ArrayList<NoticedataType> s = new ArrayList<NoticedataType>();
		NoticedataType data = null;
		try{
	   		connect();
	   		if(conn==null)
	   		{
	   			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
	   		}
	   		stmt = conn.createStatement();
	   		rs = stmt.executeQuery("select noticenum, title, nickname, text, date_format(createdate, '%Y�� %m�� %d��') as 'date' from notice where title like '%"+tt+"%'");
	   		while(rs.next())
	   		{
	   			data = new NoticedataType();
	   			data.setNoticenum(rs.getInt("noticenum"));
	   			data.setTitle(rs.getString("title"));
	   			data.setNickname(rs.getString("nickname"));
	   			data.setText(rs.getString("text"));
	   			data.setCreatedate(rs.getString("date"));
	   			s.add(data);
	   		}
	    }catch(Exception e){
	    	System.out.print("����� �����ϴ�");
	   	}finally{
	   		try{
	   			diconnect();
	   		}catch(Exception ignored){
	   		
	   		}
	   	}
		return s;
	}
	
	public NoticedataType detailpageselect(String title) {
		ResultSet rs = null;
		NoticedataType data = new NoticedataType();
		try{
	   		connect();
	   		if(conn==null)
	   			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
	   		stmt = conn.createStatement();
	   		rs = stmt.executeQuery("select @rownum:=@rownum+1 as 'num', noticenum, title, nickname, text, file, date_format(createdate, '%Y�� %m�� %d�� %T') as 'date' from learnup.notice where title='"+title+"' and (@rownum:=0)=0;");
	   		if(rs.next())
	   		{
	   			data.setNum(rs.getInt("num"));
	   			data.setNoticenum(rs.getInt("noticenum"));
	   			data.setTitle(rs.getString("title"));
	   			data.setNickname(rs.getString("nickname"));
	   			data.setText(rs.getString("text"));
	   			data.setFile(rs.getString("file"));
	   			data.setCreatedate(rs.getString("date"));
	   		}
	    }catch(Exception e){
	    	System.out.print("����� �����ϴ�");
	   	}finally{
	   		try{
	   			diconnect();
	   		}catch(Exception ignored){
	   		
	   		}
	   	}
		return data;
	}
	public NoticedataType prevselect(String number) {
		ResultSet rs = null;
		NoticedataType data = new NoticedataType();
		try{
	   		connect();
	   		if(conn==null)
	   			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
	   		stmt = conn.createStatement();
	   		rs = stmt.executeQuery("select noticenum, title, nickname, text, date_format(createdate, '%Y�� %m�� %d�� %T') as 'date' from learnup.notice where noticenum<"+number+" order by noticenum desc limit 1");
	   		if(rs.next())
	   		{
	   			data.setNoticenum(rs.getInt("noticenum"));
	   			data.setTitle(rs.getString("title"));
	   			data.setNickname(rs.getString("nickname"));
	   			data.setText(rs.getString("text"));
	   			data.setCreatedate(rs.getString("date"));
	   		}
	    }catch(Exception e){
	    	System.out.print("����� �����ϴ�");
	   	}finally{
	   		try{
	   			diconnect();
	   		}catch(Exception ignored){
	   		
	   		}
	   	}
		return data;
	}
	public NoticedataType nextselect(String number) {
		ResultSet rs = null;
		NoticedataType data = new NoticedataType();
		try{
	   		connect();
	   		if(conn==null)
	   			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
	   		stmt = conn.createStatement();
	   		rs = stmt.executeQuery("select noticenum, title, nickname, text, date_format(createdate, '%Y�� %m�� %d�� %T') as 'date' from learnup.notice where noticenum>"+number+" order by noticenum limit 1");
	   		if(rs.next())
	   		{
	   			data.setNoticenum(rs.getInt("noticenum"));
	   			data.setTitle(rs.getString("title"));
	   			data.setNickname(rs.getString("nickname"));
	   			data.setText(rs.getString("text"));
	   			data.setCreatedate(rs.getString("date"));
	   		}
	    }catch(Exception e){
	    	System.out.print("����� �����ϴ�");
	   	}finally{
	   		try{
	   			diconnect();
	   		}catch(Exception ignored){
	   		
	   		}
	   	}
		return data;
	}
	public void delete(String no) {
		try{
			connect();
			stmt = conn.createStatement();

			String data = "delete from notice where noticenum = '"+ no +"'"; 
			stmt.executeUpdate(data);
		}catch(Exception e) {
			System.out.println(e+"�����Դϴ�.");
		}finally {
			try {
				diconnect();
			}catch(Exception e){
			}
		}
	}
	public void update(NoticedataType no) {
		try {
		    connect();
		    String query = "UPDATE notice SET title=?, text=? WHERE noticenum=?";
		    PreparedStatement pstmt = conn.prepareStatement(query);
		    pstmt.setString(1, no.getTitle());
		    pstmt.setString(2, no.getText());
		    pstmt.setInt(3, no.getNoticenum());
		    pstmt.executeUpdate();
		} catch (Exception e) {
		    System.out.println(e + "�����Դϴ�.");
		} finally {
		    try {
		        diconnect();
		    } catch (Exception e) {
		        // ó���� �۾�
		    }
		}
	}
}
