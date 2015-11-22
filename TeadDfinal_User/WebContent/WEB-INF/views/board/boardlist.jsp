<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="bg">
	<img src="img/boardTitle.png" width="200px">

<table>
	<thead style="font-weight:bold; color:black;">
		<tr id="title"> <td colspan="2" width="300px">����</td><td width="180px">�ۼ���</td><td width="100px">�ۼ���</td><td>��ȸ</td> </tr>
	</thead>
	
	<tbody id="tbodycss">
	
	<!--������ ������ table ��������. -->
	
	

	<!-- ���ؿ� �ּ� ������������ -->
	<!--<tr> <td>seq</td><td>title</td><td>write</td><td>sysdate</td><td>hit</td> </tr> -->
	
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td><a href="boarddetail?bno=${list.bno}">${list.btitle}</a></td>
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
				<button type="submit" onclick="location='boardwrite?bcode=${bcode}'" class="btn btn-default btn-xs">
					�۾���
				</button> 
			</td> 
		</tr>
	</tfoot>
	
	</table>
	
	<table><!-- �ѹ����̶�, �˻�, �۾����ư,  --> 
		<thead> 
			<tr> <td colspan="5"> <!-- ����¡�۾��κ��Դϴ�. --> Numbering  </td> </tr>

			<tr>  
<!-- 					<td></td> -->
				<td> &nbsp;
						<!--  ���̳��������� �˻���� �߰��� �κ� -->
				      <select class="form-control input-sm" id="sel1">
					        <option>����</option>
					        <option>�ۼ���</option>
					        <option>����</option>
				      </select>
				      &nbsp;
				</td>
				<td>
					&nbsp;<input class="form-control input-sm" type="text"  />&nbsp;
				</td>
				<td>
				 <!--  �˻���ư, �Ķ���Ͱ��ѱ�κ�  -->
					&nbsp;<button type="button" class="btn btn-default btn-sm">�˻�</button> &nbsp;
				</td>  
<!-- 					<td></td>   -->
			</tr>
			</thead>
	</table>
</div>