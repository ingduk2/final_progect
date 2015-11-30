<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.glyphicon {
		color: #8fbc8f
	}
	
		table th {
		font-weight: bold;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
		color: gray;
		background-color:hsla(120,100%,75%,0.3);
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
/* 	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
	} */
	
	/* 이미지용 Css */
	/* 메뉴바용스타일 */
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
	.involved{
		width: 50%;
		margin: auto;
/* 		border: 1px solid red;  */
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
		<td><a href="#"><img class="imgsize" src="img/test/involved.png"/></a></td>  
	</tr>
	<tr><!-- 탈퇴 -->
		<td><a href="formWithdrawal"><img class="imgsize" src="img/test/withdrawal.png"/></a></td>
	</tr>
</table> 
</div>



<div class="involved" >
	<!-- 공간 띄우기 용 -->
	<table><tr height="50px"><td></td></tr></table>
	
	<table style="width: 100%">
		<thead>
			<tr id="title"> <td colspan="6">내 글 모음</td> </tr>
			<tr> <td colspan="5">　</td> </tr>
			<tr id="title"> <td colspan="3">제목</td><td>작성자</td><td>작성일</td><td>조회</td> </tr>
		</thead>
		
		<tbody id="tbodycss">
		
			<c:forEach var="mine" items="${mine}">
				<tr>
					<td>${mine.bno}</td>
					
					<c:if test="${mine.bcode==2 }">
						<td>자유</td>
					</c:if>
					<c:if test="${mine.bcode==3 }">
						<td>질문</td>
					</c:if>
					
					<td style="text-align: left; padding-left: 20px">
						<c:forEach begin="1" end="${mine.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
						<c:if test="${mine.blvl != 0}">
							<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
						</c:if>
						<a href="selectoneBoard?bno=${mine.bno}&mid=${mine.mid}">
							${mine.btitle}
						</a>
					</td>
					<td>${mine.mid}</td>
					<td>${mine.bdate}</td>
					<td>${mine.bhit}</td>
				</tr>
			</c:forEach>
			
		</tbody>
		
		<tfoot>
			<tr> 
				<td></td>  
			</tr>
		</tfoot>
		
	</table>
	
	<form action="" method="post">
		<table><!-- 넘버링이랑, 검색, 글쓰기버튼,  --> 
			<thead> 
				<tr> <td colspan="5"> <!-- 페이징작업부분입니다. --> Numbering  </td> </tr>
			</thead>
			<tbody>
				<tr>  
					<td> &nbsp;
<!-- 							 다이나믹쿼리로 검색기능 추가할 부분 -->
					      <select name="searchType" class="form-control input-sm" id="sel1">
						        <option value="1">제목</option>
						        <option value="2">내용</option>
					      </select>&nbsp;
					</td>
					<td>&nbsp;
						<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
					</td>
					<td>&nbsp;
<!-- 					  검색버튼, 파라미터값넘길부분  -->
						<button type="submit" class="btn btn-default btn-sm">검색</button> &nbsp;
					</td>  
				</tr>
			</tbody>
		</table>
	</form>
</div>