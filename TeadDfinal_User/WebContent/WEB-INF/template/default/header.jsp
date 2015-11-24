<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!-- 추가 -->

	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
    
    <link rel="stylesheet" type="text/css" href="resources/default.css"/>

    <!-- js 파일 사용 경로 설정  -->
    <script src="resources/js/goUrl.js"></script>    
    
<style>
.nav .open>a, .nav .open>a:focus, .nav .open>a:hover{
	background-color: #90ee90;
	border-color: #90ee90;
	color: white;
	font-weight: bold
}
.nav-tabs>li>a:HOVER {
	border-color: #90ee90
}
.nav>li>a:HOVER, .nav>li>a:HOVER {
	background-color: #90ee90
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
	border: 1px solid white;
}
a:FOCUS, a:HOVER {
	color: white;
	font-weight: bold;
}
.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
	color: #32cd32;
	font-weight: bold;
	background-color: #c1ffc1;
}
.dropdown-menu{
	background-color: #c1ffc1;
	border: 1px solid transparent;
	border: 1px solid transparent;
}
.dropdown-menu>li>a{
 	font-weight: bold; 
	color: white;
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
	background-color: transparent;
}
</style>

<!-- </head> -->
<!-- <body> -->
		<div id="bg">
			<div id="header">
			
				<table height="230px"> 
				
					<!-- Login, out 처리start -->
					<tr>  <!-- 하다보니 드럽게 해버렸네요 그래도 잘 보고 해줄거라 믿어 의심치 않습니다.....(..) 믿어요 ㅋㅋㅋㅋ 잇힝 -->
						<td align="left"><img src="img/logo.png"></td>
						<td align="right" style="vertical-align: top;">
							<!-- <s:if test="#session.loginid==null"> -->
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<a class="loginout" href="login"><!--로그인--><img src="img/login_top_btn.png"></a>&nbsp;&nbsp;<font color="#b5b2b2">|</font>&nbsp;
								<a class="loginout" href="formJoin"><!--회원가입-->  <img src="img/joinus_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</c:if>
							<!-- </s:if> -->
							
							<!--<s:else> -->
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<a class="loginout" href="mselectview">${pageContext.request.userPrincipal.name}</a>&nbsp;<font color="#b5b2b2">님&nbsp;|</font>&nbsp;	
								
								<c:url var="logout" value="j_spring_security_logout"></c:url>
								<a class="loginout" href="${logout }"><!--로그아웃--><img src="img/logout_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</c:if>
							<!--</s:else> -->	
								
								<a class="loginout" href="#"><!--연락--></a><img src="img/contactus_top_btn.png"></a>&nbsp;&nbsp;
						</td> 
					</tr>
					<!-- Login, out 처리 end -->
					
				
				<!-- tab dropdown-menu 변경 start-->
					<tr> 
						<td colspan="2" style="vertical-align: top;"> <!-- 헤더 위치용 칸떼우기 --> 
							 <ul class="nav nav-tabs">
							    <li><a class="dropdown-toggle" href="index">Home</a></li>
								
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　커뮤니티　<span class="caret"><!--화살표--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallBoard?bcode=1">게시판</a></li>
								     <li><a href="selectallBoard?bcode=2">질문게시판</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　참여하기　<span class="caret"><!--화살표--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="">입양신청</a></li>
								     <li><a href="formCal">봉사활동</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　X동물X　<span class="caret"><!--화살표--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallAnimal">실종신고</a></li>
								     <li><a href="test">발견보고</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　X정보X　<span class="caret"><!--화살표--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallCenter">보호센터</a></li>
								     <li><a href="formChart?year=2012">그래프/차트</a></li>
								     <li><a href="formCenter">센터</a></li>
								   </ul>
								</li>

	  						</ul>
						</td>  
				<!-- tab dropdown-menu 변경 end-->
					</tr>
				</table>
			</div>
		</div>