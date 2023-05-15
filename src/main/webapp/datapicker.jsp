<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>air datepicker</title>
  
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css">
	
 
    <script src="js/datepicker.ko.js"></script>

	
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.js"></script>

<style>


body {margin:0;}

.review-list {
  .review{
    .header {
      height: 60px;
      line-height: 60px;
      overflow: hidden;
      label {
        margin-left: 9px;
        font-size: 16px;
      }
      span {
        float: right;
        margin-right: 10px;
        font-size: 13px
      }
    }
    .item {
      background-color: #eee;
      display: flex;
      display: -webkit-flex;
      position: relative;
      margin-bottom: 9px;
      img {
        margin: 9px;
        width: 100px;
        height: 100px;
      }
      .info {
        flex: 1;
        -webkit-flex: 1;
        h1 {
          font-size: 14px;
          color: #666;
        }
        h2 {
          font-size: 12px;
          color: #666;
        }
        p {
          font-size: 13px;
          i {
            font-style: normal;
            font-size: 16px;
          }
        }
        .btn {
          display: block;
          width: 60px;
          height: 25px;
          line-height: 25px;
          text-align: center;
          border: solid 1px #999;
          border-radius: 2px;
          font-size: 14px;
          float: right;
          margin-right: 20px;
        }
      }
    }
  }
} 

</style>
</head>
<body>

<div class="review-list">
  <div class="review">
    <div class="item">
      <img src="https://img.alicdn.com/bao/uploaded/i4/TB1ownfKpXXXXbYXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg" style="width: 25px; height: 25px" />
      <div class="info">
        <h1>三星手机全网通</h1>
        <h2>三星手机全网通</h2>
        <p>共1件商品 合计：&yen;<i>99</i>.80 (含运费&yen;0.00)</p>
        <span class="btn">评价</span>
      </div>
    </div>
    <div class="item">
      <img src="https://img.alicdn.com/bao/uploaded/i4/TB1ownfKpXXXXbYXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg" />
      <div class="info">
        <h1>三星手机全网通</h1>
        <h2>三星手机全网通</h2>
        <p>共1件商品 合计：&yen;<i>99</i>.80 (含运费&yen;0.00)</p>
        <span class="btn">评价</span>
      </div>
    </div>
  </div>
  



<!--  ㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇ -->
    <div id="main">
        <div>
           
<input id="timepicker"
       type="text" 
       class = "timepicker"
       name="datetime"
       placeholder = "Time*"
       required/>
       
        </div>
    </div>


    <script>
    
    
    
    $( document ).ready(function() {
        $('input[name="datetime"]').timepicker({
        timeFormat: 'H:mm', 
        minTime: '10:00',
        maxTime: '04:40',
        step: 60, // 15 minutes
        disableTimeRanges: [
            ['10:00','11:00'],
      
        ],
        // showDuration: true
        });
    });
    </script>
</body>

</html>