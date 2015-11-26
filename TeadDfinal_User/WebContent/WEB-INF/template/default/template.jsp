<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeamD</title>
	<!-- Css  -->
	<link rel="stylesheet" type="text/css" href="resources/default.css">
<!-- 	<link rel="stylesheet" type="text/css" href="resources/bootstrap-table.min.css"> 민영 css-->
	
<script type="text/javascript">
var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 150; // 스크롤 시작위치 
var stmnActivateSpeed = 35; ///스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer;
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('staticmenu').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
	   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
	   document.getElementById('staticmenu').style.top = parseInt(document.getElementById('staticmenu').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
	   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('staticmenu').style.right = stmnLEFT + 'px';  //ó���� �����ʿ� ��ġ. left�� �ٲ㵵.
  document.getElementById('staticmenu').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#staticmenu { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
#wanted{
	background-image: url('img/wanted.png');
	width: 130px; 
	height: 177px
}
#wantedbaby{
	 width: 80px;
	 padding-top: 70px;
}
</style>
</head>
<body onload="InitializeStaticMenu();">
	
	<div class="page">
		<tiles:insertAttribute name="header" flush="true"/>
		<div id="content">
			<div>
				<tiles:insertAttribute name="menu" flush="true"/>
			</div>
			<div>
				<tiles:insertAttribute name="body" flush="true"/>
			</div>
		</div>		
		<tiles:insertAttribute name="footer" flush="true"/>
	</div>
</body>

<div id="staticmenu" style="border: 1px solid red;">
<!-- 	<img src="http://skin011.com.ne.kr/HOME/tag1/img/ani_pskippy.gif"> -->
	
	<div id="wanted">
		<img id="wantedbaby" src="img/a.PNG"><p>
		<strong>1,000,000￦</strong>
	</div>
	<p><img src="img/tabmenu_news.png">
	<p><a href="http://edu2.kvma.or.kr/"><img src="img/tabmenu_camera.png" width="80px"></a>
</div>


</html>