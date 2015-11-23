<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

a.thumbnail:focus, a.thumbnail:hover{
	color: #90ee90
}
a.nounderline {text-decoration: none; } 
a.thumbnail.active, a.thumbnail:focus, a.thumbnail:hover{
	border-color:#EDEDED
}

 	.numbering{ 
  		clear: both; 
/ 	}  

</style>

<h2>
	<img src="img/imgboardtitle.png" width="300px">
</h2>
<!-- 테이블 태그 삭제해야지됨... -->	

<!--수정 해야함 -->
<!-- <div class="col-md-offset-3 col-md-8 center"> -->
	<div class="col-md-offset-2 col-md-8 center"> 
	
			 <c:if test="${size!=0}">
			 <c:set var="doneLoop" value="false"/>
		 	<c:forEach var="i" begin="0" end="11" step="4"> 
		 	<div>
		 	
		 			 	
		 	<c:if test="${not doneLoop }">
		 	
			<div class="col-md-3">
				<a href="imgboarddetail?anino=${alist[i].anino}&bno=${alist[i].bno}" class="thumbnail nounderline">
					<h5 style="text-align: left; padding-left: 15px"><span class="label label-warning">뭐게?</span></h5>
					<img src="upload/${alist[i].aniimg}" style="width: 150px; height: 150px"></a>
					<p><label>동물번호: </label>${alist[i].anino}<br><label>동물종류: </label>${alist[i].anispecies}<br><label>동물품종: </label>${alist[i].anibreed}<br>
						<label>동물이름: </label>${alist[i].aniname}<br><label>나이 :</label>${alist[i].aniage}<br><label>성별: </label>${alist[i].anisex}<br>
						<label>발견지역: </label>${alist[i].aniregion}<br><label>발견일자: </label>${alist[i].anidate}<br>
					</p> 
			</div>
			
			<c:if test="${i==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
			<c:if test="${not doneLoop }">
			
			<div class="col-md-3">
				<a href="imgboarddetail?anino=${alist[i+1].anino}&bno=${alist[i+1].bno}" class="thumbnail nounderline">
					<h5 style="text-align: left; padding-left: 15px"><span class="label label-warning">뭐게?</span></h5>
					<img src="upload/${alist[i+1].aniimg}"  style="width: 150px; height: 150px"></a>
				<p><label>동물번호: </label>${alist[i+1].anino}<br><label>동물종류: </label>${alist[i+1].anispecies}<br><label>동물품종: </label>${alist[i+1].anibreed}<br>
						<label>동물이름: </label>${alist[i+1].aniname}<br><label>나이 :</label>${alist[i+1].aniage}<br><label>성별: </label>${alist[i+1].anisex}<br>
						<label>발견지역: </label>${alist[i+1].aniregion}<br><label>발견일자: </label>${alist[i+1].anidate}<br>
					</p> 
				
			</div>
			
			<c:if test="${i+1==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
		
			<c:if test="${not doneLoop }">
			
			<div class="col-md-3">
				<a href="imgboarddetail?anino=${alist[i+2].anino}&bno=${alist[i+2].bno}" class="thumbnail nounderline">
					<h5 style="text-align: left; padding-left: 15px"><span class="label label-warning">뭐게?</span></h5>
					<img src="upload/${alist[i+2].aniimg}"  style="width: 150px; height: 150px"></a>
					<p><label>동물번호: </label>${alist[i+2].anino}<br><label>동물종류: </label>${alist[i+2].anispecies}<br><label>동물품종: </label>${alist[i+2].anibreed}<br>
						<label>동물이름: </label>${alist[i+2].aniname}<br><label>나이 :</label>${alist[i+2].aniage}<br><label>성별: </label>${alist[i+2].anisex}<br>
						<label>발견지역: </label>${alist[i+2].aniregion}<br><label>발견일자: </label>${alist[i+2].anidate}<br>
					</p> 
			</div>
			
			
			<c:if test="${i+2==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
			<c:if test="${not doneLoop }">
			 <td>
				<div class="col-md-3">
					<a href="imgboarddetail?anino=${alist[i+3].anino}&bno=${alist[i].bno}" class="thumbnail nounderline">
						<h5 style="text-align: left; padding-left: 15px"><span class="label label-warning">뭐게?</span></h5>
						<img src="upload/${alist[i+3].aniimg}"  style="width: 150px; height: 150px"></a>
						<p><label>동물번호: </label>${alist[i+3].anino}<br><label>동물종류: </label>${alist[i+3].anispecies}<br><label>동물품종: </label>${alist[i+3].anibreed}<br>
						<label>동물이름: </label>${alist[i+3].aniname}<br><label>나이 :</label>${alist[i+3].aniage}<br><label>성별: </label>${alist[i+3].anisex}<br>
						<label>발견지역: </label>${alist[i+3].aniregion}<br><label>발견일자: </label>${alist[i+3].anidate}<br>
					</p> 					
				</div>
				</td>				
				<c:if test="${i+3==(size-1) }">
						<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
		
			</div>
			</c:forEach>
			</c:if>
			
		<div class="numbering">
		<td>${page}</td>
			<br><button type="button" class="btn btn-success btn-sm" onclick="location='imgboardwrite'">　글 쓰 기　</button><br><br>
<!-- 			<input type="button" value="click" onclick="goUrl('aniboardwrite')"/><br> -->
<!-- 			<span class="glyphicon glyphicon-circle-arrow-left"></span> -->
<!-- 				<s:property value="pagingCode" escape="false"/> -->
<!-- 			<span class="glyphicon glyphicon-circle-arrow-right"></span> -->
			
		</div>
		
	</div>
