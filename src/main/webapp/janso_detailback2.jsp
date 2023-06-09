<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

 <%
  	ArrayList<String> categortList = (ArrayList<String>)request.getAttribute("Facility_categoriesArray");
 	String addres = (String)request.getAttribute("addres"); //js보낼 주소
 	
 	ArrayList<Janso_review> reviewall =(ArrayList<Janso_review>)request.getAttribute("reviewall");
 	double avgstar =  (double)request.getAttribute("avgstar");

 %> 
    <c:set var="addr" value="<%=addres%>"/>
	<c:set var="room" value="${article}"/>
	<c:set var="roombuy" value="${articlelist}"/>

	<c:set var="nickname" value="${Nickname}"/>
	<c:set var="email" value="${Email}"/>

	
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>상품 상세 페이지</title>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script language=JavaScript src="${common_context_path_url}js/janso_detail.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/janso_detail.css">

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1342a3ffd93979d7f9852ea40201756&libraries=services"></script>
   
		<script src="js/datepicker.min.js"></script>
    	<script src="js/datepicker.ko.js"></script>
    	
    	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
	
	
	
	<script src="js/datepicker.min.js"></script>
    <script src="js/datepicker.ko.js"></script>
    <link rel="stylesheet" href="css/datepicker.min.css">
    


	 
	 
	
	

</head>
 <style>
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
	 .pastDay{ background-color: lightgray; }
	   .double div {
	       float: left;
	   }
 </style>
<script language=JavaScript>
var chDate = '<c:out value="${addr}"/>';
var rooms = '<c:out value="${room.room_title}"/>';
var roomsnums = '<c:out value="${room.room_number}"/>';
var personnel_price = '<c:out value="${room.personnel_price}"/>';
var room_price = '<c:out value="${room.room_price}"/>';

var time1 = '<c:out value="${room.open_time}"/>';
var time2 = '<c:out value="${room.close_time}"/>';
var time3 = '<c:out value="${room.reservationtime}"/>';

var holiday = '<c:out value="${room.holiday}"/>';
var nickname = '<c:out value="${nickname}"/>';
var email = '<c:out value="${email}"/>';

var articleList = <%= new Gson().toJson(request.getAttribute("articleList")) %>;

</script>



<body>
<%@include file ="./header.jsp" %>
     
     
     
    <section class="section_main">
        <div class="main_left">
            <div class="sub_name"> <h2>${room.room_title} 방</h2> </div>

            <div class="img_box">
            	<div id="slider" class="slider" >
                    <a class="control_next">></a>
                    <a class="control_prev"><</a> 
                    <ul>	
                   
	                    <li class="slideli"><img src="${pageContext.request.contextPath }/jansoproduct/${room.sub_img1}" class="jansoimg" "></li>
	                    <li class="slideli"><img src="${pageContext.request.contextPath }/jansoproduct/${room.main_img}" class="jansoimg" "></li>
	                    <li class="slideli"><img src="${pageContext.request.contextPath }/jansoproduct/${room.sub_img2}" class="jansoimg" "></li>
	                    <li class="slideli"><img src="${pageContext.request.contextPath }/jansoproduct/${room.sub_img3}" class="jansoimg" "></li>
	                    <li class="slideli"><img src="${pageContext.request.contextPath }/jansoproduct/${room.sub_img4}" class="jansoimg" "></li>
                  	</ul> 
                  </div>
			</div>
<!--  
            <div class="star_junsu">
            	<div class="star_junsu_title">평점 4.5</div>
                <fieldset class="rating">
				    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
				    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
				    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>	
						
            </div>
-->
            <div class="move_left" style="z-index: 99">
                <div class="move_wrap">
                    <ul>
                 		<a href="#intro1" id="la"><li class="la">공간소개</li></a>
                        <a href="#intro2" id="lb"><li class="lb">시설안내</li></a>
                        <a href="#intro3" id="lc"><li class="lc">유의사항</li></a>
                        <a href="#intro4" id="ld"><li class="ld">환불정책</li></a>
                        <a href="#intro5" id="le"><li class="le">상세주소</li></a>
                        <a href="#이용후기"id="lf"><li class="lf">이용후기</li></a>
                        <div id="mv_bot"> </div>
                    </ul>
                 </div>
            </div>
