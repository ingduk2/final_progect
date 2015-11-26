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
	width: 45px;
}
.bgwhite{
	background: rgba(255,255,255,0.8);
}
.reply{
	border-left: 1px solid #f0fff0;
	border-right: 1px solid #f0fff0;
}
	
	
/* 	jumbotron style start */
.jumbotron{
	padding-top: 5px;
	padding-bottom: 5px;
	margin-right: 10px;
	margin-left: 10px;
	margin-bottom: 5px;
	text-align: right;
	border-radius: 6px;
}
.jumbotron p{
	margin-bottom: 10px;
	font-size: 12px;
	font-weight: normal;
}

</style>

<div>		
	
<table width="50%">							
	<tr>	
		<th>제목</th>	
		<td colspan="5" class="bgwhite"> 
			${bvo.btitle}
		</td>					
	</tr>
	<tr>	
		<th>글쓴이</th>
		<td class="bgwhite" style="width: 220px">
			${bvo.mid}
		</td>	
		<th>작성일</th>	
		<td class="bgwhite">
			${bvo.bdate}
		</td>	
		<th>조회수</th>	
		<td class="bgwhite">
			${bvo.bhit }
		</td>	
	</tr>
	<tr>	
		<th colspan="6">내용</th>						
	</tr>
	<tr><!--수정 후에 height="200px" 지워야합니다.-->
		<td colspan="6" class="bgwhite" >
		<!-- 다운로드용 버튼 -->
			<div style="vertical-align: top; float: right; padding-right: 15px; padding: 5px">
				<a href='fileDown?fileName=${bvo.bfile}'>
				<button type="button" class="btn btn-success btn-xs">
					<span class="glyphicon glyphicon-paperclip"></span>&nbsp;
					DownloadFile
				</button></a>
			</div>
			<div style="text-align: left; padding: 20px">
				${bvo.bcontent}
			</div>
		
		<!-- 인사말인가 사진인가 뭐 여하튼 명함 들어가는곳 start -->
		  <div class="jumbotron">
		  	<div style="float: left; width: 90%">
			    <p>
			    	<b>${namecard.mid}님</b><br/>
			    	${namecard.mintro}
			    	<!-- 이게 인사말이 되겠지.. -->
			    </p>
		   </div> 
		   <div style="right:0; padding-right: 11px">
		   	<img src="img/${namecard.mimg}" class="alignleft img-circle" width="50px" height="50px">
		   </div>
		  </div>
		</td>
		<!-- 인사말인가 사진인가 뭐 여하튼 명함 들어가는곳 end -->
	</tr>
	
	<!-- 댓글 입력  -->
	<tr>
		<th>Comments</th>
		<td colspan="6">
	    	<div class="input-group col-xs-12">
		    	<form action="insertComm" method="post" >
		    	
		    	<input type="hidden" name="bno" value="${bvo.bno}">
		    	<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}">
		    	<input type="hidden" name="cbip" value="<%= request.getRemoteAddr() %>">
		    	<input type="hidden" name="orimid" value="${bvo.mid}">
		    	
		    	<div class="input-group" style="width: 100%">
		        	<input name="cbcontent" type="text" class="form-control input-sm " placeholder="Your comments">
		            	<span class="input-group-btn">
		            		<button type="submit" value="Add" class="btn btn-success btn-sm">&nbsp;
		            			<span class="glyphicon glyphicon-plus-sign"></span>Add&nbsp;
		            		</button>
		                </span>
		        </div>
		        </form>
	        </div>					
		</td>
	</tr>
	
	<!--  댓글 출력 -->
	<tr>
		<th><span class="glyphicon glyphicon-user"></span></th>
		<td colspan="6">
			<table width="100%">
				<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comment</th> <th>Date</th> <th style="width: 15px; font-size: 10px;"></th	> </tr>
				<!-- 댓글 부분 이곳에서 반복처리하면 됩니다. 시작 -->
				<c:forEach var="list" items="${list}">
					<tr> 
						<td>${list.mid}</td>
						<td class="reply" style="text-align: left; padding-left: 20px; width: 220px">
							${list.cbcontent}
						</td>
						<td>${list.cbdate}</td>
						<td>
							<a type="button" href="deleteComm?cbno=${list.cbno}&bno=${list.bno}&mid=${bvo.mid}">삭제</a>
						</td> 
					</tr>
				</c:forEach>
				<!-- 끝 -->
			</table>					
		</td>
	</tr>
</table>							

	<c:url var="reply" value="/formReply">
		<c:param name="bref" value="${bvo.bref}"/>
		<c:param name="bseq" value="${bvo.bseq}"/>
		<c:param name="blvl" value="${bvo.blvl}"/>
		<c:param name="bcode" value="${bvo.bcode}"/>
	</c:url>

<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
<button type="button" class="btn btn-success btn-sm" onclick="location='updateformBoard?bno=${bvo.bno}'">　수　　정　</button>
<button type="button" class="btn btn-success btn-sm" onclick="location='deleteBoard?bno=${bvo.bno}&bcode=${bvo.bcode}'">　삭　　제　</button>
<button type="button" class="btn btn-success btn-sm" onclick="location='selectallBoard?bcode=${bvo.bcode}'">　목　　록　</button>
<a href="${reply}" type="button" class="btn btn-success btn-sm">　답　　변　</a>
</div>