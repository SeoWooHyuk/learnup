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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    
    <script src="./js/janso_sub.js"> </script>

</head>
<style type="text/css">
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
 /*평점*/
.star_junsu{
   
    text-align: center;
    border-style: none;
}
.star_junsu_title{
	font-size:14pt;
	font-weight:bold;
	height: 30px;
}
fieldset,
label {
  margin: 0;
  padding: 0;
}
.rating {
  border: none;
  left : -260px;
  text-align: center;
  margin-top:0px;
}

.rating > input {
  display: none;

}
.rating > label:before {
  margin: 3px;
  font-size: 19px;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before {
  content: "\f089";
  position: absolute;
}

.rating > label {
  color: #ddd;
  float: right;
  cursor:pointer;
}

</style>

<body>
  <%
  	ArrayList<Janso_product_registration> articleList=(ArrayList<Janso_product_registration>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
  	PageSearch psearch = (PageSearch)request.getAttribute("search");
  
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	int pnum = (int)request.getAttribute("pnum");

	if(request.getParameter("pernums")!=null){
		pnum = Integer.parseInt(request.getParameter("pernums"));
	}
	
 %> 
 
 
<%@include file ="./header.jsp" %>
  
<section class="image-section">
    <div class="image-section-0"></div>
</section>
<!--광고1 -->

<section class="section_janso">

</section>

<section class="section_janso1">
    <div style="margin-top: 20px !important;;  display: block;"></div>
    
    <div class="flex">
        <div class="left_menu" style="flex-basis: 184px;"> </div>      
    </div>
   
            <!-- 지역선택 옆 메인   -->
        <div class="right_main">
            <div class="filter_wrap">
                <div style="flex-basis: 675px; height: 60px; float: left;">  
                <div  action="janso_subpage.learnup.com?page=<%=nowPage%>" class="search_form"style="float :left;">
                    <form class="search">
                	 <input type="hidden"  name="page" value="<%=nowPage%>" ">
					<input class="searchTerm" placeholder="검색하세여"  name = "searchs" style="padding-left: 20px;" value="<%= psearch.getSearch()  %>"/><input class="searchButton" type="submit" />
				
                </div>
                      <div class="link">
                          <ul>
                              <li><a href="janso_subpage.learnup.com?page=<%=nowPage%>&searchs=<%= psearch.getSearch() %>&pernums=<%=pnum %>&priceup=0">기본순</a></li>
                              <li><a href="">추천순</a></li>
                              <li><a href="janso_subpage.learnup.com?page=<%=nowPage%>&searchs=<%= psearch.getSearch() %>&pernums=<%=pnum %>&priceup=1">고가순</a></li>
                              <li><a href="janso_subpage.learnup.com?page=<%=nowPage%>&searchs=<%= psearch.getSearch() %>&pernums=<%=pnum %>&priceup=2">저가순</a></li>
                          </ul>
                      </div>
                </div>
            </div>
            <!-- 인원수 -->
            <div class="personnumber">
            	<span style="float: left; text-align: center; line-height: 35px; margin-right: 25px; font-weight: bold; padding-left: 20px  " >최대허용 인원수검색</span>
            	 <div class="input-number" min="1" max="50">
            	   <button class="input-number-decrement" type="button" data-decrement></button>
				    <input id="pernums" name="pernums" type="text" value="<%=pnum %>">
				   <button class="input-number-increment" type="button" data-increment></button>
				  </div>
            </div>
                </form>

 <div class="productbox">
  <!-- 셀렉들어오는곳 -->
 <div class="link-box1">
 <!-- box-0 -->

 <c:set var="pageInfo" value="${pageInfo}"/>
  <!--  
     현재 ${pageInfo.page}
     최대 ${pageInfo.maxPage}
     시작 ${pageInfo.startPage}
     끝  ${pageInfo.endPage}
-->
 
 <% for(int i=0;i<articleList.size();i++){ %>

 <div class="box-0">	
	<div class="box-0-1">
	<span  style="position : absolute; z-index: 9 " >
		<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;  ">
			<img src="image/heart1.png" alt="찜하기" style=" ">
		</a>  
	</span>	
	<a href="janso_detail.learnup.com?roomnumber=<%=articleList.get(i).getRoom_number() %>" style=" text-decoration: none; box-sizing: border-box;">		
		<img src="${pageContext.request.contextPath }/jansoproduct/<%= articleList.get(i).getMain_img() %>" alt="" style=" width: 100%; height: 200px;">   	
	</a> 
	</div>

<a href="janso_detail.learnup.com?roomnumber=<%=articleList.get(i).getRoom_number() %>" style=" text-decoration: none; box-sizing: border-box;">		
<div class="box-0-2">
	<div class="box-0-2_box">
    	<strong style="font-size: 15px;" ><%= articleList.get(i).getRoom_title() %>룸</strong> 
        <span style="font-size: 12px;">(최소인원 <%=articleList.get(i).getMin_personnel() %>명/ </span>    
        <span style="font-size: 12px;"> 최대인원 <%=articleList.get(i).getMax_personnel() %>명) </span>
	</div>
		<div class="box-0-2_box">
	    <span style="float: left; font-size: 15px; color: black">공간: </span>&nbsp
        <span style="font-size: 15px; position: absolute  ; line-height: 23.9px;"><%= articleList.get(i).getRoom_categories() %></span>
	</div>
	<div class="box-0-2_box">
	    <span style="float: left; font-size: 15px; color: blue">지역: </span>&nbsp
        <span style="font-size: 12px; position: absolute  ; line-height: 23.9px;"><%= articleList.get(i).getRoom_address() %></span>
	</div>
	<div class="box-0-2_box" >
	    <div style="float: left; font-size: 12px; line-height: 24.5px">
                    <%=articleList.get(i).getRoom_price() %> 원/1시간
                    </div> 
                    <div style="float: right; font-size: 12px; line-height: 24.5px">
                     평점/<%=  Double.parseDouble(String.format("%.2f", articleList.get(i).getStar())) %>
                    </div>
                    <div style="float: right; ">
  					<div class="star_junsu" >
              		<%
					double inputValue = articleList.get(i).getStar();
					%>
					
					
						<% 	if (inputValue <= 0.0) { %>
						       	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars"></label>
								<label class = "full"  title="Kinda bad - 2 stars"></label>
								<label class="half"  title="Meh - 1.5 stars"></label>
								<label class = "full"  title="Sucks big time - 1 star" ></label>
								<label class="half" title="Sucks big time - 0.5 stars" ></label>
								</fieldset>			
				            	</div>
		
						<%	} else if (inputValue <= 0.5 || inputValue < 1.0) { %>
    						   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars"></label>
								<label class = "full"  title="Kinda bad - 2 stars"></label>
								<label class="half"  title="Meh - 1.5 stars"></label>
								<label class = "full"  title="Sucks big time - 1 star" ></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
						<%	} else if (inputValue <= 1.0  || inputValue < 1.5) { %>
						 	   <div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars"></label>
								<label class = "full"  title="Kinda bad - 2 stars"></label>
								<label class="half"  title="Meh - 1.5 stars"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
				
						<%	} else if (inputValue <= 1.5 || inputValue < 2.0 ) { %>
				 	 	   		<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars"></label>
								<label class = "full"  title="Kinda bad - 2 stars"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
					
						<%	} else if (inputValue <= 2.0 || inputValue < 2.5) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
						
						<%	} else if (inputValue <= 2.5 || inputValue < 3.0) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
					
						<%	} else if (inputValue <= 3.0 || inputValue < 3.5) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"></label>
								<label class = "full"  title="Meh - 3 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>	
					
						<%	} else if (inputValue <= 3.5 || inputValue < 4.0) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"></label>
								<label class="half" title="Meh - 3.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Meh - 3 stars"style=" color: #ffd700;"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
					
						<%	} else if (inputValue <= 4.0 || inputValue < 4.5) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"></label>
								<label class = "full"  title="Pretty good - 4 stars"style=" color: #ffd700;"></label>
								<label class="half" title="Meh - 3.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Meh - 3 stars"style=" color: #ffd700;"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
						
						<%	}else if (inputValue <= 4.5 ) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"></label>
								<label class="half"  title="Pretty good - 4.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Pretty good - 4 stars"style=" color: #ffd700;"></label>
								<label class="half" title="Meh - 3.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Meh - 3 stars"style=" color: #ffd700;"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
							
						<%	}else if (inputValue == 5.0) { %>
						  	   	<div class="star_junsu">
				                <fieldset class="rating">
								<label class = "full"  title="Awesome - 5 stars"style=" color: #ffd700;"></label>
								<label class="half"  title="Pretty good - 4.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Pretty good - 4 stars"style=" color: #ffd700;"></label>
								<label class="half" title="Meh - 3.5 stars"style=" color: #ffd700;"></label>
								<label class = "full"  title="Meh - 3 stars"style=" color: #ffd700;"></label>
								<label class="half"  title="Kinda bad - 2.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Kinda bad - 2 stars" style=" color: #ffd700;"></label>
								<label class="half"  title="Meh - 1.5 stars" style=" color: #ffd700;"></label>
								<label class = "full"  title="Sucks big time - 1 star" style=" color: #ffd700;"></label>
								<label class="half" title="Sucks big time - 0.5 stars" style=" color: #ffd700;"></label>
								</fieldset>			
				            	</div>
						<%}%>
							
            			</div> 
                    </div>        
	</div>
