<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 	Css  -->
	<link rel="stylesheet" type="text/css" href="resources/default.css">
	
<style>
	body{
		margin: 0px;
		padding : 0px;
		height : 100%;
		/* overflow: hidden; */
	}
	.page{ min-height : 100%; }/* position: relative; */
	.header{ width:100%; text-align:center;}
	.content{padding :10px; padding-bottom: 20px; }/* overflow: hidden; */
	
	#wrap{
		float:right;
		padding: 20px 30px 0 20px;
	}
	
	.footer{width:100%; background: #080808; color: #9d9d9d; clear: both;}
	.body{width:100%;}
	
	#head_image{
		height:200px;
		width:300px;
	}
/* 	#chart_table tr td{ */
/* 	padding: 15px 15px 15px 15px; */
/* 	} */
/* 	#list_table tr td{ */
/* 	padding: 15px 15px 15px 15px; */
/* 	} */
	table tr td{
	padding: 15px 15px 15px 15px;
	}
	#list_table{
	margin-top: 30px;
	}
 	#list_table tr td{
 	padding: 0px 0px 0px 0px; 
	} 
	
	.chart{
		width:270px;
		height:280px;
	}
</style>	
</head>
<body>
	
	<div class="page">
		<tiles:insertAttribute name="header" flush="true"/>
		<div id="content">
			<tiles:insertAttribute name="menu" flush="true"/>
			<tiles:insertAttribute name="body" flush="true"/>
		</div>		
		<tiles:insertAttribute name="footer" flush="true"/>
	</div>
</body>
</html>