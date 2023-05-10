$(document).ready(function(){
	
var selectedDate = ['2023-05-16']; // 선택한 날짜를 저장할 변수
var disabledDays = [0,1]; // 비활성화할 특정 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)	
//두개짜리 제어 연결된거 만들어주는 함수
datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
function datePickerSet(sDate, eDate, flag) {

    //시작 ~ 종료 2개 짜리 달력 datepicker	
    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
        var sDay = sDate.val();
        var eDay = eDate.val();

        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

            var edp = eDate.datepicker().data("datepicker");
            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
        }

        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(eDay)) {
            sDate.datepicker({
                maxDate: new Date(eDay.replace(/-/g, "/"))
            });
        }
        sDate.datepicker({
            language: 'ko',
            dateFormat: 'yy-mm-dd',
            minDate: new Date(),
           
            autoClose: true,
            onSelect: function () {
            datePickerSet(sDate, eDate);
            },
            onRenderCell: function(date, cellType) {
		      if (cellType === 'day') {
		        var day = date.getDate();
		        var month = date.getMonth() + 1;
		        var year = date.getFullYear();
		        var formattedDate = year + '-' + month + '-' + day;
		
		        // 선택한 날짜와 비활성화할 특정 요일을 동시에 체크
		        if (formattedDate === '2023-05-16' || disabledDays.indexOf(date.getDay()) !== -1) {
		          return {
		            disabled: true
		          };
		        }
		      }
		    },
		    

	    
        });

        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(sDay)) {
            eDate.datepicker({
                minDate: new Date(sDay.replace(/-/g, "/"))
            });
        }
        eDate.datepicker({
           language: 'ko',
            minDate: new Date(),
              timepicker: true,
   		 timeFormat: "hh:ii AA",
            autoClose: true,
            onSelect: function () {
            datePickerSet(sDate, eDate);
            },
            onRenderCell: function(date, cellType) {
		      if (cellType === 'day') {
		        var day = date.getDate();
		        var month = date.getMonth() + 1;
		        var year = date.getFullYear();
		        var formattedDate = year + '-' + month + '-' + day;
		
		        // 선택한 날짜와 비활성화할 특정 요일을 동시에 체크
		        if (selectedDate.indexOf(formattedDate) !== -1 || disabledDays.indexOf(date.getDay()) !== -1) {
		          return {
		            disabled: true
		          };
		        }
		      }
		    },
		    onSelect: function(formattedDate, date, inst) {
		      selectedDate = formattedDate; // 선택한 날짜를 저장
		    }

	    
        });

    }


    function isValidStr(str) {
        if (str == null || str == undefined || str == "")
            return true;
        else
            return false;
    }
}

});
//달력

//오토슬라이드
$(document).ready(function(){

	$(function(){        
	    var slideCount = $('.slider ul li').length;
	    var slideWidth = $('.slider ul li').width();
	    var slideHeight = $('.slider ul li').height();
	    var sliderUlWidth = slideCount * slideWidth;
	    
	    $('.slider').css({ width: slideWidth, height: slideHeight });
	    
	    $('.slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	    
	    $('.slider ul li:last-child').prependTo('slider ul');
	
	    function moveLeft() {
	        var slideWidth1 = $('.slider ul li').width();
	        $('.slider ul').stop().animate({
	            left: + slideWidth1
	        }, 500, function () {
	            $('.slider ul li:last-child').prependTo('.slider ul');
	            $('.slider ul').css('left', '');
	        });
	    };
	
	    function moveRight() {
	        var slideWidth1 = $('.slider ul li').width();
	        $('.slider ul').stop().animate({
	            left: - slideWidth1
	        }, 500, function () {
	            $('.slider ul li:first-child').appendTo('.slider ul');
	            $('.slider ul').css('left','');
	        });
	    };
	    
	    $(".control_next").stop().click(function () {
	             moveRight();
	     });
	     
	      $(".control_prev").stop().click(function () {
	                moveLeft();
	      });
	 
	});

});

//움지이는 바 클릭시 이동

$(document).ready(function(){

	var height = $("#intro1").offset(); 
	var height1 = $("#intro2").offset();  
	var height2 = $("#intro3").offset(); 
	var height3 = $("#intro4").offset(); 
	var height4 = $("#intro5").offset(); 
	var height5 = $("#intro6").offset(); 

	$("#la").click(function()
	{
		$("html, body").animate({scrollTop: height.top - 210 }, 300);
	});
	
	$("#lb").click(function()
	{
		$("html, body").animate({scrollTop: height1.top - 210 }, 300);
	});
	
	$("#lc").click(function()
	{
		$("html, body").animate({scrollTop: height2.top - 210 }, 300);
	});
	
	$("#ld").click(function()
	{
		$("html, body").animate({scrollTop: height3.top - 210 }, 300);
	});
	
	$("#le").click(function()
	{
		$("html, body").animate({scrollTop: height4.top - 210 }, 300);
	});
	
	$("#lf").click(function()
	{
		$("html, body").animate({scrollTop: height5.top - 210 }, 300);
	});

});	



/*결제 후 바로 예약확정 빨간불 영역 */
$(document).ready(function() {
	setInterval(function() {
		$('h3#righth3').toggleClass('red');
	}, 700);
});


//다음 주소 api
$(document).ready(function() {
	
	console.log(chDate);
	console.log(rooms);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(chDate, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+rooms +'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    



//인원수 체크
  $(document).ready(function() {
    function InputNumber(element) {
      this.$el = $(element);
      this.$input = this.$el.find("[type=text]");
      this.$inc = this.$el.find("[data-increment]");
      this.$dec = this.$el.find("[data-decrement]");
      this.min = this.$el.attr("min") || false;
      this.max = this.$el.attr("max") || false;
      this.init();

    }

    InputNumber.prototype = {
      init: function () {
        this.$dec.on("click", $.proxy(this.decrement, this));
        this.$inc.on("click", $.proxy(this.increment, this));
      },

      increment: function (e) {
        var value = this.$input[0].value;
        value++;
        if (!this.max || value <= this.max) {
          this.$input[0].value = value++;
        }
      },

      decrement: function (e) {
        var value = this.$input[0].value;
        value--;
        if (!this.min || value >= this.min) {
          this.$input[0].value = value;
        }
      }
    };

    $.fn.inputNumber = function (option) {
      return this.each(function () {
        var $this = $(this),
          data = $this.data("inputNumber");

        if (!data) {
          $this.data("inputNumber", (data = new InputNumber(this)));
        }
      });
    };

    $.fn.inputNumber.Constructor = InputNumber;

    $(".input-number").inputNumber();
  });
  
  
$(document).ready(function() {
  var persons;
  
$('#input-number-decrement, #input-number-increment').on('click', function() {
    persons = $('#person').val(); 
     
    var pprice =  personnel_price.replace(",", "");  
    var rprice =  room_price.replace(",", "")*1;  
    var totalPriced1 =  rprice + pprice * persons;

    $("#priceto").empty();
    $('#priceto').append(totalPriced1);
  });
  

});
  
  
  function calculateTotalPrice() {
  var hourPrice = parseInt($('#hourprice').val().replace(/,/g, '')); // 시간당 가격, 쉼표 제거
  var classTime = parseFloat($('#classtime').val().replace(/,/g, ''));
  var totalClassCount = parseInt($('#totalclasscount').val());
 
  var totalPrice = hourPrice + (classTime * totalClassCount);
 

  $('#totalprice').val(numberWithCommas(totalPrice)); // 최종 수강료에 쉼표 추가

}




});



