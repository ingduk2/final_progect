<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<style>
table th { 
	font-weight: bold; 
	color: black; 
	background-color: #90ee90; 
	opacity: 0.4; 
	font: bold; 
	text-align: center; 
	border-bottom: 1px solid #f0fff0; 
	width: 45px; 
} 
</style>


<div>
	
<img src="img/boardupdate.png" width="300px">
<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
	
<form action="boardupdate" method="post">
	
	
<input type="hidden" name="bno" value="${bvo.bno}">
	
<table width="500px">	
	<tr> <th colspan="2">�Խñ� ����</th> </tr>			
	<tr>	
		<th>title</th>	
		<td>
			<input class="form-control input-sm" name="btitle" value="${bvo.btitle}">
		</td>	
	</tr>
	
	<tr>	
		<th colspan="2">Content</th>		
	</tr>
	
	<tr>	
		<td colspan="2"  height="500px">
			<textarea name="bcontent" class="form-control" rows="10" id="comment">${bvo.bcontent}</textarea>
		</td>		
	</tr>
</table>				

	
<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
<button type="submit" class="btn btn-success btn-sm">�������Ϸᡡ</button>
<button type="button" class="btn btn-success btn-sm" onclick="location='boardlist?bcode=${bvo.bcode}'">��������ҡ�</button>

</form>		

</div>