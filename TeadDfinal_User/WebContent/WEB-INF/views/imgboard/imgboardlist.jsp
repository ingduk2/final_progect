<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
	$(function() {
		$('#sel1').change(function() {
			alert($(this).val());
		});
	});
</script>

<style>

	a.thumbnail:focus, a.thumbnail:hover {
		color: #90ee90
	}
	a.nounderline {
		text-decoration: none; 
	} 
	a.thumbnail.active, a.thumbnail:focus, a.thumbnail:hover{
		border-color:#EDEDED
	}
 	.numbering{ 
  		clear: both; 
 	}  

	.tag {
		text-align: left;
		padding-left: 10px;
	}
	.img {
		width: 180px; 
		height: 180px;
	}
	.container {
		width: 180px;
		table-layout: fixed;
	}
	.content {
		width: 100%; 
		padding-top: 5px; 
		padding-left: 10px;
		padding-right: 10px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 12px;
	}

	
</style>



<!-- ���� ���� �� -->
<table><tr height="50px"><td></td></tr></table>



<div class="col-md-offset-3 col-md-6 col-md-offset-3 center">

	<c:if test="${size != 0}">
		<c:set var="doneLoop" value="false" />
		
		<c:forEach var="i" begin="0" end="8" step="3">
		
			<div>
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">�丶!</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${alist[i].anino}&bno=${alist[i].bno}" class="thumnail nounderline">
							<img src="img/${alist[i].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${alist[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${alist[i].aniregion}</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">�丶!</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${alist[i+1].anino}&bno=${alist[i+1].bno}" class="thumnail nounderline">
							<img src="img/${alist[i+1].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+1].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+1].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+1].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+1].aniregion}</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i+1 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">�丶!</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${alist[i+2].anino}&bno=${alist[i+2].bno}" class="thumnail nounderline">
							<img src="img/${alist[i+2].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+2].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+2].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+2].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+2].aniregion}</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i+2 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
			</div>
			
		</c:forEach>
	</c:if>

	<!-- ������� ���� ��... -->
	<!-- ��� �� ���� ����... -->
	<!-- �Ϲ� �Խ��� ó�� ���� �ٹ̱�? -->
	<input type="hidden" name="bcode" value="${bcode }"> 
	<div class="numbering">
	<br><button type="button" class="btn btn-success btn-sm" onclick="location='formImgBoardWrite?bcode=${bcode}'">���� ��ϡ�</button><br><br>
	
	<form action="selectallAnimal" method="post">
	<table><!-- �ѹ����̶�, �˻�, �۾����ư,  --> 
		<thead>
		<tr>
		<td>
			<span class="glyphicon glyphicon-circle-arrow-left"></span>
			${pagingCode}
			<span class="glyphicon glyphicon-circle-arrow-right"></span>
		</td>
		</tr>
		</thead>
		<tbody>
			<tr>  
				<td> &nbsp;
						<!--  ���̳��������� �˻���� �߰��� �κ� -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">��з�</option>
					        <option value="2">�Һз�</option>
					        <option value="3">����</option>
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
					<input type="hidden" name="nowPage" value="1">
					<input type="hidden" name="bcode" value="${bcode }">
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
</div>


<!-- 		<div class="numbering"> -->
<%-- 		<td>${page}</td> --%>
<!-- 			<br><button type="button" class="btn btn-success btn-sm" onclick="location='formAnimal'">���� �ϡ�</button><br><br> -->
<!--  			<input type="button" value="click" onclick="goUrl('aniboardwrite')"/><br> -->
<!--  			<span class="glyphicon glyphicon-circle-arrow-left"></span> -->
<!--  				<s:property value="pagingCode" escape="false"/> -->
<!--  			<span class="glyphicon glyphicon-circle-arrow-right"></span> -->
			
<!-- 		</div> -->
		
<!-- 	</div> -->