</div>
</a>       
</div>
<%} %>

<!-- box-0 -->

     
</div> <!-- 링크박스 닫기 -->


</div>  	
  <!-- 셀렉들어오는곳 -->
 </div>
               
</section>
 

<!--그위 빈공간 -->
	
<section style="height: 80px;">
  <div style=" margin-top: 15px; height: 75px;">
                 <div class="pageContainer">   
       			 <ul class="pageList">
       			 
       			 <%if(nowPage<=1){ %>
       			  <li><a href=""></a></li>
       			 <%}else{ %>
		          <li><a href="janso_subpage.learnup.com?page=<%=nowPage-1 %>"> < </a></li>
		          <%} %>
		          
				<%for(int a=startPage; a<=endPage;a++){ %>
						
					<%if(psearch.getSearch() == "") {%>	
				   	    <li><a href="janso_subpage.learnup.com?page=<%=a%>&pernums=<%=pnum %>"><%=a %></a></li>
				   <%}else{ %>
				    <li><a href="janso_subpage.learnup.com?page=<%=a%>&searchs=<%=psearch.getSearch()%>&pernums=<%=pnum %>"><%=a %></a></li>
				   <%} %>
					
				<%} %>
		    		
		    		
		    		<%if(nowPage>=maxPage){ %>
					  <li><a href=""></a></li>
					<%}else{ %>
		          <li><a href="janso_subpage.learnup.com?page=<%=nowPage+1 %>"> > </a></li>
		          <%} %>
		          
        		</ul>
        		<div class="clear"></div>
			</div>
            </div>
        </div>
</section>

<!--그위 빈공간 -->

 <%@include file ="./footer.jsp" %>
</body>
</html>