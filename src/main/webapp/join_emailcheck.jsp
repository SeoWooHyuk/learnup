<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="vo.*" %>
<%
JspfileIp jip = new JspfileIp();
String ip = jip.ipcheck();
String id = jip.id();
String pw = jip.pw();
%>

<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("utf-8");
Connection conn = null;
Statement stmt = null;
ResultSet rs;



String email = request.getParameter("email");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://"+ip+"/learnup?useUnicode=true&characterEncoding=utf8",id,pw);
    if(conn == null)
    {
    throw new Exception("nooooo");
    }
    stmt = conn.createStatement();
    rs = stmt.executeQuery("select * from information where email ='"+ email + "';");
    if(rs.next())
    {  
       email = rs.getString("email");
       out.println(email);
    }
      
    } finally {
		try {
				
			conn.close();
			stmt.close();
				
		} catch (Exception ignored) {
				
		}
	}
  
%>
   



