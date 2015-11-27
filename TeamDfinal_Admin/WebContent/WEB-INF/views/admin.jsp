<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<style>
#cal_detail{width:300px; height:300px; }


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




var caljson;
var last_seq;
$(function(){
	//관리자 사용자 공통
	//사용자 추가사항해야할것 - 로드하면서 신청한거 빨간색으로 바꿔주기?
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
		
		var currentLangCode = 'ko';
		$('#cal_detail').fullCalendar('destroy');
		$('#cal_detail').fullCalendar({
					
					//lang: currentLangCode,
					dragable : false, //드래그앤 드랍 옵션
					timeFormat : 'hh:mm', //시간 포멧
					// lang: 'ko',  //언어타입
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay'
					},
					
					
					// 클릭이벤트 - 삭제
					//관리자용+사용자용
					eventClick : function(calEvent, jsEvent, view) {
						
						
						
						
					},
					
					
					
					//관리자 기능.
					//인서트
					defaultView : 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
					editable : false, //에디터 가능 옵션
					selectable : true,
					selectHelper : true,
					select : function(start, end, event) {// 캘린더 셀렉트 된 값을 컬럼에 표시...
					
					},
					
					//둘다 필요한 부분.
					//처음에 디비에서 끌어오는 부분
				    editable : true,
					eventLimit : true,
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

<div id="wrap">
<table id="chart_table">
	<tr>
		<td><div class="chart" id="container" ></div></td>
		<td><div class="chart" id="container1"></div></td>
		<td><div class="chart" id="container2"></div></td>
		<td><a href="formCal"><div id='cal_detail'></div></a></td>
	</tr>
</table>

<!-- <div id='cal_detail' ></div> -->
<!-- <div class="chart" id="container" ></div> -->
<!-- <div class="chart" id="container1"></div> -->
<!-- <div class="chart" id="container2"></div> -->

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