<!-- 공간소개 -->
            <div class="intro_boxs"> 
                <div id="intro1" class="intro1"><h1>공간소개</h1></div>
                
                <div class="intro_boxs_0" >
               		<div id ="p_box" >                    
                       <p style="white-space: pre-line;" class="p_box">
                       ${room.room_introduction}
                       </p> 
                    </div>
                </div>
            </div>

            <div class="intro_boxs"> 
                <div id="intro2"><h1> 시설안내</h1></div>
                <div class="intro_boxs_0" >
                    <div id ="p_box" >                    
                       		<p style="white-space: pre-line;" class="p_box">
                       		<% for(String a : categortList ){%>
                       		<%= a %>		
                       				
                       		<%} %>
						                     			
                       		</p> 
                    </div>
                    
                </div>
            </div>
           

            <div class="intro_boxs"> 
                <div id="intro3"><h1>유의사항</h1></div>
                <div class="intro_boxs_0" >
                     <div id ="p_box" >                    
                       		<p style="white-space: pre-line;" class="p_box">
                       		  ${room.room_precautions}
                       		</p> 
                    </div>
                    
                </div>
            </div>

            <div class="intro_boxs"> 
                <div id="intro4"><h1>환불규정안내</h1></div>
                <div class="intro_boxs_0" >
                     <div id ="p_box" >                    
                       		<p style="white-space: pre-line;" class="p_box_refund">
                       		&nbsp;&nbsp;<span style="color: red;">이용당일 첫날(이후) 환불은 판매자에세 직접 문의 하셔야합니다. </span>
                       		&nbsp;&nbsp;<span style="">결제 후 2시간 이내에는 100%환불이 가능합니다. </span>
                     	  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용8일전 &nbsp; &nbsp; 총금액의 100%환불 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용7일전 &nbsp; &nbsp; 총금액의 90%환불 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용6일전 &nbsp; &nbsp; 총금액의 50%환불 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용5일전 &nbsp; &nbsp; 총금액의 40%환불 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용4일전 &nbsp; &nbsp; 총금액의 30%환불 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용3일전 &nbsp; &nbsp; 총금액의 환불불가 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용2일전 &nbsp; &nbsp; 총금액의 환불불가 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">이용1일전 &nbsp; &nbsp; 총금액의 환불불가 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">당일 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 환불불가 </span>
                       		  	&nbsp;&nbsp;<span style=""> </span>
                       		&nbsp;&nbsp;<span style="">전날 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 환불불가 </span>
                       		
                       		
                       		</p> 
                     </div>
                    
                </div>
            </div>

            <div class="intro_boxs"> 
                <div id="intro5"><h1>상세주소</h1></div>
                <div class="intro_boxs_0" >
                    <div id ="p_box" >                    
                       		<p style="white-space: pre-line;">
                       		주소: &nbsp ${room.room_address}
                       		</p> 
                       		<div id="map" style="width:100%;height:350px; z-index: -1"></div>
                     </div>
                    
                </div>
            </div>
            
            <div class="intro_boxs"> 
                <div id="intro6"><h1>이용후기</h1></div>
                <div class="intro_boxs_0" >  
                    <div id ="p_box" >  
<section id="writeForm">                
<form action="janso_detailreviewinsert.learnup.com" method="post" name="boardform">
		<div class="star_junsu_title">
		이용후기<span style="color: blue"><%=reviewall.size()  %></span>개 
		<span class="dot"></span> 평균평점<span style="color: blue"><%= avgstar %></span>점 
		<% if(nickname != null){%>
		<input type="submit" value="리뷰작성" style="float: right;" class="custom-btn btn-2" id="forsub"/>
	
		</div>  
			<input type="hidden" name="nickname" value="${nickname}" />
			<input type="hidden" name="room_number" value="${room.room_number}">
			<input type="hidden" name="review_re_ref" value=""> 
			<input type="hidden" name="review_re_lev" value="">
			<input type="hidden" name="review_re_seq" value="">
			
			<table border="0">
			
			<thead>
			<tr>
			<td colspan="2" style="width: 150px; height: 50px; font-size: 18px;">별점을 입력하세요</td>
			<td style="width: 400px">
			    <div class="star_junsu">
                <fieldset class="rating1">
				    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half1" for="star4half" title="Pretty good - 4.5 stars"></label>
				    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half1" for="star3half" title="Meh - 3.5 stars"></label>
				    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half1" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half1" for="star1half" title="Meh - 1.5 stars"></label>
				    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half1" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>			
            	</div>
			
			
			</td>
			</tr>
			<tr>
			<td colspan="3" ><textarea id="writes" name="writes" style="width: 100%; height: 100px; border: 2px solid #8041D9; resize : none; font-size: 1.5em;" required></textarea></td>
			</tr>
			</thead>
			</table>
				<%} %>
