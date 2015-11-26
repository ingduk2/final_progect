<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	�� ���� ���� ��
	- �޴��ٿ� �Խ��� ����Ʈ ���� ���� ���
	- bcode 1 (��������) ������ �۾��� ��ư �Ⱥ��̰� ��
	- ���� ��Ʈ ����
 -->

<style>
	.glyphicon {
		color: #8fbc8f
	}
</style>

<div id="bg">
<!-- ���� ���� �� -->
<table><tr height="50px"><td></td></tr></table>

<!-- <table id="table-pagination" data-toggle="table" data-pagination="true"> -->
<table>
	<thead style="font-weight:bold; color:black;">
		<tr id="title"> <th colspan="2" width="300px">����</th><th width="180px">�ۼ���</th><th width="100px">�ۼ���</th><th>��ȸ</th> </tr>
	</thead>
	
	<tbody id="tbodycss">
	
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td style="text-align: left; padding-left: 20px">
					<c:forEach begin="1" end="${list.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${list.blvl != 0}">
						<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
					</c:if>
					<a href="selectoneBoard?bno=${list.bno}&mid=${list.mid}">
						${list.btitle}
					</a>
				</td>
				<td>${list.mid}</td>
				<td>${list.bdate}</td>
				<td>${list.bhit}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	
	
	
	<tfoot>
		<tr> 
			<td colspan="3"></td>  
			<td colspan="2"> 
			
				<!-- �������� �Խ��ǿ����� �۾��� ��ư �Ⱥ��̰� -->
				<c:if test="${bcode != 1}">
					<button type="submit" onclick="location='formBoard?bcode=${bcode}'" class="btn btn-success btn-sm">
						&nbsp;&nbsp;�� �� ��&nbsp;&nbsp;
					</button>
				</c:if>
				 
			</td> 
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
						<!--  ���̳��������� �˻���� �߰��� �κ� -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">����</option>
					        <option value="2">�ۼ���</option>
					        <option value="3">����</option>
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
				</td>
				<td>&nbsp;
				 <!--  �˻���ư, �Ķ���Ͱ��ѱ�κ�  -->
					<button type="submit" class="btn btn-default btn-sm">�˻�</button> &nbsp;
				</td>  
			</tr>
		</tbody>
	</table>
	</form>
</div>