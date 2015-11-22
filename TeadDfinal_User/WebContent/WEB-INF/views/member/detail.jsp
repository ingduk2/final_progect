<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- 생년월일 달력으로 받기 위함 by sky -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	
<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
	}
	
/* 이미지용 Css */
/* 메뉴바용스타일 */
#menubar{
	background-image: url('img/mypagemenu.png');
	background-repeat:no-repeat;
	height: 400px;
	text-align: left;
/* 	 -webkit-text-stroke: 1px black; */
	 -webkit-text-fill-color: white;	
}
.list-group-item-success{
	background-color: transparent;
/* 	font-weight:bold;  */
	font-size: 15px
}
#aa{
	color : white;
	padding-top: 140px;
	margin-left: 50px;	
}
.list-group-item{
	border: 1px solid transparent;
	width: 150px
}
a:link {
    text-decoration: none;
}
#id{
	height: 100px;
	width: 100px;
}
.panel{
	width: 450px
}
.panel-heading{
	height: 130px;
}
.panel-default>.panel-heading, .panel-footer{
	background-color: white;
}
.panel-body{
	padding: 3px;
	background-color: #E0EEEE
}


</style>

<div>
			<!--MenuBar_회원정보보기/수정/탈퇴/내가쓴글-->
	<div id="menubar">
	  <div id="aa">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-info-sign"></span><a href="#"> 정보 보기</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-cog"></span><a href="#"> 정보 수정</a>
		  </li>
		  	
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-user"></span><a href="#"> 나의 활동</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-trash"></span><a href="#"> 탈 　　퇴</a>
		  </li>
		</ul>
	  </div>
	</div>

		<h1>회원정보수정</h1>
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		
	<div class="row">
	<div class="col-md-4"><!-- 위치조정용 --></div>
	<div class="col-md-6">
	  <div class="panel panel-default">
	    <div class="panel-heading">
			<div style="position: relative; right: -150px"><!-- 이미지넣을 div -->
				<img src="img/a.PNG" class="img-circle" width="100px" height="100px">
			</div>
			<div style="position:relative; top:-70px; right: 0px"><!-- di/name/birth -->
				<h3>WhineWinni</h3>
				<h4>위니당<small>1989.06.16</small></h4>
			</div>
	    </div>
	    <div class="panel-body">
	    	<!-- 인사말들어올위치입니다. -->
	    	나는 지금 무지막지하게 너무너무 졸려 죽겠다.
	    </div>
	    <div class="panel-footer">
	    	<!-- 주소와 전화번호가 들어올 위치입니다. -->
	    	서울시 서대문구 홍은동 123-4567 어디게로 18번지<p>
	    	010-6664-0616
	    </div>
	  </div>
	</div>
	<div class="col-md-3"><!-- 위치조정용 --></div>
	</div>	
		

		<table><tr height="30px"><td></td></tr></table>
	</div>