</form>
</section>
                    
              			<div id="review_box""> </div>
                     </div>
                </div>
            </div>
            
            <!-- 끝부분 -->
        </div>
        
        

    <!--중간여백-->
        <div style="float: left; width: 80px;"></div>
    <!--중간여백-->

		
        <div class="main_right">
       
        <p style="height: 135px;"></p>
        
            <div class="sevu">세부 옵션</div>
            
            <div class="intro_boxs_right"> 
                <div class="intro_boxs_0" >
                	<ul>
			        	<li><span class="tit">공간유형</span><span class="data">${room.room_categories}</span></li>
			            <li><span class="tit">공간면적</span><span class="data">${room.room_area}㎡</span></li>
			            <li><span class="tit">예약시간</span><span class="data">am ${room.open_time}:00~</span></li>
			            <li><span class="tit">수용인원</span><span class="data">${room.min_personnel}명~${room.max_personnel}명</span></li>
			            <li><span class="tit">휴&nbsp   &nbsp &nbsp &nbsp일</span><span class="data">${room.holiday}</span></li>
			           
			        </ul>
                </div>
            </div>
            <form action="janso_detailIn.learnup.com" method="post" id="myForm" >     
              <input type="hidden" id= "" name ="roomnumber" value="${room.room_number}" >
              <input type="hidden" id= "ppp" name ="ppp"  >
			<div class="reserv">예약일을 지정해 주세요</div>
		    <div class = "calendar_container"> 
	
		       <div class="single">
		     	   <input id="datepicker1" name="datepicker1"  type="text"  hidden="" data-multiple-dates="31"/>
			   </div>
		    </div>
	
		    
		    <div class="reserv">예약시간을 지정해 주세요</div>
		    <div class = "calendar_container"> 
		      
		      <div id="main">
			        <div>
			            <input id="timepicker" name="timepicker" class="timepicker"  multiple/>
			        </div>
			    </div>
			      
		    </div>
		    
		 <!--  
		      <div class= timenumber">
             <div><span class="addperson_title">추가 예약시간</span><span class="addperson_note">(${room.room_price}원/${room.reservationtime}시간) 최대가능 예약시간 ${room.close_time - room.open_time + 1}시간</span></div>
            	 <div class="input-number2" min="0" max="${room.close_time - room.open_time + 1} ">
            	   <button  id="input-number-decrement2" class="input-number-decrement2" type="button" data-decrement2></button>
				    <input id="timez" name="timez" type="text" value="0">
				   <button id="input-number-increment2" class="input-number-increment2" type="button" data-increment2></button>
				  </div>
            </div>
		    
		-->         
		    
		    
		    
		    <!-- 장소구매 인설트 -->
			   
            <div class="personnumber">
             <div><span class="addperson_title">추가 예약인원</span><span class="addperson_note">(최대${room.max_personnel}명, 인원 추가당 ${room.personnel_price}원/1인)</span></div>
          
            	 <div class="input-number" min="${room.min_personnel}" max="${room.max_personnel}">
            	   <button  id="input-number-decrement" class="input-number-decrement" type="button" data-decrement></button>
				    <input id="person" name="person" type="text" value="${room.min_personnel}">
				   <button id="input-number-increment" class="input-number-increment" type="button" data-increment></button>
				  
				  </div>
            </div>
            
            
            <!--  
            <div class="addperson">
            	<div><span class="addperson_title">총 예약인원</span><span class="addperson_note">(최대20명, 10명 초과시 10,000원/1인)</span></div>
            	<div class="addperson_text_wrap">
	            	<span class="plusbtn">-</span>
	            	<span><input type="text" class="addperson_text" placeholder="10" value=""></span>
	            	<span class="minusbtn">+</span>
            	</div>
            </div>
           -->
        
            <div>
            	<div>
            	 <fmt:formatNumber var="priceWithComma" value="${room.room_price + room.personnel_price * room.min_personnel}" pattern="#,##0" />
	               <div class="totalprice">
	          	     <span id="priceto" style="color:red; font-size:25pt; font-weight:bold;"> ${priceWithComma}  </span><span style="font-size:12pt; font-weight:bold;"> 원/ 시간(인)</span>
	                    
	               </div>
	         <!--  
	            <fmt:formatNumber type="number" maxFractionDigits="3" value= "111111" var="commaPrice" />
	             ${commaPrice} 
            -->
            	<!--  
            	<input type="hidden" id= "" name =roomnumber value="${room.room_number}" >
				<input type="hidden" id= "yearsmonster" name =yearsmonster >	
				<input type="hidden" id= "monthsmonster" name =monthsmonster >	 
				<input type="hidden" id= "firstmonster" name =firstmonster >	 
				<input type="hidden" id= "lastsmonster" name =lastsmonster >	  
				
				-->
				            
	            <h3 class="righth3" id="righth3">결제 후 바로 예약확정</h3>
	            <span class="righth3_de" >빠르고 확실한 예약을 위해 </span>
	            <span class="righth3_de">런업에서 온라인 결제를 진행해주세요</span>
             	
             	<%if(nickname != null) {%>
             	
             	<button type="submit" id="sub" class="paybtn"  >결제하기</button> 
             	<%}else{%>
             	<button type="button" id="sub" class="paybtn"  >로그인 후 결제가능</button> 
             	<%} %>
             	    
    			 </form> 
            </div>
         
            
        </div>
        <br>
    </section>

 <%@include file ="./footer.jsp" %>

</body>

</html>