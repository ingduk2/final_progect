<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cafcd4fae4be10d7ffdde1bc7cadf004&libraries=services"></script>

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
	
	
	/*============================================*/
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
		width: 160px; 
		height: 160px;
	}
	.container {
		width: 180px;
		table-layout: fixed;
	}
	.content{
		width: 100%; 
		padding-top: 5px; 
		padding-left: 10px;
		padding-right: 10px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 12px;
		opacity:1;
		background-color: transparent;
		text-align: left;
		
	}
	.col-md-4{
		border-radius:15px;
		margin: 10px;
		width: 190px;
		padding-top: 15px;
		padding-bottom: 10px;
 		background-color: rgba(255, 255, 255, 0.8);
 		margin-top: 15px;
 		margin-bottom: 15px;
	}
	
	/*============================================*/

</style>

<script> //image mouse over script
	$(document).ready(function(){
		
// 		$('#map').empty();
		
		
	    $('[data-toggle="tooltip"]').tooltip();   
	   
	    $("#reportBtn").click(function(){
			$.ajax({
				url: "updateRptAnimal",
				type: "post",
				data:{
					bno:$("#bno").val(),
					anino:$("#anino").val(),
					mid:$("#mid").val(),
					rpt:$("#rpt").html()
				}, 
				success : function(rpt){
					if(rpt==$("#rpt").html()){
						$("#rpt").html();
						alert("금일 신고수가 초과하였습니다");
					}else if($("#rpt").html()>=15){
							alert("게시물이 삭제됩니다.")
						location.href='selectallAnimal?bcode=${avo.bcode}&nowPage=1&searchType=';
					}else{
					$("#rpt").html(rpt);
					}
				}
			});
		});
	    
	    $('#showmap').click(function() {
// 			$('#map').show();

	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 


		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		
		var addr=$('#addr').val();
		// 주소로 좌표를 검색합니다
		geocoder.addr2coord(addr, function(status, result) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		        
		        mapContainer.style.display="block";
		        map.relayout();
		        
		        map.setCenter(coords);  //가운데로!
		        
		      //지도에 표시할 원을 생성합니다
		        var circle = new daum.maps.Circle({
		            center : new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng),  // 원의 중심좌표 입니다 
		            radius: 120, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 5, // 선의 두께입니다 
		            strokeColor: '#41DA41', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'dashed', // 선의 스타일 입니다
		            fillColor: '#f5fffa', // 채우기 색깔입니다
		            fillOpacity: 0.7  // 채우기 불투명도 입니다   
		        }); 

		        // 지도에 원을 표시합니다 
		        circle.setMap(map); 
		        
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		    } 
		    
		}); 
		});
	    
		});
	
    
</script>



<div>		

	<!-- 공간 띄우기 용 -->
	<table><tr height="50px"><td></td></tr></table>
	

	<table style="border:1px ; width: 50%"> 
<%-- 		<tr><td colspan="4" style="margin-right: 0px;"><input type="button" id="rpt" value="신고하기" /></td><td><label>신고수 : </label></td><td><label id="rptchk">${avo.brpt}</label></td></tr> --%>
		
		
		<tr>	
			<th>제목</th>	
			<td colspan="7" class="bgwhite"> 
				${avo.btitle }
			</td>					
		</tr>
		
		<tr>	
			<th>글쓴이</th>
			<td class="bgwhite" style="width: 190px">
				${avo.mid}
			</td>	
			<th>작성일</th>	
			<td class="bgwhite" style="width: 190px">
				${avo.bdate }
			</td>	
			<th>조회수</th>	
			<td class="bgwhite" style="width: 50px">
				${avo.bhit}
			</td>
			<th>신고수</th>	
			<td class="bgwhite" style="width: 50px" id="rpt">
				${avo.brpt }
			</td>	
		</tr>

		<tr>	
			<th colspan="8">　</th>						
		</tr>
			
		<tr>
			<td colspan="8"><br>
			
				<!-- img/a.PNG가 이미지 뿌려주는 곳 -->
				<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="위치를 확인하려면 아래 '위치 확인' 버튼을 클릭해주세요!">
					<img src="img/${avo.aniimg}" class="img-rounded" alt="NOT available" width="70%">
				</a>
				
				<br /><br />
				
				
				<!--애기설명start-->
