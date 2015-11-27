<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	�� ���� ���� ��
	- �޴��ٿ� �Խ��� ����Ʈ ���� ���� ���
	- bcode 1 (��������) ������ �۾��� ��ư �Ⱥ��̰� ��
	- ���� ��Ʈ ����
	- bcode�� ���� ��� �Խ������� ����ϵ��� ��
 -->

<style>
	.glyphicon {
		color: #8fbc8f
	}
</style>

<div id="bg">
<!-- ���� ���� �� -->
<table><tr height="50px"><td></td></tr></table>

<table>
	<thead style="font-weight:bold; color:black;">
		<c:if test="${bcode == 1}">
			<tr id="title"> <td colspan="5">��������</td> </tr>
		</c:if>
		<c:if test="${bcode == 2}">
			<tr id="title"> <td colspan="5">���� �Խ���</td> </tr>
		</c:if>
		<c:if test="${bcode == 3}">
			<tr id="title"> <td colspan="5">���� �Խ���</td> </tr>
		</c:if>
		<tr> <td colspan="5">��</td> </tr>
		<tr id="title"> <td colspan="2" width="300px">����</td><td width="180px">�ۼ���</td><td width="100px">�ۼ���</td><td>��ȸ</td> </tr>
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