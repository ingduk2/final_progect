<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<link rel='stylesheet'
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/cupertino/jquery-ui.min.css' />
<link
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.css'
	rel='stylesheet' />
<link
	href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/moment.min.js'></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.1/lang-all.js'></script>
<style>
.fc-toolbar{
	width:900px;
	margin:auto;
}
.fc-view-container{
	width:900px;
	margin:auto;
}
</style>
<script>

var caljson;
var last_seq;
$(function(){
	
	 $.ajax({
        url: "selectallCal", //"testAjax.jsp", 
        type: "POST",
        success: function(json) { //데이터 받는 부분.response 
          
     		//alert(json);
     		caljson=JSON.parse(json);
     		//alert(caljson);
     		callendar();
     		
     		
        },
        error: function(a, b) {
            alert("Request: " + JSON.stringify(a));
        }
    });
	 
	 
	 
});

function callendar(){
	//$(function(){
		
		//alert("??"+caljson);

// 		var array=[{title : 'All Day Event',
// 					start : '2015-11-16',
// 					end : '2015-11-17',
// 					backgroundColor : 'green'}];
		
		
		var currentLangCode = 'ko';
		$('#calendar').fullCalendar('destroy');
		$('#calendar').fullCalendar({
					
					//lang: currentLangCode,
					//dragable : false, //드래그앤 드랍 옵션
					
					timeFormat : 'hh:mm', //시간 포멧
					// lang: 'ko',  //언어타입
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month'
					},
					
					
					disableDragging: false,
					defaultView : 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
					editable : false, //에디터 가능 옵션
					selectable : true,
					selectHelper : true,
					eventLimit : true,
					
					// 클릭이벤트 - 삭제
					//관리자용+사용자용
					
					eventClick : function(calEvent, jsEvent, view) {
						
						var username=$('#name').val();
						//alert("username -- "+username);
						var eve=$(this);
						//사용자 나중에 분리할것임
						//}else{
							//신청했는지 아닌지 구분 한 후에 자바에서 구분하자.
							$.ajax({
								        url: "insertdeleteCal", //"testAjax.jsp", 
								        type: "POST",
								        data: { //파라미터로 q
							                 memid : username,
							                 volunteerno : calEvent.title.split(".")[0]
							                 //title start end 
							                 
							              },
								        success: function(msg) { //데이터 받는 부분.response 
								     		//alert("--"+msg+"--");
								        	if(msg=='delete'){
								        		alert("취소되었습니다.");
								 
								        		eve.css('background-color', 'green');
								        	}else{
								        		alert("신청되었습니다.");
								        		eve.css('background-color', 'red');
								        	}
								        
								        },
								        error: function(a, b) {
								            alert("Request: " + JSON.stringify(a));
								        }
								    });
							
							
							
// 							$(this).css('background-color', 'red');
						//}
						
						
					},
					
					//마우스 오버 이벤트
// 					eventMouseover: function( calEvent, jsEvent, view ) { 
// 						alert('Event: ' + calEvent.title);
// 					},
					
					
					//사용자
					//사용자 색 바꾸기.
// 					 eventClick: function(calEvent, jsEvent, view) {

// 					    },
					
					
				
					
// 					select : function(start, end, event) {// 캘린더 셀렉트 된 값을 컬럼에 표시...

// 						var title = prompt('Event Title:'); //값 입력.
// 						var eventData;
// // 						alert("selected from: " + start.format() + ", to: "
// // 								+ end.format()); 
// 						 $.ajax({
// 				              url: "insertCal", //"testAjax.jsp", 
// 				              type: "POST",
// 				              data: { //파라미터로 q
				            	  
// 				                  volunteertitle : title,
// 				                  volunteerstart : start.format(),
// 				                  volunteerend : end.format()
// 				                 //title start end 
// 				              },
// 				              dataType: "html",
// 				              success: function(msg) { //데이터 받는 부분.response
// 				                  alert(msg);
// 				                  if (title) {
// 										eventData = {
// 											title : msg+'.'+title,
// 											start : start,
// 											end : end,
// 											backgroundColor : 'green'
// 										};

// 										$('#calendar').fullCalendar('renderEvent',
// 												eventData, true); // stick? = true
// 									}
// 				              },
// 				              error: function(a, b) {
// 				                  alert("Request: " + JSON.stringify(a));
// 				              }
// 				          });
// 						 $('#calendar').fullCalendar('unselect');
// 					},
					
//					날짜 클릭
// 					dayClick: function(date, jsEvent, view) {
// 				        alert('Clicked on: ' + date.format());
// 				        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
// 				        alert('Current view: ' + view.name);
// 				        // change the day's background color just for fun
// 				        $(this).css('background-color', 'red');
// 				        alert("json"+array);

// 				    },
				    
				
					
					
					//둘다 필요한 부분.
					//처음에 디비에서 끌어오는 부분
				   
					//load 하는 부분 ! , db에서 읽어오면 된다.
// 					events : [
// 					{
// 						title : 'All Day Event',
// 						start : '2015-11-16',
// 						end : '2015-11-17'

// 					} ]
					
					events : caljson
				})
	//});
}
</script>

	<div id='calendar'>
<!-- 	<input type="hidden" id="name" name="name" value="admin"> -->
	<input type="hidden" id="name" name="name" value="${pageContext.request.userPrincipal.name}">
	</div>