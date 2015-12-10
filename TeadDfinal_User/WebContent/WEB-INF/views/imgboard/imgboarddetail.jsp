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
	/*----------�̹��� ���콺 ���� ��Ÿ��---------*/
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
						alert("���� �Ű���� �ʰ��Ͽ����ϴ�");
					}else if($("#rpt").html()>=15){
							alert("�Խù��� �����˴ϴ�.")
						location.href='selectallAnimal?bcode=${avo.bcode}&nowPage=1&searchType=';
					}else{
					$("#rpt").html(rpt);
					}
				}
			});
		});
	    
	    $('#showmap').click(function() {
// 			$('#map').show();

	        var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };  

		// ������ �����մϴ�    
		var map = new daum.maps.Map(mapContainer, mapOption); 


		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new daum.maps.services.Geocoder();
		
		
		// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		var mapTypeControl = new daum.maps.MapTypeControl();

		// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
		// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		
		var addr=$('#addr').val();
		// �ּҷ� ��ǥ�� �˻��մϴ�
		geocoder.addr2coord(addr, function(status, result) {

		    // ���������� �˻��� �Ϸ������ 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		        
		        mapContainer.style.display="block";
		        map.relayout();
		        
		        map.setCenter(coords);  //�����!
		        
		      //������ ǥ���� ���� �����մϴ�
		        var circle = new daum.maps.Circle({
		            center : new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng),  // ���� �߽���ǥ �Դϴ� 
		            radius: 120, // ���� ������ ���� �������Դϴ� 
		            strokeWeight: 5, // ���� �β��Դϴ� 
		            strokeColor: '#41DA41', // ���� �����Դϴ�
		            strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
		            strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
		            fillColor: '#f5fffa', // ä��� �����Դϴ�
		            fillOpacity: 0.7  // ä��� ������ �Դϴ�   
		        }); 

		        // ������ ���� ǥ���մϴ� 
		        circle.setMap(map); 
		        
				
		        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
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

	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>
	

	<table style="border:1px ; width: 50%"> 
<%-- 		<tr><td colspan="4" style="margin-right: 0px;"><input type="button" id="rpt" value="�Ű��ϱ�" /></td><td><label>�Ű�� : </label></td><td><label id="rptchk">${avo.brpt}</label></td></tr> --%>
		
		
		<tr>	
			<th>����</th>	
			<td colspan="7" class="bgwhite"> 
				${avo.btitle }
			</td>					
		</tr>
		
		<tr>	
			<th>�۾���</th>
			<td class="bgwhite" style="width: 190px">
				${avo.mid}
			</td>	
			<th>�ۼ���</th>	
			<td class="bgwhite" style="width: 190px">
				${avo.bdate }
			</td>	
			<th>��ȸ��</th>	
			<td class="bgwhite" style="width: 50px">
				${avo.bhit}
			</td>
			<th>�Ű��</th>	
			<td class="bgwhite" style="width: 50px" id="rpt">
				${avo.brpt }
			</td>	
		</tr>

		<tr>	
			<th colspan="8">��</th>						
		</tr>
			
		<tr>
			<td colspan="8"><br>
			
				<!-- img/a.PNG�� �̹��� �ѷ��ִ� �� -->
				<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="��ġ�� Ȯ���Ϸ��� �Ʒ� '��ġ Ȯ��' ��ư�� Ŭ�����ּ���!">
					<img src="img/${avo.aniimg}" class="img-rounded" alt="NOT available" width="70%">
				</a>
				
				<br /><br />
				
				
				<!--�ֱ⼳��start-->
<!-- 				<div id="demo" class="collapse alert alert-success"><br> -->
				<div id="" class="alert alert-success"><br>
					<!--�̸�, ǰ��, ����, ����, ũ��, ������, Ư¡, ����, ��¥-->
					  <ul class="list-group">
					  	
					  	<li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>�̡���:��</label>${avo.aniname}<!-- �̸��̸��־��ּ��� -->
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>ǰ����:��</label>${avo.anispecies}��/��${avo.anibreed}<!-- ǰ�� -->
					    </li>
					    
					    <c:if test="${avo.anisex == '��'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label><!-- ���� -->
						    </li>
					    </c:if>
					    <c:if test="${avo.anisex != '��'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label>${avo.anisex}<!-- ���� -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.anineutral == '��'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>�߼�ȭ:��</label><!-- ���� -->
						    </li>
					    </c:if>
					    <c:if test="${avo.anineutral != '��'}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>�߼�ȭ:��</label>${avo.anineutral}<!-- ���� -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.aniage == 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label><!-- ���� -->
						    </li>
					    </c:if>
					    <c:if test="${avo.aniage != 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label>${avo.aniage} ��<!-- ���� -->
						    </li>
					    </c:if>
					    
					    <c:if test="${avo.aniweight == 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label><!-- ���� -->
						    </li>
					    </c:if>
					    <c:if test="${avo.aniweight != 0}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>������:��</label>${avo.aniweight} kg<!-- ���� -->
						    </li>
					    </c:if>
					    
						<li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>����¥:��</label>${avo.anidate}<!-- ��¥ -->
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>������:��</label>${avo.aniregion}<!-- ���� -->
					    	<input type="hidden" value="${avo.aniregion}" id="addr">
							<button id="showmap" type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo"><!-- data-toggle="collapse" data-target="#demo" -->
								<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;��ġ Ȯ��
							</button>					    	
					    	<div id="demo" class="collapse" style="margin-left: 10%">
					    		<div id="map" style="width:575px;height:350px;"></div>
					    	</div>
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>Ư��¡:��</label>${avo.anifeature}<!-- Ư¡ -->
					    </li>
					    
					    <c:if test="${avo.anistate == 3}">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>��ʱ�:��</label>${avo.anireward} ��<!-- Ư¡ -->
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
						  <!-- ��Ī�̴� ��Ī!! -->
						  	<a href="${matching}" type="button" class="btn btn-success btn-sm" style="width: 100px;"> ���� ���� ��Ī </a>
<!-- 						  	&nbsp;&nbsp;&nbsp; -->
						  <!-- poi�� ������� �����Ű��! -->
<!-- 						  	<button type="button" class="btn btn-success btn-sm" style="width: 100px;"> ������ ��� </button> -->
						  </div>
					  </c:if>
					  
					  
					  
					  <c:if test="${avo.bcode == 6 and avo.anistate == 1}">
					  	<c:url var="adoptapply" value="/adoptquspage">
					  		<c:param name="anino" value="${avo.anino}" />
					  	</c:url>
					  	
					  	<div style="text-align: center; margin-top: 20px;">
						  <!-- �Ծ� ��û ��ư -->
						  	<a href="${adoptapply}" type="button" class="btn btn-success btn-sm" style="width: 100px;">���Ծ� ��û��</a>
						</div>
					  </c:if>
					  
				</div><p>
				<!--�ֱ⼳��End-->
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
													<th class="content">���� : ${top[i].aniregion}</th>
												</tr>
												<tr>
													<th class="content">��¥ : ${top[i].anidate}</th>
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
													<th class="content">���� : ${top[i+1].aniregion}</th>
												</tr>
												<tr>
													<th class="content">��¥ : ${top[i+1].anidate}</th>
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
													<th class="content">���� : ${top[i+2].aniregion}</th>
												</tr>
												<tr>
													<th class="content">��¥ : ${top[i+2].anidate}</th>
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
		
		<tr><td>��</td></tr>
		<!-- ========================================================================================= -->
		
		
			
		<!-- ���� (���� height="500px" �������) -->
		<tr height="300px">
			<td colspan="8" class="bgwhite">
				<textarea rows="15" style="width: 100%" readonly="readonly">${avo.bcontent}</textarea>
			</td>						
		</tr>
	
		<!-- ��� �Է�  -->
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
			
		<!--  ��� ��� -->
		<tr>
			<th><span class="glyphicon glyphicon-user"></span></th>
			<td colspan="8">
				<table width="100%">
<!-- 					<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comments</th> <th>Date</th><th>����</th> </tr> -->
					<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comments</th> <th>Date</th> <th style="width: 15px; font-size: 10px;"></th	> </tr>
					<!-- ��� �κ� �̰����� �ݺ�ó���ϸ� �˴ϴ�. ���� -->
					
		<%-- 			 <s:iterator value="list"> <!-- ���������� -->
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

						<!-- ������ �� ��۸� ���� �� �ְ� ���� -->
						<c:if test="${cbvo.mid == pageContext.request.userPrincipal.name}">
							<td>
								<a type="button" href="commDelete?cbno=${cbvo.cbno}&anino=${avo.anino}&bno=${cbvo.bno}&mid=${cbvo.mid}&nowPage=${nowPage}">����</a>
							</td>
						</c:if>


					</tr>
					</c:forEach>
					<!-- �� -->
				</table>					
			</td>
		</tr>
	</table>								
		
	<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
	
	<c:if test="${pageContext.request.userPrincipal.name == avo.mid}">
		<button type="button" class="btn btn-success btn-sm" onclick="location='updateformAnimal?anino=${avo.anino}&nowPage=${nowPage}'">������������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='deleteAnimal?anino=${avo.anino}&nowPage=${nowPage}&searchtype=&bcode=${avo.bcode }'">���衡������</button>
	</c:if>
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<button type="button" class="btn btn-success btn-sm" id="reportBtn">���š����� </button>
	</c:if>
	
	<button type="button" class="btn btn-success btn-sm" onclick="location='selectallAnimal?bcode=${avo.bcode}&nowPage=${nowPage}&searchType='">���񡡡��ϡ�</button>
	
</div>		
