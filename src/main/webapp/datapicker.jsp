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
        * {
            margin: 0;
            padding: 0;
        }

        .double div {
            float: left;
        }
    </style>
</head>

<body>




 <div class="single">
        <h1>1개 짜리</h1>
        <input id="datepicker"  type="text"   data-multiple-dates="3"/>
    </div>


    <br /><br /><br />
    <div class="double">
        <h1>2개가 연결된거!</h1>
        <input id="datepicker1" type="text"> -
        <input id="datepicker2" type="text">
        
       

</div>
    <div id="main">
        <div>
           <input type="text" id="timepicker">
        </div>
    </div>


    <script>
  var a =  new Date()
    console.log(a.toLocaleDateString('ko-KR', { timeZone: 'Asia/Seoul' }).replace(/\s/g, '').replace(/\./g, '-').slice(0, 9));
  console.log(a.toISOString().slice(0, 10));
  console.log(a.toLocaleDateString('ko-KR', { timeZone: 'Asia/Seoul' }));
    
    $(document).ready(function() {
    	  var disabledDates = ['2023-05-14', '2023-08-25', '2023-09-30'];
    	  $("#datepicker").datepicker({
    	    language: 'ko',
    	    dateFormat: 'yyyy-m-dd', // 날짜 형식 설정
    	    minDate: new Date(),
    	    autoClose: true,
    	    onRenderCell: function(date, cellType) {
    	      var formattedDate = date.toISOString().slice(0, 10);
    	      if (cellType === 'day' && disabledDates.includes(formattedDate)) {
    	        return {
    	          disabled: true,
    	          class: 'disabled',
    	          tooltip: '클릭할 수 없습니다.'
    	        };
    	      }
    	    }
    	  });
    	});
    
    
    
    $('#timepicker').timepicker({
    	 timeFormat: 'H:mm',  // 24시간 형식으로 시간 표시 (예: 10:30)
    	    interval: 60,
    	    minTime: '1:00',  // 최소 시간 설정
    	    maxTime: '24:00',  // 최대 시간 설정
    	    dynamic: false,
    	    dropdown: true,
    	    scrollbar: true,
    	 
    	});
    
    
    
    var availableDates = ["2015-01-01", "2015-01-13"];

	

	function available(date) {

		

		var thismonth = date.getMonth()+1;

		var thisday = date.getDate();

		

		if(thismonth<10){

			thismonth = "0"+thismonth;

		}

		

		if(thisday<10){

			thisday = "0"+thisday;

		}

	    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;



	    if ($.inArray(ymd, availableDates) >= 0) {

	        return [true,"",""];

	    } else {

	        return [false,"",""];

	    }

	}
    
        //한개만 단순하게 만들때

        



        //두개짜리 제어 연결된거 만들어주는 함수
        datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

        /*
            * 달력 생성기
            * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
            * @example   datePickerSet($("#datepicker"));
            * 
            * 
            * @param sDate, 
            * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
            * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
            */
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
                    timepicker: true,
                    timeFormat: "hh:ii AA",
                    format: "",
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
                if (!isValidStr(sDay)) {
                    eDate.datepicker({
                        minDate: new Date(sDay.replace(/-/g, "/"))
                    });
                }
                eDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                //한개짜리 달력 datepicker
            } else if (!isValidStr(sDate)) {
                var sDay = sDate.val();
                if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
                    var sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
                }

                sDate.datepicker({
                    language: 'ko',
                    autoClose: true
                });
            }


            function isValidStr(str) {
                if (str == null || str == undefined || str == "")
                    return true;
                else
                    return false;
            }
        }
    </script>
</body>

</html>