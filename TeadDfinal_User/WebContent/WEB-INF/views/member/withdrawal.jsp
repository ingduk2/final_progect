<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	a:link {
	    text-decoration: none;
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

<div id="memberinfomenubar"> <!-- memberpage : userinfo/userupdate/myactivity/withdrawal.jsp�� ����� submenu -->
<table style="margin-left: 130px;">
	<tr>
		<td><!-- �������� -->
			<a href="selectoneMember"><img class="imgsize" src="img/test/myinfo.png"/></a>
		</td>  
	</tr>
	<tr><!-- �������� -->
		<td><a href="updateformMember"><img class="imgsize" src="img/test/infoupdate.png"/></a></td>  
	</tr>
	<tr><!-- ���� Ȱ�� -->
		<td><a href="selectAllMyActivity"><img class="imgsize" src="img/test/involved.png"/></a></td>  
	</tr>
	<tr><!-- Ż�� -->
		<td><a href="#"><img class="imgsize" src="img/test/withdrawal.png"/></a></td>
	</tr>
</table> 
</div>



<div>
	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>
	
	��¥ Ż���Ͻǰ�? <br />
	<input type="button" value="������ ����" onclick="goUrl('deleteMember')">
<%-- 	<c:url var="logout" value="j_spring_security_logout"/> --%>
<%-- 	<a type="button" href="deleteMember" onclick="location.href='${logout}';" target="_blank">������</a> --%>
	<input type="button" value="��� �ƴ� ����" onclick="goUrl('selectoneMember')">
</div>