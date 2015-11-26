<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<style>
#member_chart{
	width:400px;
	height: 400px;
	
}
#member_list{
	margin-left : 30px;
	
}

#member_chart2{
	width:400px;
	height: 400px;
	
}
</style>

<script>
$(function () {
    $('#member_chart').highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: '성별or월별가입자'
        },
        subtitle: {
            text: 'Source: WorldClimate.com'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });
});

$(function () {
    $('#member_chart2').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Contents of Highsoft\'s weekly fruit delivery'
        },
        subtitle: {
            text: '3D donut in Highcharts'
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: 'Delivered amount',
            data: [
                ['Bananas', 8],
                ['Kiwi', 3],
                ['Mixed nuts', 1],
                ['Oranges', 6],
                ['Apples', 8],
                ['Pears', 4],
                ['Clementines', 4],
                ['Reddish (bag)', 1],
                ['Grapes (bunch)', 1]
            ]
        }]
    });
});

</script>

<table>
<!-- 1번 째 줄 -->
<tr>
<td><div id="member_chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div></td>
<td><!-- <div id="member_list"> -->
	<table class="table table-striped">
		<thead class="table table-striped">
			<tr>
				<th colspan="8">회원 정보</th>
			</tr>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>EMAIL</td>
				<td>PWD</td>
				<td>BIRTH</td>
				<td>TEL</td>
				<td>ADDR</td>
				<td>SINGO</td>
			</tr>
			
		</thead>
		
		<tbody>
			<c:forEach var="listv" items="${list }">
			<tr>
				<td>${listv.mid }</td>
				<td>${listv.mname }</td>
				<td>${listv.memail }</td>
				<td>${listv.mpwd }</td>
				<td>${listv.mbirth }</td>
				<td>${listv.mtel }</td>
				<td>${listv.mroad }</td>
				<td>${listv.mrpt }</td>
			</tr>
			</c:forEach>
		</tbody>
		
		<tfoot>
		</tfoot>
	</table>
<!-- </div> -->
</td>
</tr>
<!-- 2번째 줄 -->
	<tr>
	<td><div id="member_chart2" ></div></td>
	</tr>
</table>


