<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import= "java.io.File"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

		<link href="css/off_mainpage_style.css" rel="stylesheet" type="text/css">
		<link href="css/slick.css" rel="stylesheet" type="text/css">
		<link href="css/slick-theme.css" rel="stylesheet" type="text/css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script src="js/off_mainpage_js.js"></script> 
		<script src="js/slick.js"></script>
		<script>
			$.noConflict();
			jQuery( document ).ready(function( $ ) {
			  // Code that uses jQuery's $ can follow here.
			});
			// Code that uses other library's $ can follow here.
		</script>
		
		<title></title>
	</head>
	<style type="text/css">
	</style>
	<body style="margin : 0; overflow-x: hidden;">
	 <%
		ArrayList<Off_total_ob> articleList = (ArrayList<Off_total_ob>)request.getAttribute("totalList");
		DecimalFormat jari = new DecimalFormat("###,###");
 	 %> 	
		<form name="main">
		
			<jsp:include page = "header.jsp"/>
			
		<div style="width:100%; height:100%; margin-right: auto; margin-left: auto ;">
			<div style="width:100%; height:430px; background-color:#3F0099; float: left;">
				<div style="width:100%; height:380; margin:auto; margin:25px auto;">
					<div style="width:1280px; height:380px; list-style:none; margin-left:auto; margin-right:auto;">
						<div class="banner_sec1">
								<h1>강의마켓 NO.1 런업에서<br>원하는 강의를 찾아보세요.</h1>
								<div method="get" action="/search" id="search2">
									<input type="text" size="20" placeholder="검색해주세요" class="main-search input-lg">
								</div>
								<ul>
									<a href="#self"><li>#피트니스</li></a>
									<a href="#self"><li>#보컬</li></a>
									<a href="#self"><li>#필라테스</li></a>
									<a href="#self"><li>#스포츠</li></a>
									<a href="#self"><li>#공예</li></a>
									<a href="#self"><li>#메이크업</li></a>
									<a href="#self"><li>#베이킹</li></a>
								</ul>
						</div>
						<div class="banner_sec2">
							<a href="#self"><div><img src="image/banner1.webp"></div></a>
							<a href="#self"><div><img src="image/banner2.webp"></div></a>
							<a href="#self"><div><img src="image/banner3.webp"></div></a>
							<a href="#self"><div><img src="image/banner4.webp"></div></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<section>
				
				<div class="modal">
                    <button>&times;</button>
                    <div class="modalBox">
                        <img src="" alt="">
                        <p></p>
                    </div>
                </div>
				<div style="width:200px; height:570px; float: left; margin-top: 20px;">
					<article class="side">
						<nav style="margin-top:40px; font-size: 15pt; width: 180px; height: 40px; border-radius:0 ; color:black;border-bottom: solid 2px purple;"><b>비즈니스</b></nav>
						<a href="#self"><nav style="margin-top:30px;">디자인</nav></a>
						<a href="#self"><nav>IT·프로그래밍</nav></a>
						<a href="#self"><nav>영상·사진·음향</nav></a>
						<a href="#self"><nav>마케팅</nav></a>
						<a href="#self"><nav>번역·통역</nav></a>
						<a href="#self"><nav>문서·글쓰기</nav></a>
						<a href="#self"><nav>경영자문·운영지원</nav></a>
						<a href="#self"><nav>주문제작</nav></a>
						<a href="#self"><nav>세무·법인·노무</nav></a>
						<br>
						<a href="off_seller_regipage.jsp"><nav>강의 등록하기</nav></a>
						<a href="off_seller_mypage.jsp"><nav>일정&장소 등록하기</nav></a>
					</article>
				</div>
				<div class="product_allsec">
					<div class="title_sec">
						<div class="title"><b>이주의 무료강의</b></div>
					</div>
					<div class="product_secwrap">
					<div class="slides">
					
						<%int i = 0; %>
    					<%for(i = 0; i < articleList.size(); i++) {%>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
								
									<div id="slider<%=i%>" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 	
					                    <ul>
					      				  <li class="imgC"><img src="${pageContext.request.contextPath }/offclassup/<%=articleList.get(i).getCover_image1()%>" alt="cover1"></li>
					                      <li class="imgC"><img src="${pageContext.request.contextPath }/offclassup/<%=articleList.get(i).getCover_image2()%>" alt="cover2"></li>
					                      <li class="imgC"><img src="${pageContext.request.contextPath }/offclassup/<%=articleList.get(i).getCover_image3()%>" alt="cover3"></li>
					                      <li class="imgC"><img src="${pageContext.request.contextPath }/offclassup/<%=articleList.get(i).getCover_image4()%>" alt="cover4"></li>
					                      <li class="imgC"><img src="${pageContext.request.contextPath }/offclassup/<%=articleList.get(i).getCover_image5()%>" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="off_class_detailpage.jsp">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson"><%=articleList.get(i).getOffclass_title()%></div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div><%=jari.format(articleList.get(i).getOffclass_price()) %>원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					 	<%} %>
					
						
					</div>
					</div>
					<div class="title_sec">
						<div class="title"><b>이주의 인기강의</b></div>
					</div>
					<div class="product_secwrap">
					<div class="slides">
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider5" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson6.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson7.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson8.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson9.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson10.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider6" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson7.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson8.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson9.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson10.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson11.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider7" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson8.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson9.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson10.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson11.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson12.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider8" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson9.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson10.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson11.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson12.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson13.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
					</div>

					<div class="title_sec">
						<div class="title"><b>이주의 신규강의</b></div>
					</div>
					<div class="product_secwrap">
					<div class="slides">
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider9" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson10.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson11.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson12.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson13.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson14.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider10" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson11.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson12.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson13.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson14.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson15.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider11" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson12.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson13.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson14.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson15.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson16.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider12" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson13.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson14.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson15.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson16.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson2.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
					</div>

					<div class="title_sec">
						<div class="title"><b>평점높은 명품강의</b></div>
					</div>
					<div class="product_secwrap">
					<div class="slides">
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider13" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson14.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson15.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson16.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson2.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson3.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider14" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson15.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson16.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson2.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson3.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson4.jpg" alt="cover5"></li>
					                    </ul>
					                </div>									
									
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									<div id="slider15" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/lesson16.jpg" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson2.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson3.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson4.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson5.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="product">
							<a href="#self">
								<div class="product_image imgList">
									
									<div id="slider16" class="slider1" >
										<span style="position:absolute; margin-left: 200px; z-index:9;">
											<a href="javascript:;" class="icon heart" style="text-decoration:none; color:inherit; cursor:pointer;">
												<img src="image/heart1.png" alt="찜하기">
											</a>
										</span> 
										
					                    <a  class="control_next">></a>
					                    <a  class="control_prev"><</a>
					                 
					                    <ul>
					                      <li class="imgC"><img src="image/green.jfif" alt="cover1"></li>
					                      <li class="imgC"><img src="image/lesson5.jpg" alt="cover2"></li>
					                      <li class="imgC"><img src="image/lesson6.jpg" alt="cover3"></li>
					                      <li class="imgC"><img src="image/lesson7.jpg" alt="cover4"></li>
					                      <li class="imgC"><img src="image/lesson8.jpg" alt="cover5"></li>
					                    </ul>
					                </div>
																	
								</div>
							</a>
							<a href="#self">
								<div class="product_detail">
									<div class="area">강남구</div>
									<div class="lesson">그린컴퓨터아카데미 풀스텍(java, database, css, javascript)</div>
									<div class="seller">판매자명</div>
									<div class="price">
										<div>10,000원</div>
									</div>
									<div class="jjre">
										<div class="jjim">
											<img src="image/heart2.png" style="width:15px; height: 15px; float: left;">
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; margin-left: 5px;line-height:15px;">1,000+</div>
										</div>
										<div class="review">
											<div style="width:25px; height: 15px; float:left; font-weight:bold;">리뷰</div>
											<div style="width:30px; height: 15px; font-weight:bold; font-size:9pt; float:left; line-height:15px;">1,000+
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
					</div>
				</div>
			</section>
		</div>
	<div style="width:100%; height:100%; margin-right: auto; margin-left: auto; ">
	
		<jsp:include page = "footer.jsp"/>
		
	</div>
	</form>	
	</body>

</html>