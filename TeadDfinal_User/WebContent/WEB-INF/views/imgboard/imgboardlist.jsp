<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>



<script>
var socket=null;
var id="";
var code="";
$(function() {
	id=$('#cid').val();
	code=$('#ccode').val();
var url="ws://localhost/TeadDfinal_User/chatting?id="+id+"&code="+code;
function connect() {
	if(socket==null){
		socket = new WebSocket(url); //afterconnection
		socket.onopen = function () {
			// ������ ������ �� �̺�Ʈ ����
		};
		socket.onmessage = function (message) {
			$("#contents").append(message.data+"<br/>")
			// �������� Session.send�� �̿��ؼ� �޽��� ������ �� ���� �̺�Ʈ ����
		};
		socket.onclose = function (event) {
			// �������� ���� ������ �� �̺�Ʈ ����
		};
	}else{
		alert("�̹� �������Դϴ�");
	}
}
function disconnect() {
	socket.close();
	socket = null;
}
connect();
});
function send(){ //������ �����͸� �����ϴ� �޼���
	if(socket!=null){
		socket.send($("#message").val());
		$("#message").val("");
	}else{
		alert("�������� �ƴմϴ�");
	}
}
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
		width: 160px; 
		height: 160px;
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
 	.col-md-4{
/*  		border: 1px solid silver;  */
		border-radius:15px;
		margin: 10px;
		width: 190px;
		padding-bottom: 5px;
 		background-color: rgba(255, 255, 255, 0.8);
	}
	.label-success{
		background-color:#69EEA8
	}
	#itsfloatdiv{
		position: fixed; position: absolute; 
		overflow: hidden;
		left: 0px;
		top: 160px;
		margin: 0;
		padding: 0;
		background-color: white;
		border-radius:10px;
		color: black;
		width: 280px
	}
	.chatchat{
			clear: both;
			width: 100%;
			padding: 2px
	}
	
</style>



<!-- ���� ���� �� -->
<table><tr height="50px"><td></td></tr></table>


<div id="itsfloatdiv">

<input type="hidden" id="cid" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" id="ccode" value="animal/${bcode }">

<div class="chatchat" >
	<!-- <div class="btn-group" style="clear: both;">
	  <a type="button" class="btn btn-success" href="javascript:disconnect();">���𡡡����塡</a>
	  <a type="button" class="btn btn-success" href="javascript:connect();">���硡�����ӡ�</a>
	</div> -->
	<div style="margin-top: 5px">
	<span class="label label-success" style="background-color: #C8E798; font-size:1em;">�̴�ä��</span><small>*ȸ���е�� ��ȭ�� ����������</small>
	</div>
	<hr style="margin-top: 5px; margin-bottom: 3px">
	<div id="contents"><!-- ������ ����. --></div>
	<div class="input-group" style="width:100%;">
		<input type="text" class="form-control input-sm" type="text" id="message"/>
		<span class="input-group-btn">
    		<a type="button" class="btn btn-success btn-sm" href="javascript:send();">����</a>
		</span>
	</div>
</div>
</div>




<div class="col-md-offset-3 col-md-6 col-md-offset-3 center">

	<c:if test="${size != 0}">
		<c:set var="doneLoop" value="false" />
		
		<c:forEach var="i" begin="0" end="8" step="3">
		
			<div>
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
					
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i].anistate == 0}">
								<h5 class="tag">
									<span class="label label-success">��ȣ��</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 1}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� ���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 2}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� �Ϸ�</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i].anistate == 3}">
								<h5 class="tag">
									<span class="label label-success">����</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 4}">
								<h5 class="tag">
									<span class="label label-success">���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 5}">
								<h5 class="tag">
									<span class="label label-success">���� ��ȣ</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i].anino}&bno=${alist[i].bno}&mid=${alist[i].mid}&nowPage=${nowPage}" class="thumnail nounderline">
							<img src="img/${alist[i].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">���� : ${alist[i].aniregion}</th>
							</tr>
							<tr>
								<th class="content">��¥ : ${alist[i].anidate}</th>
							</tr>
							<c:if test="${alist[i].anistate == 3}">
								<tr>
									<th class="content">��� : ${alist[i].anireward} ��</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i+1].anistate == 0}">
								<h5 class="tag">
									<span class="label label-success">��ȣ��</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 1}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� ���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 2}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� �Ϸ�</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i+1].anistate == 3}">
								<h5 class="tag">
									<span class="label label-success">����</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 4}">
								<h5 class="tag">
									<span class="label label-success">���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 5}">
								<h5 class="tag">
									<span class="label label-success">���� ��ȣ</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i+1].anino}&bno=${alist[i+1].bno}&mid=${alist[i+1].mid}&nowPage=${nowPage}" class="thumnail nounderline">
							<img src="img/${alist[i+1].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+1].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+1].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i+1].anibreed}</th>
							</tr>
							<tr>
								<th class="content">���� : ${alist[i+1].aniregion}</th>
							</tr>
							<tr>
								<th class="content">��¥ : ${alist[i+1].anidate}</th>
							</tr>
							<c:if test="${alist[i+1].anistate == 3}">
								<tr>
									<th class="content">��� : ${alist[i+1].anireward} ��</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i+1 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i+2].anistate == 0}">
								<h5 class="tag">
									<span class="label label-success">��ȣ��</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 1}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� ���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 2}">
								<h5 class="tag">
									<span class="label label-success">�Ծ� �Ϸ�</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i+2].anistate == 3}">
								<h5 class="tag">
									<span class="label label-success">����</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 4}">
								<h5 class="tag">
									<span class="label label-success">���</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 5}">
								<h5 class="tag">
									<span class="label label-success">���� ��ȣ</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i+2].anino}&bno=${alist[i+2].bno}&mid=${alist[i].mid}&nowPage=${nowPage}" class="thumnail nounderline">
							<img src="img/${alist[i+2].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+2].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+2].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i+2].anibreed}</th>
							</tr>
							<tr>
								<th class="content">���� : ${alist[i+2].aniregion}</th>
							</tr>
							<tr>
								<th class="content">��¥ : ${alist[i+2].anidate}</th>
							</tr>
							<c:if test="${alist[i+2].anistate == 3}">
								<tr>
									<th class="content">��� : ${alist[i+2].anireward} ��</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i+2 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
			</div>
			
			<!-- ���� ���� �� -->
			<table><tr><td>��</td></tr></table>
			
		</c:forEach>
	</c:if>

<%-- 	<input type="hidden" name="bcode" value="${bcode }">  --%>
	<div class="numbering">
	<br>
	<!-- �Ծ��û������ �۾��� �Ⱥ��̰� -->
	<c:if test="${bcode != 6}">
		<button type="button" class="btn btn-success btn-sm" onclick="location='formImgBoardWrite?bcode=${bcode}&nowPage=${nowPage}'">���� �� �ϡ�</button>
	</c:if>
	<br><br>
	
	<form action="selectallAnimal" method="post">
	<table><!-- �ѹ����̶�, �˻�, �۾����ư,  --> 
		<thead>
		<tr>
		<td colspan="5">
<!-- 			<span class="glyphicon glyphicon-circle-arrow-left"></span> -->
			${pagingCode}
<!-- 			<span class="glyphicon glyphicon-circle-arrow-right"></span> -->
		</td>
		</tr>
		</thead>
		<tbody>
			<tr>  
				<td> &nbsp;
						<!--  ���̳��������� �˻���� �߰��� �κ� -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">����</option>
					        <option value="2">ǰ��</option>
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