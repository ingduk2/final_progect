<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
    
<link rel="stylesheet" type="text/css" href="resources/default.css"/>

<!-- js 파일 사용 경로 설정  -->
<script src="resources/js/goUrl.js"></script>    
<!-- <script src="resources/js/bootstrap-table.min.js"></script>  민영js   -->
    
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

<div id="bg">
	<div id="header">
			
		<table height="165px"> 
		
			<!-- Login, out 처리start -->
			<tr>
				<!-- 로고 -->
				<td align="left"><a href="index"><img src="img/testlogo2.png" style="width: 170px"></a></td>
				<td align="right" style="vertical-align: top;">

					<!-- 비로그인 시 -->
					<c:if test="${pageContext.request.userPrincipal.name == null}">
						<!--로그인--><a class="loginout" href="login"><img src="img/login_top_btn.png"></a>&nbsp;&nbsp;<font color="#b5b2b2">|</font>&nbsp;
						<!--회원가입--><a class="loginout" href="formJoin"><img src="img/joinus_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
					</c:if>
					
					<!-- 로그인 시 -->
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<!--회원정보--><a class="loginout" href="selectoneMember">${pageContext.request.userPrincipal.name}</a>&nbsp;<font color="#b5b2b2">님&nbsp;|</font>&nbsp;	
						
						<!--로그아웃-->
						<c:url var="logout" value="j_spring_security_logout"></c:url>
						<a class="loginout" href="${logout }"><img src="img/logout_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
					</c:if>
					
					<!--연락--><a class="loginout" href="#"><img src="img/contactus_top_btn.png"></a>&nbsp;&nbsp;
					
				</td> 
			</tr>
			<!-- Login, out 처리 end -->
					
				
			<!-- tab dropdown-menu 변경 start-->
			<tr> 
				<td colspan="2" style="vertical-align: top;"> <!-- 헤더 위치용 칸떼우기 --> 
					<ul class="nav nav-tabs">
						<li><a class="dropdown-toggle" href="index">Home</a></li>
						
						<li><a class="dropdown-toggle" href="selectallAnimal">찾아주세요</a></li>
						
						<li><a class="dropdown-toggle" href="#">잡았다요놈</a></li>
						
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　참여하기　<span class="caret"><!--화살표--></span></a>
							<ul class="dropdown-menu">
						    	<li><a href="#">입양하기</a></li>
						    	<li><a href="formCal">봉사하기</a></li>
						    	<li><a href="#">설문조사</a></li>
							</ul>
						</li>
						
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　정보마당　<span class="caret"><!--화살표--></span></a>
							<ul class="dropdown-menu">
								<li><a href="selectallBoard?bcode=1">공지사항</a></li>
								<li><a href="#">자주 묻는 질문</a></li>
						    	<li><a href="selectallCenter">동물 보호 센터</a></li>
						    	<li><a href="formChart?year=2012">통계 자료</a></li>
						    	
						    	<li><a href="formCenter">센터(임시)</a></li>
							</ul>
						</li>
								
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">　커뮤니티　<span class="caret"><!--화살표--></span></a>
							<ul class="dropdown-menu">
						    	<li><a href="selectallBoard?bcode=2">자유 게시판</a></li>
						    	<li><a href="selectallBoard?bcode=3">질문 게시판</a></li>
							</ul>
						</li>

						<li><a class="dropdown-toggle" href="selectoneMember">MyPage</a></li>

 					</ul>
				</td>  
			</tr>
			<!-- tab dropdown-menu 변경 end-->
			
		</table>
		
	</div>
</div>