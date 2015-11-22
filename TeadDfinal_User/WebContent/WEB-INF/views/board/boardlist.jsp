<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="bg">
	<img src="img/boardTitle.png" width="200px">

<table>
	<thead style="font-weight:bold; color:black;">
		<tr id="title"> <td colspan="2" width="300px">제목</td><td width="180px">작성자</td><td width="100px">작성일</td><td>조회</td> </tr>
	</thead>
	
	<tbody id="tbodycss">
	
	<!--관리자 공지용 table 만들어야함. -->
	
	

	<!-- 요기밑에 주석 지워버릴거임 -->
	<!--<tr> <td>seq</td><td>title</td><td>write</td><td>sysdate</td><td>hit</td> </tr> -->
	
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td><a href="boarddetail?bno=${list.bno}">${list.btitle}</a></td>
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
				<button type="submit" onclick="location='boardwrite?bcode=${bcode}'" class="btn btn-default btn-xs">
					글쓰기
				</button> 
			</td> 
		</tr>
	</tfoot>
	
	</table>
	
	<table><!-- 넘버링이랑, 검색, 글쓰기버튼,  --> 
		<thead> 
			<tr> <td colspan="5"> <!-- 페이징작업부분입니다. --> Numbering  </td> </tr>

			<tr>  
<!-- 					<td></td> -->
				<td> &nbsp;
						<!--  다이나믹쿼리로 검색기능 추가할 부분 -->
				      <select class="form-control input-sm" id="sel1">
					        <option>제목</option>
					        <option>작성자</option>
					        <option>내용</option>
				      </select>
				      &nbsp;
				</td>
				<td>
					&nbsp;<input class="form-control input-sm" type="text"  />&nbsp;
				</td>
				<td>
				 <!--  검색버튼, 파라미터값넘길부분  -->
					&nbsp;<button type="button" class="btn btn-default btn-sm">검색</button> &nbsp;
				</td>  
<!-- 					<td></td>   -->
			</tr>
			</thead>
	</table>
</div>