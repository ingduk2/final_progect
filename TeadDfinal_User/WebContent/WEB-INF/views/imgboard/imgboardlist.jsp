<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	a.thumbnail:focus, a.thumbnail:hover {
		color: #90ee90
	}
	a.nounderline {
		text-decoration: none; 
	} 
	a.thumbnail.active, a.thumbnail:focus, a.thumbnail:hover{
		border-color:#EDEDED
	}
 	.numbering{ 
  		clear: both; 
 	}  

	.tag {
		text-align: left;
		padding-left: 10px;
	}
	.img {
		width: 180px; 
		height: 180px;
	}
	.container {
		width: 180px;
		table-layout: fixed;
	}
	.content {
		width: 100%; 
		padding-top: 5px; 
		padding-left: 10px;
		padding-right: 10px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 12px;
	}
	
</style>



<!-- 공간 띄우기 용 -->
<table><tr height="50px"><td></td></tr></table>



<div class="col-md-offset-3 col-md-6 col-md-offset-3 center">

	<c:if test="${size != 0}">
		<c:set var="doneLoop" value="false" />
		
		<c:forEach var="i" begin="0" end="8" step="3">
		
			<div>
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">얌마!</span>
						</h5>
					
						<a href="#" class="thumnail nounderline">
							<img src="" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">여기에는 해당 글의 제목이 나오게 할 예정입니다.</th>
							</tr>
							<tr>
								<th class="content">AAAAA</th>
							</tr>
							<tr>
								<th class="content">BBBBB</th>
							</tr>
							<tr>
								<th class="content">CCCCC</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">얌마!</span>
						</h5>
					
						<a href="#" class="thumnail nounderline">
							<img src="" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">여기에는 해당 글의 제목이 나오게 할 예정입니다.</th>
							</tr>
							<tr>
								<th class="content">AAAAA</th>
							</tr>
							<tr>
								<th class="content">BBBBB</th>
							</tr>
							<tr>
								<th class="content">CCCCC</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i+1 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						<h5 class="tag">
							<span class="label label-warning">얌마!</span>
						</h5>
					
						<a href="#" class="thumnail nounderline">
							<img src="" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">여기에는 해당 글의 제목이 나오게 할 예정입니다.</th>
							</tr>
							<tr>
								<th class="content">AAAAA</th>
							</tr>
							<tr>
								<th class="content">BBBBB</th>
							</tr>
							<tr>
								<th class="content">CCCCC</th>
							</tr>
						</table>
					</div>
					
					<c:if test="${i+2 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
			</div>
			
		</c:forEach>
	</c:if>

	<!-- 여기부터 무언가 더... -->
	<!-- 행과 행 사이 띄우기... -->
	<!-- 일반 게시판 처럼 위에 꾸미기? -->
	
	<input type="button" class="btn btn-success btn-sm" value="글 등록" onclick="location=''">

</div>


<!-- 		<div class="numbering"> -->
<%-- 		<td>${page}</td> --%>
<!-- 			<br><button type="button" class="btn btn-success btn-sm" onclick="location='formAnimal'">　등 록　</button><br><br> -->
<!--  			<input type="button" value="click" onclick="goUrl('aniboardwrite')"/><br> -->
<!--  			<span class="glyphicon glyphicon-circle-arrow-left"></span> -->
<!--  				<s:property value="pagingCode" escape="false"/> -->
<!--  			<span class="glyphicon glyphicon-circle-arrow-right"></span> -->
			
<!-- 		</div> -->
		
<!-- 	</div> -->
