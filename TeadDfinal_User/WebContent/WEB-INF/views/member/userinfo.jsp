<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!-- 
	�� ���� ���� ��
	- ��ܿ� ���� ���� �߰�
 -->

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
	
/* �̹����� Css */
/* �޴��ٿ뽺Ÿ�� */
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
.list-group>li>a{
	color: white;
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
			<!--MenuBar_ȸ����������/����/Ż��/��������-->
	<div id="menubar">
	  <div id="aa">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-info-sign"></span><a href="selectoneMember"> ���� ����</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-cog"></span><a href="updateformMember"> ���� ����</a>
		  </li>
		  	
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-user"></span><a href="selectAllMyActivity"> ���� Ȱ��</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-trash"></span><a href="formWithdrawal"> Ż ������</a>
		  </li>
		</ul>
	  </div>
	</div>

	
	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>
		
	<div class="row">
	<div class="col-md-4"><!-- ��ġ������ --></div>
	<div class="col-md-6">
	  <div class="panel panel-default">
	    <div class="panel-heading">
			<div style="position: relative; right: -150px"><!-- �̹������� div -->
				<img src="img/${mvo.mimg }" class="img-circle" width="100px" height="100px">
			</div>
			<div style="position:relative; top:-70px; right: 0px"><!-- di/name/birth -->
				<h3>${mvo.mid }</h3>
				<h4>${mvo.mname }<small>${mvo.mbirth }</small></h4>
			</div>
	    </div>
	    <div class="panel-body">
	    	<!-- �λ縻������ġ�Դϴ�. -->
	    	${mvo.mintro }
	    </div>
	    <div class="panel-footer">
	    	<!-- �ּҿ� ��ȭ��ȣ�� ���� ��ġ�Դϴ�. -->
	    	${mvo.mroad }<p>
	    	${mvo.mtel }
	    </div>
	  </div>
	</div>
	<div class="col-md-3"><!-- ��ġ������ --></div>
	</div>	
		

		<table><tr height="30px"><td></td></tr></table>
	</div>