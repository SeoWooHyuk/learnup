<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.io.File"%>
<%@page import="java.util.*" %>
<%@page import="java.net.URLEncoder"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>delete title here</title>
</head>
 <body>

	<jsp:useBean id ="de" class ="dao.Co_Controller">
	<%
		String board_id = request.getParameter("id");
		de.board_deleate(board_id);
		response.sendRedirect("board_select.jsp"); //폼버튼이없더라도 페이지를 넘겨주는 작업
	%>	 
	</jsp:useBean>
	
	
  </body>

</html>