<!-- 				<div id="demo" class="collapse alert alert-success"><br> -->
				<div id="" class="alert alert-success"><br>
					<!--이름, 품종, 나이, 성별, 크기, 몸무게, 특징, 지역, 날짜-->
					  <ul class="list-group">
					  	
					  	<li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>이　름:　</label>${avo.aniname}<!-- 이름이름넣어주세요 -->
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>품　종:　</label>${avo.anispecies}　/　${avo.anibreed}<!-- 품종 -->
					    </li>
					    
					    <c:if test="${avo.anisex == '모름'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>성　별:　</label><!-- 성별 -->
						    </li>
					    </c:if>
					    <c:if test="${avo.anisex != '모름'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>성　별:　</label>${avo.anisex}<!-- 성별 -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.anineutral == '모름'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>중성화:　</label><!-- 성별 -->
						    </li>
					    </c:if>
					    <c:if test="${avo.anineutral != '모름'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>중성화:　</label>${avo.anineutral}<!-- 성별 -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.aniage == 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>나　이:　</label><!-- 성별 -->
						    </li>
					    </c:if>
					    <c:if test="${avo.aniage != 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>나　이:　</label>${avo.aniage} 살<!-- 성별 -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.aniweight == 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>몸무게:　</label><!-- 성별 -->
						    </li>
					    </c:if>
					    <c:if test="${avo.aniweight != 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>몸무게:　</label>${avo.aniweight} kg<!-- 성별 -->
						    </li>
					    </c:if>
					    
						<li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>날　짜:　</label>${avo.anidate}<!-- 날짜 -->
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>지　역:　</label>${avo.aniregion}<!-- 지역 -->
					    	<input type="hidden" value="${avo.aniregion}" id="addr">
							<button id="showmap" type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo"><!-- data-toggle="collapse" data-target="#demo" -->
								<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;위치 확인
							</button>					    	
					    	<div id="demo" class="collapse" style="margin-left: 10%">
					    		<div id="map" style="width:575px;height:350px;"></div>
					    	</div>
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>특　징:　</label>${avo.anifeature}<!-- 특징 -->
					    </li>
					    
					    <c:if test="${avo.anistate == 3}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>사례금:　</label>${avo.anireward} 원<!-- 특징 -->
						    </li>
					    </c:if>
					    
					  </ul> 
					  
					  
					  
					  <c:if test="${pageContext.request.userPrincipal.name == avo.mid and avo.anistate == 3}">
					  
					  	  <c:url var="matching" value="/matchingAnimal">
					  	  	
					  	  	<c:param name="anino" value="${avo.anino}" />
					  	  	<c:param name="anispecies" value="${avo.anispecies}" />
					  	  	<c:param name="anibreed" value="${avo.anibreed}" />
					  	  	<c:param name="aniname" value="${avo.aniname}" />
					  	  	<c:param name="aniage" value="${avo.aniage}" />
					  	  	<c:param name="anisex" value="${avo.anisex}" />
					  	  	<c:param name="aniweight" value="${avo.aniweight}" />
					  	  	<c:param name="anifeature" value="${avo.anifeature}" />
					  	  	<c:param name="aniregion" value="${avo.aniregion}" />
					  	  	<c:param name="anidate" value="${avo.anidate}" />
					  	  	<c:param name="anireward" value="${avo.anireward}" />
					  	  	<c:param name="anistate" value="${avo.anistate}" />
					  	  	<c:param name="aniimg" value="${avo.aniimg}" />
					  	  	<c:param name="anineutral" value="${avo.anineutral}" />
					  	  	
					  	  	<c:param name="bno" value="${avo.bno}" />
					  	  	<c:param name="mid" value="${avo.mid}" />
					  	  	
					  	  </c:url>
					  
						  <div style="text-align: center; margin-top: 20px;">
						  <!-- 매칭이다 매칭!! -->
						  	<a href="${matching}" type="button" class="btn btn-success btn-sm" style="width: 100px;"> 유사 정보 매칭 </a>
