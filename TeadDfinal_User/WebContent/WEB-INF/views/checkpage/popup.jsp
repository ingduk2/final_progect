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
	   <h3>동물등록제<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	   동물 등록 식별장치는 마이크로 칩을 목덜미에 삽입하는 내장형과 목걸이로 거는 외장형, 비전자적인 인식표가 있으며 특징은 아래와 같습니다.</font>
	   <table class="table">
	   	<tr>
	   		<td>구분</td><td>내장형</td><td>외장형, 인식표형</td>
	   	</tr>
	   	<tr>
	   		<td>장점</td>
	   		<td>
	   			<ul>
	   				<li>유실시 귀가율 향상</li>
	   				<li>소유권 증명 용이</li>
	   				<li>유기견 발생 방지</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>부작용 없음</li>
	   				<li>처치 간단</li>
	   			</ul>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>단점</td>
	   		<td>
	   			<ul>
	   				<li>외과적 주사 시술 및 부작용</li>
	   				<li>18만건 시술 중 14건 (0.01%)</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>의도적, 우발적 파손 용이</li>
	   				<li>제거 후 유기 시 소유자 확인 불가</li>
	   			</ul>
	   		</td>
	   	</tr>
	   </table>
	   
	   ('14년 유기동물 : 8만여 마리, 처리비 104억원 사용)<p>
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
<!-- 	      <input type="radio" name="optradio" value="1" >내장형 일원화가 바람직하다 -->
<!-- 	      </label> -->
<!-- 	    </div> -->
<!-- 	    <div class="radio"> -->
<!-- 	      <label><input type="radio" name="optradio" value="2">현행 선택방식 유지가 바람직하다</label> -->
<!-- 	    </div> -->
<!-- 	    <div class="radio"> -->
<!-- 	      <label><input type="radio" name="optradio" value="3">잘 모르겠다</label> -->
<!-- 	    </div> -->

	    
	    <span style="color: red">
	    	<strong>※ 본 설문조사는 로그인이 필요없는 열린방식으로 진행하고</br>
	    	  동일IP에서 중복투표를 방지하여 유의성을 제고합니다.
	    	</strong> 
	    </span>
<!--         <p id="uip"></p> -->
	    <button type="submit" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%" onclose="">투표하기</button>
<!-- 	   <div id="bipchkres"></div> -->
	   </form>  
<!-- 	    <button type="button" onclick="fin()" class="btn btn-default btn-sm" style="margin-bottom: -15px; margin-left: 90%">투표하기</button> -->
	 </div>
</div>
</body>
</html>
