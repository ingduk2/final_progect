<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TeamD</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
	#allbg{
		background-image: url('http://cfile25.uf.tistory.com/image/203F8F335021021C1996EB');
		background-repeat: no-repeat;
		width: 100%;
		height: 100%;
		background-size:100% 100%;
	}
	.jumbotron{
		margin: 10px;
		border-radius: 5px;
		background-color: rgba( 208, 210, 208, 0.9 );
		padding: 30px;
		font-size:12px;
	}
	.h1, .h2, .h3, h1, h2, h3{
		margin-top: 3px;
		margin-bottom: 3px;
	}
	hr{
		margin-top: 0px;
		margin-bottom: 3px;
		border: 0;
		border-top: 1px solid #eee;
	}
	.table {
		width: 80%;
		max-width: 100%;
		margin-bottom: 5px;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		padding: 3px;
	}
	ol, ul{
		margin-bottom: 1px
	}
</style>
<script>
	function fin() {
		window.close();
	}
	
	
	function userIp() {
	    var xip = location.host;
	    document.getElementById("uip").innerHTML = xip;
	}
	
</script>
</head>
<body>
<div>
<div id="allbg">
	<div class="jumbotron">
	   <h3>���������<small>�������� ������ �ǰ��� ��ٸ��ϴ�.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	   ���� ��� �ĺ���ġ�� ����ũ�� Ĩ�� ����̿� �����ϴ� �������� ����̷� �Ŵ� ������, ���������� �ν�ǥ�� ������ Ư¡�� �Ʒ��� �����ϴ�.</font>
	   <table class="table">
	   	<tr>
	   		<td>����</td><td>������</td><td>������, �ν�ǥ��</td>
	   	</tr>
	   	<tr>
	   		<td>����</td>
	   		<td>
	   			<ul>
	   				<li>���ǽ� �Ͱ��� ���</li>
	   				<li>������ ���� ����</li>
	   				<li>����� �߻� ����</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>���ۿ� ����</li>
	   				<li>óġ ����</li>
	   			</ul>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>����</td>
	   		<td>
	   			<ul>
	   				<li>�ܰ��� �ֻ� �ü� �� ���ۿ�</li>
	   				<li>18���� �ü� �� 14�� (0.01%)</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>�ǵ���, ����� �ļ� ����</li>
	   				<li>���� �� ���� �� ������ Ȯ�� �Ұ�</li>
	   			</ul>
	   		</td>
	   	</tr>
	   </table>
	   
	   ('14�� ���⵿�� : 8���� ����, ó���� 104��� ���)<p>
	   <font size="3px">&nbsp; ${v.sub }</font>
	   <p><p><p>
	   <form method="post" action="surveyUpdate"> 
	   <input type="hidden" name="num" value="${v.num }"> 
	 
		<ul>
		<li><input type="radio" name="surveychk" value="1">${v.sub1 }</li>
		<li><input type="radio" name="surveychk" value="2">${v.sub2 }</li>
		<li><input type="radio" name="surveychk" value="3">${v.sub3 }</li>
		
<%-- 		<c:forEach begin="1" end="${v.code }" step="1" varStatus="e"> --%>
<%-- 		<li><input type="radio" name="surveychk" value="${e.count }"> --%>
<%-- 		<c:choose> --%>
<%-- 		<c:when test="${e.count==1 }">${v.sub1 }</c:when> --%>
<%-- 		<c:when test="${e.count==2 }">${v.sub2 }</c:when> --%>
<%-- 		<c:when test="${e.count==3 }">${v.sub3 }</c:when> --%>
<%-- 		</c:choose></li> --%>
<%-- 		</c:forEach> --%>
		</ul>
		
<!-- 	    <div class="radio"> -->
<!-- 	      <label> -->
<!-- 	      <input type="radio" name="optradio" value="1" >������ �Ͽ�ȭ�� �ٶ����ϴ� -->
<!-- 	      </label> -->
<!-- 	    </div> -->
<!-- 	    <div class="radio"> -->
<!-- 	      <label><input type="radio" name="optradio" value="2">���� ���ù�� ������ �ٶ����ϴ�</label> -->
<!-- 	    </div> -->
<!-- 	    <div class="radio"> -->
<!-- 	      <label><input type="radio" name="optradio" value="3">�� �𸣰ڴ�</label> -->
<!-- 	    </div> -->

	    
	    <span style="color: red">
	    	<strong>�� �� ��������� �α����� �ʿ���� ����������� �����ϰ�</br>
	    	  ����IP���� �ߺ���ǥ�� �����Ͽ� ���Ǽ��� �����մϴ�.
	    	</strong> 
	    </span>
<!--         <p id="uip"></p> -->
	    <button type="submit" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%" onclose="">��ǥ�ϱ�</button>
<!-- 	   <div id="bipchkres"></div> -->
	   </form>  
<!-- 	    <button type="button" onclick="fin()" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%">��ǥ�ϱ�</button> -->
	 </div>
</div>
</body>
</html>
