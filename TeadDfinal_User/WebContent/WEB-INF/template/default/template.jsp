<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ctrl+SAVE</title>
	<!-- Css  -->
	<link rel="stylesheet" type="text/css" href="resources/default.css">
<!-- 	<link rel="stylesheet" type="text/css" href="resources/bootstrap-table.min.css"> 민영 css-->
	



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
		<tiles:insertAttribute name="sidemenu" flush="true"/>
		<tiles:insertAttribute name="footer" flush="true"/>
	</div>
</body>




</html>