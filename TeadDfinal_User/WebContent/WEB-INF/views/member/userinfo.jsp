<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!-- 
	�� ���� ���� ��
	- ��ܿ� ���� ���� �߰�
 -->

<style>
	table th {
		font-weight: bold;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
		color: gray;
		background-color:hsla(120,100%,75%,0.3);
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
	#memberinfomenubar{
		position: fixed; position: absolute; 
/*  		z-index: -1;  */
		overflow: hidden;
		left: 0px;
		top: 160px;
		margin: 0;
		padding: 0
	}
	.imgsize{
		width:100px;
		height:105px;
		padding-bottom: 10px
	}

</style>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

<div id="memberinfomenubar"> <!-- memberpage : userinfo/userupdate/myactivity/withdrawal.jsp�� ����� submenu -->
<table style="margin-left: 130px;">
	<tr>
		<td><!-- �������� -->
			<a href="#" data-toggle="tooltip" data-placement="top" title="��������"><img class="imgsize" src="img/test/myinfo.png"/></a>
		</td>  
	</tr>
	<tr><!-- �������� -->
		<td><a href="updateformMember" data-toggle="tooltip" data-placement="bottom" title="��������"><img class="imgsize" src="img/test/infoupdate.png"/></a></td>  
	</tr>
	<tr><!-- ���� Ȱ�� -->
		<td><a href="selectAllMyActivity" data-toggle="tooltip" data-placement="bottom" title="�� �� ��ƺ���"><img class="imgsize" src="img/test/involved.png"/></a></td>  
	</tr>
	<tr><!-- Ż�� -->
		<td><a href="formWithdrawal" data-toggle="tooltip" data-placement="bottom" title="ȸ��Ż��"><img class="imgsize" src="img/test/withdrawal.png"/></a></td>
	</tr>
</table> 
</div>







			<!--MenuBar_ȸ����������/����/Ż��/��������-->
<!-- 	<div id="menubar">
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
	</div> -->

	
	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>
		
		
		
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

		<table><tr height="30px"><td></td></tr></table>
