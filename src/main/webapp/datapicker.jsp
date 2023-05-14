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