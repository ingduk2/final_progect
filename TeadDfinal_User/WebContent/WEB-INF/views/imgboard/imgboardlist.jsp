<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>

</script>

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
					
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i].anistate == 0}">
								<h5 class="tag">
									<span class="label label-warning">보호중</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 1}">
								<h5 class="tag">
									<span class="label label-warning">입양 대기</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 2}">
								<h5 class="tag">
									<span class="label label-warning">입양 완료</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i].anistate == 3}">
								<h5 class="tag">
									<span class="label label-warning">실종</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 4}">
								<h5 class="tag">
									<span class="label label-warning">목격</span>
								</h5>
							</c:if>
							<c:if test="${alist[i].anistate == 5}">
								<h5 class="tag">
									<span class="label label-warning">개인 보호</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i].anino}&bno=${alist[i].bno}" class="thumnail nounderline">
							<img src="img/${alist[i].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">지역 : ${alist[i].aniregion}</th>
							</tr>
							<tr>
								<th class="content">날짜 : ${alist[i].anidate}</th>
							</tr>
							<c:if test="${alist[i].anistate == 3}">
								<tr>
									<th class="content">사례 : ${alist[i].anireward} 원</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i+1].anistate == 0}">
								<h5 class="tag">
									<span class="label label-warning">보호중</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 1}">
								<h5 class="tag">
									<span class="label label-warning">입양 대기</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 2}">
								<h5 class="tag">
									<span class="label label-warning">입양 완료</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i+1].anistate == 3}">
								<h5 class="tag">
									<span class="label label-warning">실종</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 4}">
								<h5 class="tag">
									<span class="label label-warning">목격</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+1].anistate == 5}">
								<h5 class="tag">
									<span class="label label-warning">개인 보호</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i+1].anino}&bno=${alist[i+1].bno}" class="thumnail nounderline">
							<img src="img/${alist[i+1].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+1].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+1].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i+1].anibreed}</th>
							</tr>
							<tr>
								<th class="content">지역 : ${alist[i+1].aniregion}</th>
							</tr>
							<tr>
								<th class="content">날짜 : ${alist[i+1].anidate}</th>
							</tr>
							<c:if test="${alist[i+1].anistate == 3}">
								<tr>
									<th class="content">사례 : ${alist[i+1].anireward} 원</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i+1 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
					<div class="col-md-4">
						
						<c:if test="${bcode == 6}">
							<c:if test="${alist[i+2].anistate == 0}">
								<h5 class="tag">
									<span class="label label-warning">보호중</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 1}">
								<h5 class="tag">
									<span class="label label-warning">입양 대기</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 2}">
								<h5 class="tag">
									<span class="label label-warning">입양 완료</span>
								</h5>
							</c:if>
						</c:if>
						<c:if test="${bcode != 6}">
							<c:if test="${alist[i+2].anistate == 3}">
								<h5 class="tag">
									<span class="label label-warning">실종</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 4}">
								<h5 class="tag">
									<span class="label label-warning">목격</span>
								</h5>
							</c:if>
							<c:if test="${alist[i+2].anistate == 5}">
								<h5 class="tag">
									<span class="label label-warning">개인 보호</span>
								</h5>
							</c:if>
						</c:if>
					
						<a href="selectoneAnimal?anino=${alist[i+2].anino}&bno=${alist[i+2].bno}" class="thumnail nounderline">
							<img src="img/${alist[i+2].aniimg}" class="img">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${alist[i+2].btitle}</th>
							</tr>
							<tr>
								<th class="content">${alist[i+2].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${alist[i+2].anibreed}</th>
							</tr>
							<tr>
								<th class="content">지역 : ${alist[i+2].aniregion}</th>
							</tr>
							<tr>
								<th class="content">날짜 : ${alist[i+2].anidate}</th>
							</tr>
							<c:if test="${alist[i+2].anistate == 3}">
								<tr>
									<th class="content">사례 : ${alist[i+2].anireward} 원</th>
								</tr>
							</c:if>
						</table>
					</div>
					
					<c:if test="${i+2 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
			</div>
			
			<!-- 공간 띄우기 용 -->
			<table><tr><td>　</td></tr></table>
			
		</c:forEach>
	</c:if>

<%-- 	<input type="hidden" name="bcode" value="${bcode }">  --%>
	<div class="numbering">
	<br>
	<!-- 입양신청에서는 글쓰기 안보이게 -->
	<c:if test="${bcode != 6}">
		<button type="button" class="btn btn-success btn-sm" onclick="location='formImgBoardWrite?bcode=${bcode}'">　글 등 록　</button>
	</c:if>
	<br><br>
	
	<form action="selectallAnimal" method="post">
	<table><!-- 넘버링이랑, 검색, 글쓰기버튼,  --> 
		<thead>
		<tr>
		<td colspan="5">
<!-- 			<span class="glyphicon glyphicon-circle-arrow-left"></span> -->
			${pagingCode}
<!-- 			<span class="glyphicon glyphicon-circle-arrow-right"></span> -->
		</td>
		</tr>
		</thead>
		<tbody>
			<tr>  
				<td> &nbsp;
						<!--  다이나믹쿼리로 검색기능 추가할 부분 -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">동물</option>
					        <option value="2">품종</option>
					        <option value="3">지역</option>
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
					<input type="hidden" name="nowPage" value="1">
					<input type="hidden" name="bcode" value="${bcode }">
				</td>
				<td>&nbsp;
				 <!--  검색버튼, 파라미터값넘길부분  -->
					<button type="submit" class="btn btn-default btn-sm">검색</button> &nbsp;
				</td>  
			</tr>
		</tbody>
	</table>
	</form>
		
	
	</div>
</div>
