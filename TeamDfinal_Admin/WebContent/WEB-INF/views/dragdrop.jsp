<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>
			Drag and Drop Example
		</title>
<style type="text/css">
	.img{
		width:100px;
		height:100px;
	}
</style>
<script type="text/javascript">
	function dragstart(e) {
		alert("drag 시작");
	}
	
	function drag(e) {
		alert("drag 중");
	}
</script>
	</head>
	
	<body>
	<h1>끌자</h1>
	
	<img class="img" src="img/mok.png" draggable="true"
	ondragstart="dragstart(event)" ondrag="drag(event)">
	<img class="img" src="img/bob.png" draggable="true"/>
	<img class="img" src="img/spo.png" draggable="true"/>
	</body>
</html>