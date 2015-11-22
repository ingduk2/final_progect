<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

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
		background-color: white;
		opacity: 0.6;
	}
	.reply{
		border-left: 1px solid #f0fff0;
		border-right: 1px solid #f0fff0;
	}
	.alert{
		text-align: left;
	}
	/*----------이미지 마우스 오버 스타일---------*/
	.tooltip.top .tooltip-inner {
    	background-color:#f5fffa;
	}
	.tooltip.top .tooltip-arrow {
	    border-top-color: #f5fffa;
	}
	.tooltip-inner{
		color:green;
	}

</style>

<script> //image mouse over script
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
</script>


	<div>		
		<img src="img/boarddetail.png" width="300px">
		
<!-- 		<table width="50%" border="1px">							 -->
		<table style="border:1px ; width: 500px"> 
			<tr>	
				<th>제목</th>	
				<td colspan="5" class="bgwhite"> 
					${avo.btitle }
				</td>					
			</tr>
			<tr>	
				<th>글쓴이</th>
				<td class="bgwhite">${avo.mid}</td>	
				<th>작성일</th>	
				<td class="bgwhite">${avo.bdate }</td>	
				<th>조회수</th>	
				<td class="bgwhite">${avo.bhit}<!--hit--></td>	
			</tr>
			<tr>	
				<th colspan="6">${avo.anifeature}</th>						
			</tr>
			
			<tr>
				<td colspan="6"><br>
				
					<!-- img/a.PNG가 이미지 뿌려주는 곳 -->
					<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="자세한 정보를 보려면 사진 아래 버튼을 클릭해주세요!">
						<img src="upload/${avo.aniimg}" class="img-rounded" alt="NOT available" width="304" height="236">
					</a>
					
					<!--애기설명start-->
					<div id="demo" class="collapse alert alert-success"><br>
						<!--이름, 품종, 나이, 성별, 크기, 몸무게, 특징, 지역, 날짜-->
						  <ul class="list-group">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-gift"></span>
						    	<label>이 름: </label>${avo.aniname}<!-- 이름이름넣어주세요 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>품 종: </label>${avo.anibreed}<!-- 품종 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>나 이: </label>${avo.aniage}<!-- 나이 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>성 별: </label>${avo.anisex}<!-- 성별 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>크 기: </label>${avo.anisize}<!-- 크기 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>특 징: </label>${avo.anifeature}<!-- 특징 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>지 역: </label>${avo.aniregion}<!-- 지역 -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>실종일자: </label>${avo.anidate}<!-- 날짜 -->
						    </li>
						  </ul> 
					</div><p>
					<button type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo">
						<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;ClickHere
					</button>
					<!--애기설명End-->
				</td>
			</tr>
			
			<tr height="500px">	<!-- 내용 들어가면 height="500px" 빼줘야함 -->
				<td colspan="6" class="bgwhite" >
					${avo.bcontent}
				</td>						
			</tr>
			
			<!-- 댓글 입력  -->
			
			
			<tr>
			
				<th>Comments</th>
				<td colspan="6">
					<form method="post" action="commInsert">
				    	<div class="input-group col-xs-12">
<%-- 				    		<input type="hidden" name="mid" value="${sessionScope['loginid']}"/> --%>
				    		<input type="text" name="mid" value="테스트"/>
				    		<input type="hidden" name="bno" value="${avo.bno}"/>
				    		<input type="hidden" name="anino" value="${avo.anino}"/>
				    		<input type="hidden" name="cbip" value="<%=request.getRemoteAddr() %>">
				        	<input type="text" name="cbcontent" class="form-control input-sm " placeholder="Your comments">
				            	<span class="input-group-btn">
<!-- 				            	 <span class="btn btn-success btn-sm">&nbsp; -->
				                    <button type="submit" value="ADD" class="btn btn-success btn-sm">&nbsp;
				                    	<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add
				                    </button>
<!-- 				                     </span> -->
				                </span>
				        </div>		
				    </form>			
				</td>
				
			</tr>
			
			<!--  댓글 출력 -->
			<tr>
				<th><span class="glyphicon glyphicon-user"></span></th>
				<td colspan="6">
					<table width="100%">
						<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comment</th> <th>Date</th> </tr>
						<!-- 댓글 부분 이곳에서 반복처리하면 됩니다. 시작 -->
						
			<%-- 			 <s:iterator value="list"> <!-- 갑가져오기 -->
			 <tr> <td width="30px"><s:property value="bno"/></td><td><a href="bdetail?bno=${bno}"><s:property value="btitle"/></a></td>
			 <td><s:property value="mid"/></td><td><s:property value="bdate"/></td>
			 <td><s:property value="bhit"/></td> </tr>
			 </s:iterator> --%>
						
						<c:forEach var="cbvo" items="${cbvo }">
						<tr> 
							<td>${cbvo.mid }</td>
							<td class="reply">
								${cbvo.cbcontent }
								<!-- Comment내용이나오겠지,아마도! -->
							</td>
							<td>${cbvo.cbdate }</td> 
						</tr>
						</c:forEach>
						<!-- 끝 -->
					</table>					
				</td>
			</tr>
		</table>							

		
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="location='imgupdateform?anino=${avo.anino}'">　수　　정　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='imgboarddelete?anino=${avo.anino}'">　삭　　제　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='imgboardlist'">　목　　록　</button>
	</div>		