<!-- 						  	&nbsp;&nbsp;&nbsp; -->
						  <!-- poi를 적용시켜 연결시키자! -->
<!-- 						  	<button type="button" class="btn btn-success btn-sm" style="width: 100px;"> 전단지 출력 </button> -->
						  </div>
					  </c:if>
					  
					  
					  
					  <c:if test="${avo.bcode == 6 and avo.anistate == 1}">
					  	<c:url var="adoptapply" value="/adoptquspage">
					  		<c:param name="anino" value="${avo.anino}" />
					  	</c:url>
					  	
					  	<div style="text-align: center; margin-top: 20px;">
						  <!-- 입양 신청 버튼 -->
						  	<a href="${adoptapply}" type="button" class="btn btn-success btn-sm" style="width: 100px;">　입양 신청　</a>
						</div>
					  </c:if>
					  
				</div><p>
				<!--애기설명End-->
			</td>
		</tr>
		
		
		
		<!-- ========================================================================================= -->
		
		<c:if test="${avo.matchswitch == 1}">
			<tr>
				<th colspan="8" style="opacity:1;">${avo.matchmsg}</th>
			</tr>
			
			<tr>
				<td colspan="8">
					<div class="col-md-12 center" style="width: 100%;">
					
						<c:if test="${size != 0}">
							<c:set var="doneLoop" value="false" />
							
							<c:forEach var="i" begin="0" end="2" step="3">
							
								<div>
									<c:if test="${not doneLoop}">
									
										<div class="col-md-4">
											<a href="selectoneAnimal?anino=${top[i].anino}&bno=${top[i].bno}&mid=${top[i].mid}" class="thumnail nounderline">
												<img src="img/${top[i].aniimg}" class="img">
											</a>
											
											<table class="container">
												<tr>
													<th class="content">${top[i].btitle}</th>
												</tr>
												<tr>
													<th class="content">${top[i].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${top[i].anibreed}</th>
												</tr>
												<tr>
													<th class="content">지역 : ${top[i].aniregion}</th>
												</tr>
												<tr>
													<th class="content">날짜 : ${top[i].anidate}</th>
												</tr>
											</table>
										</div>
										
										<c:if test="${i == (size-1)}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										
									</c:if>
									
									<c:if test="${not doneLoop}">
										
										<div class="col-md-4">
											<a href="selectoneAnimal?anino=${top[i+1].anino}&bno=${top[i+1].bno}&mid=${top[i+1].mid}" class="thumnail nounderline">
												<img src="img/${top[i+1].aniimg}" class="img">
											</a>
											
											<table class="container">
												<tr>
													<th class="content">${top[i+1].btitle}</th>
												</tr>
												<tr>
													<th class="content">${top[i+1].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${top[i+1].anibreed}</th>
												</tr>
												<tr>
													<th class="content">지역 : ${top[i+1].aniregion}</th>
												</tr>
												<tr>
													<th class="content">날짜 : ${top[i+1].anidate}</th>
												</tr>
											</table>
										</div>
										
										<c:if test="${i+1 == (size-1)}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										
									</c:if>	
									
									<c:if test="${not doneLoop}">
										
										<div class="col-md-4">
											<a href="selectoneAnimal?anino=${top[i+2].anino}&bno=${top[i+2].bno}&mid=${top[i+2].mid}" class="thumnail nounderline">
												<img src="img/${top[i+2].aniimg}" class="img">
											</a>
											
											<table class="container">
												<tr>
													<th class="content">${top[i+2].btitle}</th>
												</tr>
												<tr>
													<th class="content">${top[i+2].anispecies}&nbsp;&nbsp;/&nbsp;&nbsp;${top[i+2].anibreed}</th>
												</tr>
												<tr>
													<th class="content">지역 : ${top[i+2].aniregion}</th>
												</tr>
												<tr>
													<th class="content">날짜 : ${top[i+2].anidate}</th>
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
						
					</div>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${avo.matchswitch == 313048}">
			<tr>
				<th colspan="8" style="opacity:1;">${avo.matchmsg}</th>
			</tr>
		</c:if>
		
		<tr><td>　</td></tr>
		<!-- ========================================================================================= -->
		
		
			
		<!-- 내용 (들어가면 height="500px" 빼줘야함) -->
		<tr height="300px">
			<td colspan="8" class="bgwhite">
				<textarea rows="15" style="width: 100%" readonly="readonly">${avo.bcontent}</textarea>
			</td>						
		</tr>
	
		<!-- 댓글 입력  -->
		<tr>
		
			<th>Comment</th>
			<td colspan="8">
				<form method="post" action="commInsert">
			    	<div class="input-group col-xs-12">
			    	
<%-- 			    		<input type="hidden" name="mid" id="mid" value="${pageContext.request.userPrincipal.name}"/> --%>
			    		<input type="hidden" name="bno" id="bno" value="${avo.bno}"/>
			    		<input type="hidden" name="anino" id="anino" value="${avo.anino}"/>
			    		<input type="hidden" name="cbip" value="<%=request.getRemoteAddr() %>">
			    		<input type="hidden" name="nowPage" value="${nowPage}" />
			        	<input type="text" name="cbcontent" class="form-control input-sm " placeholder="Your comments" required="required">
			        	
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
			<td colspan="8">
				<table width="100%">
<!-- 					<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comments</th> <th>Date</th><th>삭제</th> </tr> -->
					<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comments</th> <th>Date</th> <th style="width: 15px; font-size: 10px;"></th	> </tr>
					<!-- 댓글 부분 이곳에서 반복처리하면 됩니다. 시작 -->
					
		<%-- 			 <s:iterator value="list"> <!-- 갑가져오기 -->
		 <tr> <td width="30px"><s:property value="bno"/></td><td><a href="bdetail?bno=${bno}"><s:property value="btitle"/></a></td>
		 <td><s:property value="mid"/></td><td><s:property value="bdate"/></td>
		 <td><s:property value="bhit"/></td> </tr>
		 </s:iterator> --%>
					
					<c:forEach var="cbvo" items="${cbvo }">
					<tr> 
						<td>${cbvo.mid }</td>
<!-- 						<td class="reply"> -->
						<td class="reply" style="text-align: left; padding-left: 20px; width: 220px">
							${cbvo.cbcontent }
						</td>
						<td>${cbvo.cbdate }</td> 

						<!-- 본인이 쓴 댓글만 지울 수 있게 수정 -->
						<c:if test="${cbvo.mid == pageContext.request.userPrincipal.name}">
							<td>
								<a type="button" href="commDelete?cbno=${cbvo.cbno}&anino=${avo.anino}&bno=${cbvo.bno}&mid=${cbvo.mid}&nowPage=${nowPage}">삭제</a>
							</td>
						</c:if>


					</tr>
					</c:forEach>
					<!-- 끝 -->
				</table>					
			</td>
		</tr>
	</table>								
		
	<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
	
	<c:if test="${pageContext.request.userPrincipal.name == avo.mid}">
		<button type="button" class="btn btn-success btn-sm" onclick="location='updateformAnimal?anino=${avo.anino}&nowPage=${nowPage}'">　수　　정　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='deleteAnimal?anino=${avo.anino}&nowPage=${nowPage}&searchtype=&bcode=${avo.bcode }'">　삭　　제　</button>
	</c:if>
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<button type="button" class="btn btn-success btn-sm" id="reportBtn">　신　　고　 </button>
	</c:if>
	
	<button type="button" class="btn btn-success btn-sm" onclick="location='selectallAnimal?bcode=${avo.bcode}&nowPage=${nowPage}&searchType='">　목　　록　</button>
	
</div>		
