<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 메뉴바와 폼 사이 공간 띄움
	- 각종 멘트 변경
	- 업로드 된 파일 없을 시 처리
	- 글 작성자가 아니면 수정, 삭제 버튼 숨김
 -->

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

<script>
	function checksubmit() {
		
		if (document.commform.cbcontent.value == "") {
			alert("내용을 입력해주세요")
			document.commform.cbcontent.focus()
			return false
		}
		
		return true;
	}
	
$(document).ready(function(){
	    $("#reportBtn").click(function(){
			$.ajax({
				url: "updateRptAnimal",
				type: "post",
				data:{
					bno:$("#bno").val(),
					mid:$("#mid").val(),
					rpt:$("#rpt").html()
				}, 
				success : function(rpt){
					if(rpt==$("#rpt").html()){
						$("#rpt").html();
						alert("금일 신고수가 초과하였습니다");
					}else if($("#rpt").html()>=15){
							alert("게시물이 삭제됩니다.")
						location.href='selectallBoard?bcode=${bvo.bcode}&nowPage=${nowPage}&searchType=';
					}else{
					$("#rpt").html(rpt);
					}
				}
			});
		});

</script>

<div>		
<input type="hidden" id="mid" value="${pageContext.request.userPrincipal.name}"/>
<!-- 공간 띄우기 용 -->
<table><tr height="50px"><td></td></tr></table>
	
<table width="50%">							
	<tr>	
		<th>제목</th>	
		<td colspan="7" class="bgwhite"> 
			${bvo.btitle}
		</td>					
	</tr>
	<tr>	
		<th>글쓴이</th>
		<td class="bgwhite" style="width: 190px">
			${bvo.mid}
		</td>	
		<th>작성일</th>	
		<td class="bgwhite" style="width: 190px">
			${bvo.bdate}
		</td>	
		<th>조회수</th>	
		<td class="bgwhite" style="width: 50px">
			${bvo.bhit }
		</td>
		
		<th>신고수</th>	
		<td class="bgwhite" style="width: 50px" id="rpt">
			${bvo.brpt }
		</td>	
	</tr>
	<tr>	
		<th colspan="8">내용</th>						
	</tr>
	<tr><!--수정 후에 height="200px" 지워야합니다.-->
		<td colspan="8" class="bgwhite" >
		<!-- 다운로드용 버튼 -->
			<div style="vertical-align: top; float: right; padding-right: 15px; padding: 5px">
				<c:if test="${bvo.bfile != null}">
					<a href='fileDown?fileName=${bvo.bfile}'>
					<button type="button" class="btn btn-success btn-xs">
						<span class="glyphicon glyphicon-paperclip"></span>&nbsp;
						DownloadFile
					</button></a>
				</c:if>
				
				<c:if test="${bvo.bfile == null}">
					<a href='#'>
					<button type="button" class="btn btn-success btn-xs">
						<span class="glyphicon glyphicon-paperclip"></span>&nbsp;
						DownloadFile
					</button></a>
				</c:if>
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
		<th>Comment</th>
		<td colspan="8">
	    	<div class="input-group col-xs-12">
		    	<form action="insertComm" method="post"
		    		  name="commform" onsubmit="return checksubmit()">
		    	
		    	<input type="hidden" name="bno"  id ="bno" value="${bvo.bno}">
		    	<input type="hidden" name="cbip" value="<%= request.getRemoteAddr() %>">
		    	<input type="hidden" name="orimid" value="${bvo.mid}">
		    	<input type="hidden" name="nowPage" value="${nowPage}">
		    	
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
		<td colspan="8">
			<table width="100%">
				<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comments</th> <th>Date</th> <th style="width: 15px; font-size: 10px;"></th	> </tr>
				<!-- 댓글 부분 이곳에서 반복처리하면 됩니다. 시작 -->
				<c:forEach var="list" items="${list}">
					<tr> 
						<td>${list.mid}</td>
						<td class="reply" style="text-align: left; padding-left: 20px; width: 220px">
							${list.cbcontent}
						</td>
						<td>${list.cbdate}</td>
						<td>
							<a type="button" href="deleteComm?cbno=${list.cbno}&bno=${list.bno}&mid=${bvo.mid}&nowPage=${nowPage}">삭제</a>
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
		
		<c:param name="bno" value="${bvo.bno}" />
		<c:param name="mid" value="${bvo.mid}" />
		
		<c:param name="nowPage" value="${nowPage}" />
	</c:url>

<table><tr height="30px"><!-- 높이 조절용 칸 띄우기 --><td></td></tr></table>
<c:if test="${pageContext.request.userPrincipal.name == bvo.mid}">
	<button type="button" class="btn btn-success btn-sm" onclick="location='updateformBoard?bno=${bvo.bno}&nowPage=${nowPage}'">　수　　정　</button>
	<button type="button" class="btn btn-success btn-sm" onclick="location='deleteBoard?bno=${bvo.bno}&bcode=${bvo.bcode}'">　삭　　제　</button>
</c:if>
<a href="${reply}" type="button" class="btn btn-success btn-sm">　답　　변　</a>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<button type="button" class="btn btn-success btn-sm" id="reportBtn">　신　　고　 </button>
</c:if>

<button type="button" class="btn btn-success btn-sm" onclick="location='selectallBoard?bcode=${bvo.bcode}&nowPage=${nowPage}&searchType='">　목　　록　</button>

</div>
