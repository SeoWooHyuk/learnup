<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.Console"%>
<%@page import="vo.TalentPageInfo"%>
<%@page import="vo.TalentDataType"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<%
	ArrayList<TalentDataType> articleList = (ArrayList<TalentDataType>) request.getAttribute("articleList");
	TalentPageInfo pageInfo = (TalentPageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	DecimalFormat df;
	df = new DecimalFormat("###,###");
	String category = request.getParameter("category");
	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/jspindexpage.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/indexpage.js"></script>
<title>런업 : 재능</title>
</head>
<body>
	<form>
		<div id="full">
			<jsp:include page="header.jsp" />
			<div id="lo2">
				<div class="slider-1">
					<div class="slides">
						<div class="active">
							<a href="#s3" onclick="scrollToTarget('#s3')"><img
								src="image/talentimage/hothae.jpg"></a>
						</div>
						<div>
							<a href="#new" onclick="scrollToTarget('#new')"><img
								src="image/talentimage/banner.jpg"></a>
						</div>
					</div>
					<div class="page-btns">
						<div class="active"></div>
						<div></div>
					</div>
					<div class="side-btns">
						<div>
							<span><i class="fas fa-angle-left"></i></span>
						</div>
						<div>
							<span><i class="fas fa-angle-right"></i></span>
						</div>
					</div>
				</div>
				<section id="s1">
					<div class="high">비즈니스</div>
					<nav>
						<ul>
							<%
								String[] categories = { "디자인", "IT·프로그래밍", "영상·사진·음향", "마케팅", "번역·통역", "문서·글쓰기", "경영자문·운영지원", "주문제작", "세무·법무·노무" };
								for (int i = 1; i <= categories.length; i++) {
									String categoryLink = "TalentList.learn?category=" + i;
									String fontWeight = i == Integer.parseInt(category) ? "font-weight: bold;" : "";
							%>
							<li style="<%=fontWeight%>"><a href="<%=categoryLink%>"><%=categories[i - 1]%></a></li>
							<%
								}
							%>
						</ul>
					</nav>
				</section>
				<section id="s2">
					<div id="space">
						홈 > 비즈니스 >
						<%
						

						if (category.equals("1")) {
							out.print("디자인");
						} else if (category.equals("2")) {
							out.print("IT·프로그래밍");
						} else if (category.equals("3")) {
							out.print("영상·사진·음향");
						} else if (category.equals("4")) {
							out.print("마케팅");
						} else if (category.equals("5")) {
							out.print("번역·통역");
						} else if (category.equals("6")) {
							out.print("문서·글쓰기");
						} else if (category.equals("7")) {
							out.print("경영자문·운영지원");
						} else if (category.equals("8")) {
							out.print("주문제작");
						} else if (category.equals("9")) {
							out.print("세무·법무·노무");
						}
					%>
					</div>

					<div id="space1"><%= articleList.size()%>개의 서비스</div>
					<div id="space2">
						<%
							for (int i = 0; i < articleList.size(); i++) {
						%>
						<article>
							<div>
								<img src="TalentUpload/<%=articleList.get(i).getImage()%>"
									id="talent-<%out.print(i+1);%>" class="cl" onclick="location.href='TalentDetail.learn?product_num=<%= articleList.get(i).getProduct_num()%>'">
								<div class="right_area">
									<a href="javascript:;" class="icon heart" onclick="location.href='TalentLikeIn.learn?email=<%= (String)session.getAttribute("Email")%>&product_num=<%= articleList.get(i).getProduct_num()%>'">
									<img src="image/heart1.png" alt="찜하기">
									</a>
								</div>
								<div class="right_area" style="display: none">
									<a href="javascript:;" class="icon heart" onclick="location.href='TalentLikeDel.learn?email=<%= (String)session.getAttribute("Email")%>&product_num=<%= articleList.get(i).getProduct_num()%>'">
									<img src="image/heart2.png" alt="찜하기 완료">
									</a>
								</div>
							</div>
							<div class="nick"><%= articleList.get(i).getNickname()%></div>
							<div class="title" onclick="location.href='TalentDetail.learn?product_num=<%= articleList.get(i).getProduct_num()%>'"><%= articleList.get(i).getTitle()%></div>
							<div class="money"><%= df.format(articleList.get(i).getPrice())%>원</div>
							<div class="review">
								<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
									평가</span>
							</div>
						</article>
						<%
							}
						%>

					</div>
				</section>
				<section id="s3">
					<%
						if (nowPage <= 1) {
					%>
						<a><</a>
					<%
						} else {
					%>
					<a href="TalentList.learn?page=<%=nowPage-1%>&category=<%=category%>"><</a>
					<%} %>

					<%
						for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
					%>
					<a><%=a%></a>
					<%
							} else {
					%>
						<a href="TalentList.learn?page=<%=a%>&category=<%=category%>"><%=a%>
						</a>
					<%
							}
					%>
					<%
							}
					%>

					<%
							if (nowPage >= maxPage) {
					%>
						<a>></a>
					<%
							} else {
					%>
						<a href="TalentList.learn?page=<%=nowPage + 1%>&category=<%=category%>">></a>
					<%
							}
					%>
				</section>
			</div>
			<div id="foottt">
				<div id="lo3">
					<div class="ftd" style="width: 220px; margin-left: 0px;">
						<h3>인기 서비스</h3>
						<h4>
							<div>
								<span>
									<%
										if (category.equals("1")) {
											out.print("디자인");
										} else if (category.equals("2")) {
											out.print("IT·프로그래밍");
										} else if (category.equals("3")) {
											out.print("영상·사진·음향");
										} else if (category.equals("4")) {
											out.print("마케팅");
										} else if (category.equals("5")) {
											out.print("번역·통역");
										} else if (category.equals("6")) {
											out.print("문서·글쓰기");
										} else if (category.equals("7")) {
											out.print("경영자문·운영지원");
										} else if (category.equals("8")) {
											out.print("주문제작");
										} else if (category.equals("9")) {
											out.print("세무·법무·노무");
										}
									%>의</span>
							</div>
							인기 서비스들을 만나보세요!
						</h4>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/1.jpg" id="talent-25" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/2.jpg" id="talent-26" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/3.jpg" id="talent-27" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/4.jpg" id="talent-28" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
				</div>
				<div id="lo4">
					<div class="ftd" id="new" style="width: 220px; margin-left: 0px;">
						<h3>새로 등록된 서비스</h3>
						<h4>
							<div>
								<span>
									<%
										if (category.equals("1")) {
											out.print("디자인");
										} else if (category.equals("2")) {
											out.print("IT·프로그래밍");
										} else if (category.equals("3")) {
											out.print("영상·사진·음향");
										} else if (category.equals("4")) {
											out.print("마케팅");
										} else if (category.equals("5")) {
											out.print("번역·통역");
										} else if (category.equals("6")) {
											out.print("문서·글쓰기");
										} else if (category.equals("7")) {
											out.print("경영자문·운영지원");
										} else if (category.equals("8")) {
											out.print("주문제작");
										} else if (category.equals("9")) {
											out.print("세무·법무·노무");
										}
									%>의</span>
							</div>
							신규 서비스들을 만나보세요!
						</h4>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/20.jpg" id="talent-29" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/12.jpg" id="talent-30" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/15.jpg" id="talent-31" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
					<div class="ftd com">
						<div>
							<img src="image/talentimage/24.jpg" id="talent-32" class="cl">
							<div class="right_area">
								<a href="javascript:;" class="icon heart"> <img
									src="image/heart1.png" alt="찜하기">
								</a>
							</div>
						</div>
						<div class="nick">강아지전문가</div>
						<div class="title">우리 강아지의 행복지수 높이는 방법을 알려 알려 알려 알려 알려
							알려드립니다.</div>
						<div class="money">500,000원~</div>
						<div class="review">
							<span class="star">★</span>4.9<span class="bordleft"></span><span>154개의
								평가</span>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp" />
	</form>
</body>
</html>