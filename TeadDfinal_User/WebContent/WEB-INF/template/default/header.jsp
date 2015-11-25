<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- �߰� -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!-- �߰� -->

	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
    
    <link rel="stylesheet" type="text/css" href="resources/default.css"/>

    <!-- js ���� ��� ��� ����  -->
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
				
					<!-- Login, out ó��start -->
					<tr>  <!-- �ϴٺ��� �巴�� �ع��ȳ׿� �׷��� �� ���� ���ٰŶ� �Ͼ� �ǽ�ġ �ʽ��ϴ�.....(..) �Ͼ�� �������� ���� -->
						<td align="left"><img src="img/logo.png"></td>
						<td align="right" style="vertical-align: top;">
							<!-- <s:if test="#session.loginid==null"> -->
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<a class="loginout" href="login"><!--�α���--><img src="img/login_top_btn.png"></a>&nbsp;&nbsp;<font color="#b5b2b2">|</font>&nbsp;
								<a class="loginout" href="formJoin"><!--ȸ������-->  <img src="img/joinus_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</c:if>
							<!-- </s:if> -->
							
							<!--<s:else> -->
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<a class="loginout" href="mselectview">${pageContext.request.userPrincipal.name}</a>&nbsp;<font color="#b5b2b2">��&nbsp;|</font>&nbsp;	
								
								<c:url var="logout" value="j_spring_security_logout"></c:url>
								<a class="loginout" href="${logout }"><!--�α׾ƿ�--><img src="img/logout_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</c:if>
							<!--</s:else> -->	
								
								<a class="loginout" href="#"><!--����--></a><img src="img/contactus_top_btn.png"></a>&nbsp;&nbsp;
						</td> 
					</tr>
					<!-- Login, out ó�� end -->
					
				
				<!-- tab dropdown-menu ���� start-->
					<tr> 
						<td colspan="2" style="vertical-align: top;"> <!-- ��� ��ġ�� ĭ����� --> 
							 <ul class="nav nav-tabs">
							    <li><a class="dropdown-toggle" href="index">Home</a></li>
								
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">��Ŀ�´�Ƽ��<span class="caret"><!--ȭ��ǥ--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallBoard?bcode=1">�Խ���</a></li>
								     <li><a href="selectallBoard?bcode=2">�����Խ���</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">�������ϱ⡡<span class="caret"><!--ȭ��ǥ--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="">�Ծ��û</a></li>
								     <li><a href="formCal">����Ȱ��</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">��X����X��<span class="caret"><!--ȭ��ǥ--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallAnimal">�����Ű�</a></li>
								     <li><a href="test">�߰ߺ���</a></li>
								   </ul>
								</li>

								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">��X����X��<span class="caret"><!--ȭ��ǥ--></span></a>
								   <ul class="dropdown-menu">
								     <li><a href="selectallCenter">��ȣ����</a></li>
								     <li><a href="formChart?year=2012">�׷���/��Ʈ</a></li>
								     <li><a href="formCenter">����</a></li>
								   </ul>
								</li>

	  						</ul>
						</td>  
				<!-- tab dropdown-menu ���� end-->
					</tr>
				</table>
			</div>
		</div>