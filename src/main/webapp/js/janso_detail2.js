

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



$(document).ready(function(){


const calendarDays = document.querySelectorAll(".calendar_days"),
calendarTitle = document.querySelector(".ctitle"),
leftButton = document.querySelector(".left_button"),
rightButton = document.querySelector(".right_button"),
calendar = document.querySelector(".calendar");
// dateUpdate = document.querySelector(".date_update");

let monthmonster;
let yearmonster;
let firstSelectedDay = 0;
let lastSelectedDay = 0;
 



//const UNAVAILABLE_DATES = [new Date(2023, 4, 26), new Date(2023, 5, 27), new Date(2023, 4, 30)]; // 예약 불가 날짜
let UNAVAILABLE_DATES = [];
//let selectedDate = null;

class Calendar {
	constructor(year, month) {
	    this.today = new Date(year, month);
	    this.year = this.today.getFullYear(),
	    this.month = this.today.getMonth(),
	    this.date = this.today.getDate(),
	    this.day = this.today.getDay()
	}

	
	getFirstDay() {
	    const firstDate = new Date(this.year, this.month);
	    return firstDate.getDay();
	}
	alert
	getLastDay() {
	    let wholeDays = [];
	    if ((this.year % 4 === 0 && this.year % 100 !== 0) || (this.year % 400 === 0)) {
	        wholeDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	    } else {
	        wholeDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	    }
	    return wholeDays[this.month];
	}
	
	fillCalendar() {
	    this.initCalendar();
	    calendarTitle.innerHTML = `${this.year}년 ${this.month + 1}월`;
	    yearmonster = this.year;
	    monthmonster = this.month+1;
	    
	    
    	const today = new Date();
	    const firstDay = this.getFirstDay();
	    const lastDay = this.getLastDay();
	    let day = 1;
	    

	    for (let i = firstDay; i < calendarDays.length; i++) {
	
			if (day <= lastDay) {
	        const date = new Date(this.year, this.month, day);
            const button = document.createElement('button');
            button.classList.add('day_button');
            
        
	         const isUnavailable = UNAVAILABLE_DATES.some((d) => {
	         return date.getTime() === d.getTime();
	         });
	         
	          
	         if (date < today) {
             button.disabled = true;  // 현재 날짜보다 이전인 경우 버튼 비활성화
            }
            
          	if(isUnavailable) {
            calendarDays[i].innerHTML = `<button class="day_button unavailable"  disabled=true>예약불가</button>`;
          	} else {
            button.innerText = day;
            calendarDays[i].appendChild(button);
         	}
            day++;
        	}
	         	  
   	 } 
	}
	
	initCalendar() {
	    calendarDays.forEach((e) => {
	        e.innerHTML = "";
	    });
	}
	
	
	drawCalendar() {
	    let change = 0;
	   
	    const today = new Date();
	    let calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);

	    calendarInstance.fillCalendar();
	
	    leftButton.addEventListener("click", (e) => {
	        e.stopPropagation();
	        change--;

	        calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);
	        calendarInstance.fillCalendar();
	        this.updateCalendarStyle();
	       	       
	    });
	    rightButton.addEventListener("click", (e) => {
	        e.stopPropagation();
	        change++;
	        calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);
	        calendarInstance.fillCalendar();
	        this.updateCalendarStyle();
	    });
	}
	
	
	updateCalendarStyle() {
	    const dayButtons = document.querySelectorAll(".day_button");
	  
	    let clickCount = 0;
	
	    // 달력 스타일 초기화
	    dayButtons.forEach((element) => {
	        element.classList.remove("day_selected");
	        calendarDays.forEach((e) => e.classList.remove("gray"));
	    })
	
	
	    // 달력 날짜들에 클릭 이벤트 추가
	    dayButtons.forEach((element) => {
	        element.addEventListener("click", (event) => {
	            event.target.classList.toggle("day_selected");
	
	            clickCount++;
	
	            // 선택 일자 타입 변환
	            if (firstSelectedDay === 0) {
	                firstSelectedDay = Number(event.target.innerText);
	            } else {
	                lastSelectedDay = Number(event.target.innerText);
	            }
	
	            // 클릭 횟수 2회 넘어가면 달력 스타일 초기화
	            if (clickCount > 2) {
	                dayButtons.forEach((e) => {
	                    e.parentNode.classList.remove("gray");
	                    e.classList.remove("day_selected");
	                    clickCount = 0;
	                    firstSelectedDay = 0;
	                    lastSelectedDay = 0;
	                });
	            }
	            
	            // 선택 일자 사이에 회색 배경 적용
	            if (firstSelectedDay !== 0 && lastSelectedDay !== 0) {
	                dayButtons.forEach((e) => {
	                    const day = Number(e.innerText);
	                    if (day >= firstSelectedDay && day <= lastSelectedDay) {
	                        e.parentNode.classList.toggle("gray");
	                    }
	                });
	            }
	
	            // 선택 일자 중 왼쪽값이 오른쪽 값보다 크면 회색 배경 삭제 
	            if (firstSelectedDay > lastSelectedDay) {
	                dayButtons.forEach((e) => {
	                    e.parentNode.classList.remove("gray");
	                });
	            }
	           
	            if(clickCount == 2)
	            {
				console.log(yearmonster);
	   			console.log(monthmonster);
	            console.log(firstSelectedDay);  //내가고른 예약 시작 일수
	            console.log(lastSelectedDay);   //내가고른 예약 시작 끝날
	          	console.log(roomsnums);
	          	
	          	
	          	var yearobj = $("#yearsmonster");
	          	yearobj.val(yearmonster);
	          	
          	 	var monthobj = $("#monthsmonster");
          		monthobj.val(monthmonster);
          			
          	 	var firstobj = $("#firstmonster");
          		firstobj.val(firstSelectedDay);
          	
          	 	var lastobj = $("#lastsmonster");
	          	lastobj.val(lastSelectedDay);
	          	
	          	var da =document.getElementById("sub");
	        
	          	
	          	 //var URL = "페이지 주소.jsp?name= "+name +"&year=" + year
	          	//learnup/janso_detail.learnup.com?roomnumber=47
	         	//var URL = "janso_detail.learnup.com?roomnumber=47"
				//var rtnVal = window.showModalDialog(URL, "", "dialogWidth:0; dialogHeight:0; help:no; status:no;");
	          	}
	        });
	    });
	
	
	    // 달력 날짜들에 호버링 이벤트 추가
	    dayButtons.forEach((element) => {
	        element.addEventListener("mouseenter", (event) => {
	            event.target.classList.add("day_hover")
	        });
	    });
	
	    dayButtons.forEach((element) => {
	        element.addEventListener("mouseleave", (event) => {
	            event.target.classList.remove("day_hover")
	        });
	    });
	}
	
	 
	
	handleEvents() {
	    this.drawCalendar();
	    this.updateCalendarStyle();
	}

}

const cal = new Calendar();
cal.handleEvents();

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



