<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	a:link {
	    text-decoration: none;
	}
		#memberinfomenubar{
		position: fixed; position: absolute; 
/*  		z-index: -1;  */
		overflow: hidden;
		left: 0px;
		top: 160px;
		margin: 0;
		padding: 0
	}
	.imgsize{
		width:100px;
		height:105px;
		padding-bottom: 10px
	}
	.deleteU{
		text-align: left; width: 50%; margin: auto; border: 1pz solid red;
		background-image: url('img/test/icon.png');background-repeat: no-repeat;
		background-position: right top; margin-top: 20px
	}
</style>

<div id="memberinfomenubar"> <!-- memberpage : userinfo/userupdate/myactivity/withdrawal.jsp에 사용할 submenu -->
<table style="margin-left: 130px;">
	<tr>
		<td><!-- 정보보기 -->
			<a href="selectoneMember"><img class="imgsize" src="img/test/myinfo.png"/></a>
		</td>  
	</tr>
	<tr><!-- 정보수정 -->
		<td><a href="updateformMember"><img class="imgsize" src="img/test/infoupdate.png"/></a></td>  
	</tr>
	<tr><!-- 나의 활동 -->
		<td><a href="selectAllMyActivity"><img class="imgsize" src="img/test/involved.png"/></a></td>  
	</tr>
	<tr><!-- 탈퇴 -->
		<td><a href="#"><img class="imgsize" src="img/test/withdrawal.png"/></a></td>
	</tr>
</table> 
</div>



<div class="deleteU">
	<!-- 공간 띄우기 용 -->
	<table><tr height="50px"><td></td></tr></table>
	
	
	<h1 style="font-size: 3.6em;">회원님!<p></p><strong>탈퇴하시겠습니까?</strong></h1>
	<h5 style="color: green; font-size: 1em">*관련된 게시물들 및 관련 DB가 모두 삭제됩니다. 지금까지 CtrlSAVE를 이용해 주셔서 감사합니다. <br></h5>
	
	<div style="text-align: right; margin-top: 20px">
		<button type="button" class="btn btn-success" onclick="goUrl('deleteMember')">네 탈퇴하겠습니다</button>
		<button type="button" class="btn btn-success" onclick="goUrl('selectoneMember')">아니요 탈퇴를 취소합니다</button>
	</div>
	
<%-- 	<input type="button" value="ㅇㅅㅇ ㅂㅂ" onclick="goUrl('deleteMember')">
	<c:url var="logout" value="j_spring_security_logout"/>
	<a type="button" href="deleteMember" onclick="location.href='${logout}';" target="_blank">ㅇㅅㅇ</a>
	<input type="button" value="사실 아님 데헷" onclick="goUrl('selectoneMember')"> --%>
	
</div>