<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset='utf-8'>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상세페이지</title>
    <link rel='stylesheet' type='text/css' media='screen' href='./css/janso_sub.css' >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
</head>
 <script type="text/javascript">

	
 $(document).ready(function(){
		
	 $.ajax({
	   url: "janso_subpage.learnup.com",
	   type: "GET",
	  // 전송할 데이터 설정
	   success: function(response) {
	     // 요청이 성공한 경우에 대한 처리
	     // response 변수에 응답으로 받은 내용이 들어 있습니다.
	     // 여기서는 해당 내용을 원하는 방식으로 처리할 수 있습니다.
	     $("#subajax").html(response);
	    
	   },
	   error: function(xhr, status, error) {
	     // 요청이 실패한 경우에 대한 처리
	   }
	 });

 });



</script>


<body>



<div id="subajax"></div>




</body>
</html>