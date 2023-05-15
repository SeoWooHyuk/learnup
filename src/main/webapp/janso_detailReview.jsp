<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>리뷰 </title>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>


<style>
 /*평점*/
.star_junsu{
   
    text-align: center;
    border-style: none;
}
.star_junsu_title{
	font-size:13pt;
	font-weight:bold;
}

fieldset,
label {
  margin: 0;
  padding: 0;
}

/****** Style Star Rating Widget *****/

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
  margin: 5px;
  font-size: 1.75em;
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

/***** CSS Magic to Highlight Stars on Hover *****/


</style>
</head>
<body>
<section id="writeForm">
  
		<form action="janso_detailreviewin.learnup.com" method="post" name="boardform">
		<div class="star_junsu_title">이용후기<span style="color: blue">5</span>개 <span class="dot"></span> 평균평점<span style="color: blue">5</span>점 <input type="submit" value="답변글등록" style="float: right;"/></div>  
			<input type="hidden" name="page" value="" />
			<input type="hidden" name="BOARD_NUM" value="">
			<input type="hidden" name="BOARD_RE_REF" value=""> 
			<input type="hidden" name="BOARD_RE_LEV" value="">
			<input type="hidden" name="BOARD_RE_SEQ" value="">
			
			<table border="1">
			
			
			<thead>
			<tr>
			<td colspan="2" rowspan="2">  <img src="${pageContext.request.contextPath }/jansoproduct/${room.sub_img1}" " style="width: 150px; height: 150px"></td>
			<td colspan="2" style="width: 150px; height: 50px;">닉네임</td>
			<td style="width: 400px">
			    <div class="star_junsu">
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
			
			
			</td>
			</tr>
			<tr>
			<td colspan="3" ></td>
			</tr>
			</thead>
			</table>
			<section id="commandCell">
				 
			
			</section>
		</form>
	</section>
</body>

</html>