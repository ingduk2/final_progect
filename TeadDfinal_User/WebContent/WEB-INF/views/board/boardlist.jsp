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


<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

<style>
	.glyphicon {
		color: #8fbc8f
	}
/* 	tootip style */
	#bg a:FOCUS, a:HOVER{
		color: green;
	}
	/* Hover tooltips */
	.field-tip {
	    position:relative;
	    cursor:help;
	}
	    .field-tip .tip-content {
        position:absolute;
        top:-10px; /* - top padding */
        right:9999px;
        width:200px;
        margin-right:-220px; /* width + left/right padding */
        padding:10px;
        color:#fff;
        background:#89D495;
        -webkit-box-shadow:2px 2px 5px #aaa;
           -moz-box-shadow:2px 2px 5px #aaa;
                box-shadow:2px 2px 5px #aaa;
        opacity:0;
        -webkit-transition:opacity 250ms ease-out;
           -moz-transition:opacity 250ms ease-out;
            -ms-transition:opacity 250ms ease-out;
             -o-transition:opacity 250ms ease-out;
                transition:opacity 250ms ease-out;
    }
        /* <http://css-tricks.com/snippets/css/css-triangle/> */
        .field-tip .tip-content:before {
            content:' '; /* Must have content to display */
            position:absolute;
            top:50%;
            left:-16px; /* 2 x border width */
            width:0;
            height:0;
            margin-top:-8px; /* - border width */
            border:8px solid transparent;
            border-right-color:#89D495;
        }
        .field-tip:hover .tip-content {
            right:-20px;
            opacity:1;
        }
/* title style */
.titlename{width: 50%; margin: auto;}
#titlename{text-align: left; margin-bottom: 0px; margin-left: 8px; color: #27592F}
/* contents style */
/* #contents { 
   width: 200px; 
   white-space: nowrap; 
   overflow: hidden; 
   text-overflow: ellipsis; 
 }  */
</style>

<div id="bg">
<!-- ���� ���� �� -->
<table><tr height="50px"><td></td></tr></table>

<div class="titlename">
	<h2 id="titlename">
		<c:if test="${bcode==1}">�� ��������</c:if>
		<c:if test="${bcode==2}">�� �����Խ���</c:if>
		<c:if test="${bcode==3}">�� �����Խ���</c:if>
	</h2>
<hr style="margin-top: 3px">
</div>

<table style="width: 50%;">
	<thead style="font-weight:bold; color:black;">
		<%-- <c:if test="${bcode == 1}">
			<tr id="title"> <td colspan="5">��������</td> </tr>
		</c:if>
		<c:if test="${bcode == 2}">
			<tr id="title"> <td colspan="5">���� �Խ���</td> </tr>
		</c:if>
		<c:if test="${bcode == 3}">
			<tr id="title"> <td colspan="5">���� �Խ���</td> </tr>
		</c:if>
		<tr> <td colspan="5">��</td> </tr> --%>
		<tr id="title"> <td colspan="2" width="300px" style=" text-overflow: ellipsis;">����</td><td width="180px">�ۼ���</td><td width="100px">�ۼ���</td><td>��ȸ</td> </tr>
	</thead>
	
	<tbody id="tbodycss">
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td style="text-align: left; padding-left: 20px; text-overflow: ellipsis;">
					<c:forEach begin="1" end="${list.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${list.blvl != 0}">
						<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
					</c:if>
					<a href="selectoneBoard?bno=${list.bno}&mid=${list.mid}">
						<span class="field-tip">${list.btitle}
							<span class="tip-content" style="z-index: 99;">${list.bcontent}...</span>
						</span>
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
	
	<form action="selectallBoard" method="post">
	<table><!-- �ѹ����̶�, �˻�, �۾����ư,  --> 
		<thead> 
			<tr> <td colspan="5"> <!-- ����¡�۾��κ��Դϴ�. --> ${pagingCode }  </td> </tr>
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
					<input type="hidden" name="bcode" value="${bcode }">
					<input type="hidden" name="nowPage" value="1">
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