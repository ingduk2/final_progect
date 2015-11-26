<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script
 src='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.1/lang-all.js'></script>

<style>
	
</style>

<script>
$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'a'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                },
                 events:{
                  click: function (event, i) {
                     alert(event.point.name);
                     location.href='chart1.jsp'
                  }
              }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'M',
                y: 56.33
            }, {
                name: 'C',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: 'F',
                y: 10.38
            }, {
                name: 'S',
                y: 4.77
            }, {
                name: 'O',
                y: 0.91
            }, {
                name: 'z',
                y: 0.2
            }]
        }]
    });
});

$(function () {
    $('#container1').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'b'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Firefox', 45.0],
                ['IE', 26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari', 8.5],
                ['Opera', 6.2],
                ['Others', 0.7]
            ]
        }]
    });
});


$(function () {
    $('#container2').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'c'
        },
        subtitle: {
            text: 'c'
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tokyo',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }, {
            name: 'New York',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

        }, {
            name: 'London',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

        }, {
            name: 'Berlin',
            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

        }]
    });
});


$(function(){
	  
	  var currentLangCode = 'ko';
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
	   
	   //lang: currentLangCode,
	   dragable:false,  //드래그앤 드랍 옵션
	            timeFormat: 'hh:mm', //시간 포멧
	           // lang: 'ko',  //언어타입
	            header: {
	     left: 'prev,next today',
	     center: 'title',
	     right: 'month,agendaWeek,agendaDay'
	      },
	      // 클릭이벤트 - 삭제 
	            eventClick : function(calEvent,jsEvent,view){ 
	              var r=confirm("Delete " + 
	                calEvent.title+":"+calEvent._id);
	              if (r===true)
	                {
	                    $('#calendar').fullCalendar('removeEvents', 
	                      calEvent._id);
	                    //관리자 ajax로 페이지나 action 매핑된거 연결해서 dao 불러서 delete보내기
	                    
	                    //사용자가 클릭하면 
	                    /*
	                    클릭하면 이 회원의 디비에 접속해서
			봉사컬럼이 null인지 비교하고
			null이면 신청하시겠습니까
			아니면 삭제하시겠습니까		

			신청하시겠습니까
			-> 회원테이블에 봉사컬럼에 +
			->update
		
			삭제하시겠습니까
			->회원테이블 봉사컬럼을 다시
			-> null이나 0으로 바꿔줌
	                    */
	                    
	                    
	                    $.ajax({
	                        url: "testAjax.jsp",
	                        type: "GET",
	                        data: { //파라미터로 q
	                            q: calEvent.title
	                        },
	                        dataType: "html",
	                        success: function(q) {
	                            alert("delete: " + q);
	                            var v=q.split(".");
	                            alert("seqseqseq : "+v[0]);
	                        },
	                        error: function(a, b) {
	                            alert("Request: " + JSON.stringify(a));
	                        }
	                    });
	                    ////////////////////////
	                }
	             },
	   defaultView: 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
	   editable: false,                                             //에디터 가능 옵션
	   selectable: true,
	   selectHelper: true,
	   // 캘린더 셀렉트 된 값을 컬럼에 표시...
	   select: function(start, end, event) {
	    
	    var title = prompt('Event Title:'); //값 입력.
	    var eventData;
	    if (title) {
	     eventData = {
	      title: title,
	      start: start,
	      end: end
	     };
	     
	    $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
	    }
	    $('#calendar').fullCalendar('unselect');
	    
	    alert("selected from: " + start.format() + ", to: " + end.format());
	    //alert(calEvent._id);
	     // 셀렉트된 결과를 서버로 전송
	     //인서트에 사용. 
	          $.ajax({
	              url: "testAjax.jsp",
	              type: "GET",
	              data: { //파라미터로 q
	                  q: title
	                 //title start end 
	              },
	              dataType: "html",
	              success: function(q) {
	                  alert("Data-: " + q);
	                  alert("pk-: "+pk);
	              },
	              error: function(a, b) {
	                  alert("Request: " + JSON.stringify(a));
	              }
	          });
	   },
	   editable: true,
	   eventLimit: true,
	   //load 하는 부분 ! , db에서 읽어오면 된다.
	   events: [  
	     {
	        
	        title: 'All Day Event',
	       start: '2015-10-22',
	       end: '2015-10-25'
	      
	      }
	     ]
	  })
	 });

</script>

<div id="wrap">
<table id="chart_table">
	<tr>
		<td><div class="chart" id="container" ></div></td>
		<td><div class="chart" id="container1"></div></td>
		<td><div class="chart" id="container2"></div></td>
		<td><a href="#"><div id='calendar' style="width:300px; height:280px;"></div></a></td>
	</tr>
</table>

<table id="list_table">
	<tr>
		<td><table>
			<thead>
				<tr>
				<th colspan="4">test1</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- 이터레위터 -->
				<tr>
					<td>배</td><td>고</td><td>프</td><td>다</td>
				</tr>
				<tr>
					<td>배</td><td>고</td><td>프</td><td>다</td>
				</tr>
				<tr>
					<td>배</td><td>고</td><td>프</td><td>다</td>
				</tr>
				<tr>
					<td>배</td><td>고</td><td>프</td><td>다</td>
				</tr>
			</tbody>
			
			<tfoot>
			</tfoot>
		</table></td>
		
		<td></td>
	</tr>
</table>
</div>
