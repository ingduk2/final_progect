<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.glyphicon {
		color: #8fbc8f
	}
	
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

<div id="bg">

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
	
	<table>
		<thead style="font-weight:bold; color:black;">
			<tr id="title"> <td colspan="6">�� �� ����</td> </tr>
			<tr> <td colspan="5">��</td> </tr>
			<tr id="title"> <td colspan="3" width="300px">����</td><td width="180px">�ۼ���</td><td width="100px">�ۼ���</td><td>��ȸ</td> </tr>
		</thead>
		
		<tbody id="tbodycss">
		
			<c:forEach var="mine" items="${mine}">
				<tr>
					<td width="30px">${mine.bno}</td>
					
					<c:if test="${mine.bcode==2 }">
						<td width="30px">����</td>
					</c:if>
					<c:if test="${mine.bcode==3 }">
						<td width="30px">����</td>
					</c:if>
					
					<td style="text-align: left; padding-left: 20px">
						<c:forEach begin="1" end="${mine.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
						<c:if test="${mine.blvl != 0}">
							<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
						</c:if>
						<a href="selectoneBoard?bno=${mine.bno}&mid=${mine.mid}">
							${mine.btitle}
						</a>
					</td>
					<td>${mine.mid}</td>
					<td>${mine.bdate}</td>
					<td>${mine.bhit}</td>
				</tr>
			</c:forEach>
			
		</tbody>
		
		<tfoot>
			<tr> 
				<td></td>  
			</tr>
		</tfoot>
		
	</table>
	
	<form action="" method="post">
		<table><!-- �ѹ����̶�, �˻�, �۾����ư,  --> 
			<thead> 
				<tr> <td colspan="5"> <!-- ����¡�۾��κ��Դϴ�. --> Numbering  </td> </tr>
			</thead>
			<tbody>
				<tr>  
					<td> &nbsp;
<!-- 							 ���̳��������� �˻���� �߰��� �κ� -->
					      <select name="searchType" class="form-control input-sm" id="sel1">
						        <option value="1">����</option>
						        <option value="2">����</option>
					      </select>&nbsp;
					</td>
					<td>&nbsp;
						<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
					</td>
					<td>&nbsp;
<!-- 					  �˻���ư, �Ķ���Ͱ��ѱ�κ�  -->
						<button type="submit" class="btn btn-default btn-sm">�˻�</button> &nbsp;
					</td>  
				</tr>
			</tbody>
		</table>
	</form>
</div>