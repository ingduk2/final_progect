<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.glyphicon {
		color: #8fbc8f
	}
	
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
/* 	.navbar {
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
	} */
	
	/* �̹����� Css */
	/* �޴��ٿ뽺Ÿ�� */
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
	.involved{
		width: 50%;
		margin: auto;
/* 		border: 1px solid red;  */
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
		<td><a href="#"><img class="imgsize" src="img/test/involved.png"/></a></td>  
	</tr>
	<tr><!-- Ż�� -->
		<td><a href="formWithdrawal"><img class="imgsize" src="img/test/withdrawal.png"/></a></td>
	</tr>
</table> 
</div>



<div class="involved" >
	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>
	
	<table style="width: 100%">
		<thead>
			<tr id="title"> <td colspan="6">�� �� ����</td> </tr>
			<tr> <td colspan="5">��</td> </tr>
			<tr id="title"> <td colspan="3">����</td><td>�ۼ���</td><td>�ۼ���</td><td>��ȸ</td> </tr>
		</thead>
		
		<tbody id="tbodycss">
		
			<c:forEach var="mine" items="${mine}">
				<tr>
					<td>${mine.bno}</td>
					
					<c:if test="${mine.bcode==2 }">
						<td>����</td>
					</c:if>
					<c:if test="${mine.bcode==3 }">
						<td>����</td>
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