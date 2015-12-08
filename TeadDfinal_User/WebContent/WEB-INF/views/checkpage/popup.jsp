<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TeamD</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
	#allbg{
		background-image: url('http://cfile25.uf.tistory.com/image/203F8F335021021C1996EB');
		background-repeat: no-repeat;
		width: 100%;
		height: 100%;
		background-size:100% 100%;
	}
	.jumbotron{
		margin: 10px;
		border-radius: 5px;
		background-color: rgba( 208, 210, 208, 0.9 );
		padding: 30px;
		font-size:12px;
	}
	.h1, .h2, .h3, h1, h2, h3{
		margin-top: 3px;
		margin-bottom: 3px;
	}
	hr{
		margin-top: 0px;
		margin-bottom: 3px;
		border: 0;
		border-top: 1px solid #eee;
	}
	.table {
		width: 80%;
		max-width: 100%;
		margin-bottom: 5px;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		padding: 3px;
	}
	ol, ul{
		margin-bottom: 1px
	}
</style>
<script>
	function fin() {
		window.close();
	}
	
	
	function userIp() {
	    var xip = location.host;
	    document.getElementById("uip").innerHTML = xip;
	}
	
	function checksubmit() {
		if(document.survey.radio.value==""){
			alert("투표를 입력해 주세요")
			return false
		}
	}
	
</script>
</head>
<body>
<div>
<div id="allbg">
	<div class="jumbotron">
		${v.content }
		
	   <font size="3px">&nbsp; ${v.sub }</font>
	   <p><p><p>
	   <form onsubmit="return checksubmit()" name="survey" method="post" action="surveyUpdate"> 
	   <input type="hidden" name="num" value="${v.num }"> 
	 
		<ul>
			<li><input id="radio" type="radio" name="surveychk" value="1">${v.sub1 }</li>
			<li><input id="radio" type="radio" name="surveychk" value="2">${v.sub2 }</li>
			<li><input id="radio" type="radio" name="surveychk" value="3">${v.sub3 }</li>
		</ul>
		
	    <span style="color: red">
	    	<strong>※ 본 설문조사는 로그인이 필요없는 열린방식으로 진행하고</br>
	    	  동일IP에서 중복투표를 방지하여 유의성을 제고합니다.
	    	</strong> 
	    </span>
	    <button type="submit" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%" onclose="">투표하기</button>
	   </form>  
	 </div>
</div>
</body>
</html>