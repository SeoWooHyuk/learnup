package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import vo.JspfileIp;
import vo.Login_chk;


public class Login_cont {
	
	
	JspfileIp jip = new JspfileIp();
	String ip = jip.ipcheck();
	String id = jip.id();
	String pw = jip.pw();
	String forname = "com.mysql.cj.jdbc.Driver";
	Connection conn=null;
	Statement stmt=null;
	
	
	public Login_chk Login (String email) {
		Login_chk chk = new Login_chk();
	
		try {
			Class.forName(forname);
			conn = DriverManager.getConnection("jdbc:mysql://"+ip+":3306/learnup?useUnicode=true&characterEncoding=utf8",id,pw);
			if(conn==null)
				throw new Exception("�뜲�씠�꽣踰좎씠�뒪�뿉 �뿰寃고븷 �닔 �뾾�뒿�땲�떎.");
			stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from information where email='"+email+"';");
			if(rs.next()) {
				chk.setEmail(rs.getString("email"));
				chk.setPassword(rs.getString("password"));
				chk.setNickname(rs.getString("nickname"));
			}	
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
		return chk; 
	}	
}
