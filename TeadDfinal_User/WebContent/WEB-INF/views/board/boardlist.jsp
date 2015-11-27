<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 메뉴바와 게시판 리스트 사이 공간 띄움
	- bcode 1 (공지사항) 에서는 글쓰기 버튼 안보이게 함
	- 각종 멘트 변경
	- bcode에 따라 어디 게시판인지 출력하도록 함
 -->

<style>
	.glyphicon {
		color: #8fbc8f
	}
</style>

<div id="bg">
<!-- 공간 띄우기 용 -->
<table><tr height="50px"><td></td></tr></table>

<table>
	<thead style="font-weight:bold; color:black;">
		<c:if test="${bcode == 1}">
			<tr id="title"> <td colspan="5">공지사항</td> </tr>
		</c:if>
		<c:if test="${bcode == 2}">
			<tr id="title"> <td colspan="5">자유 게시판</td> </tr>
		</c:if>
		<c:if test="${bcode == 3}">
			<tr id="title"> <td colspan="5">질문 게시판</td> </tr>
		</c:if>
		<tr> <td colspan="5">　</td> </tr>
		<tr id="title"> <td colspan="2" width="300px">제목</td><td width="180px">작성자</td><td width="100px">작성일</td><td>조회</td> </tr>
	</thead>
	
	<tbody id="tbodycss">
	
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td style="text-align: left; padding-left: 20px">
					<c:forEach begin="1" end="${list.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${list.blvl != 0}">
						<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
					</c:if>
					<a href="selectoneBoard?bno=${list.bno}&mid=${list.mid}">
						${list.btitle}
					</a>
				</td>
				<td>${list.mid}</td>
				<td>${list.bdate}</td>
				<td>${list.bhit}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	
	
	
	<tfoot>
		<tr> 
			<td colspan="3"></td>  
			<td colspan="2"> 
			
				<!-- 공지사항 게시판에서는 글쓰기 버튼 안보이게 -->
				<c:if test="${bcode != 1}">
					<button type="submit" onclick="location='formBoard?bcode=${bcode}'" class="btn btn-success btn-sm">
						&nbsp;&nbsp;글 쓰 기&nbsp;&nbsp;
					</button>
				</c:if>
				 
			</td> 
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
						<!--  다이나믹쿼리로 검색기능 추가할 부분 -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">제목</option>
					        <option value="2">작성자</option>
					        <option value="3">내용</option>
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
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