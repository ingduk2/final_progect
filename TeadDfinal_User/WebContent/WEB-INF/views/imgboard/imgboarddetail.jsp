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

</style>

<script> //image mouse over script
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	   
	    $("#rpt").click(function(){
			$.ajax({
				url: "updateRptAnimal",
				type: "post",
				data:{
					bno:$("#bno").val(),
					anino:$("#anino").val(),
					mid:$("#mid").val(),
					rpt:$("#rptchk").html()
				}, 
				success : function(rpt){
					if(rpt==$("#rptchk").html()){
						$("#rptchk").html();
						alert("���� �Ű���� �ʰ��Ͽ����ϴ�");
						if($("#rptchk").html()>=15){
							alert("�Խù��� �����˴ϴ�.")
						location.href='selectallAnimal';
						}
					}else{
					$("#rptchk").html(rpt);
					}
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
			<td class="bgwhite" style="width: 50px">
				${avo.brpt }
			</td>	
		</tr>

		<tr>	
			<th colspan="8">��</th>						
		</tr>
			
		<tr>
			<td colspan="8"><br>
			
				<!-- img/a.PNG�� �̹��� �ѷ��ִ� �� -->
				<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="�ڼ��� ������ ������ ���� �Ʒ� ��ư�� Ŭ�����ּ���!">
					<img src="img/${avo.aniimg}" class="img-rounded" alt="NOT available" width="70%">
				</a>
				
				<br /><br />
				
				<!--�ֱ⼳��start-->
				<div id="demo" class="collapse alert alert-success"><br>
					<!--�̸�, ǰ��, ����, ����, ũ��, ������, Ư¡, ����, ��¥-->
					  <ul class="list-group">
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-gift"></span>
					    	<label>�̡���:��</label>${avo.aniname}<!-- �̸��̸��־��ּ��� -->
					    </li>
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>ǰ����:��</label>${avo.anibreed}<!-- ǰ�� -->
					    </li>
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>������:��</label>${avo.aniage}<!-- ���� -->
					    </li>
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>������:��</label>${avo.anisex}<!-- ���� -->
					    </li>
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>Ư��¡:��</label>${avo.anifeature}<!-- Ư¡ -->
					    </li>
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>������:��</label>${avo.aniregion}<!-- ���� -->
					    </li>
					    
					    <li class="list-group-item">
					    	<span class="glyphicon glyphicon-apple"></span>
					    	<label>����¥:��</label>${avo.anidate}<!-- ��¥ -->
					    </li>
					    
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
					  	  	
					  	  </c:url>
					  
						  <div style="text-align: center; margin-top: 20px;">
						  	<!-- ��Ī�̴� ��Ī!! -->
						  	<a href="${matching}" type="button" class="btn btn-success btn-sm" style="width: 100px;"> ���� ���� ��Ī </a>
						  	&nbsp;&nbsp;&nbsp;
						  	<!-- poi�� ������� �����Ű��! -->
						  	<button type="button" class="btn btn-success btn-sm" style="width: 100px;"> ������ ��� </button>
						  </div>
					  </c:if>
					  
				</div><p>
				<button type="button" class="btn btn-success btn-sm" data-toggle="collapse" data-target="#demo">
					<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;ClickHere
				</button>
				<!--�ֱ⼳��End-->
			</td>
		</tr>
			
			<tr height="300px">	<!-- ���� ���� height="500px" ������� -->
				<td colspan="8" class="bgwhite">
					<textarea rows="15" style="width: 100%" readonly="readonly">${avo.bcontent}</textarea>
				</td>						
			</tr>
			<!-- ��� �Է�  -->
			
			
			<tr>
			
				<th>Comments</th>
				<td colspan="8">
					<form method="post" action="commInsert">
				    	<div class="input-group col-xs-12">
				    		<input type="hidden" name="mid" id="mid" value="${pageContext.request.userPrincipal.name}"/>
				    		<input type="hidden" name="bno" id="bno" value="${avo.bno}"/>
				    		<input type="hidden" name="anino" id="anino" value="${avo.anino}"/>
				    		<input type="hidden" name="cbip" value="<%=request.getRemoteAddr() %>">
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
						<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comment</th> <th>Date</th><th>����</th> </tr>
						<!-- ��� �κ� �̰����� �ݺ�ó���ϸ� �˴ϴ�. ���� -->
						
			<%-- 			 <s:iterator value="list"> <!-- ���������� -->
			 <tr> <td width="30px"><s:property value="bno"/></td><td><a href="bdetail?bno=${bno}"><s:property value="btitle"/></a></td>
			 <td><s:property value="mid"/></td><td><s:property value="bdate"/></td>
			 <td><s:property value="bhit"/></td> </tr>
			 </s:iterator> --%>
						
						<c:forEach var="cbvo" items="${cbvo }">
						<tr> 
							<td>${cbvo.mid }</td>
							<td class="reply">
								${cbvo.cbcontent }
								<!-- Comment�����̳�������,�Ƹ���! -->
							</td>
							<td>${cbvo.cbdate }</td> 
																				<!-- �����ؾ��� ��. -->
							<td><input type="button" value="����" onclick="location='commDelete?cbno=${cbvo.cbno}&anino=${avo.anino}&bno=${avo.bno }'"></td>
						</tr>
						</c:forEach>
						<!-- �� -->
					</table>					
				</td>
			</tr>
		</table>								
		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		
		<c:if test="${pageContext.request.userPrincipal.name == avo.mid}">
			<button type="button" class="btn btn-success btn-sm" onclick="location='updateformAnimal?anino=${avo.anino}'">������������</button>
			<button type="button" class="btn btn-success btn-sm" onclick="location='deleteAnimal?anino=${avo.anino}&nowPage=1&searchtype=&bcode=${avo.bcode }'">���衡������</button>
		</c:if>
		
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<button type="button" class="btn btn-success btn-sm" id="reportBtn">���š����� </button>
		</c:if>
		
		<button type="button" class="btn btn-success btn-sm" onclick="location='selectallAnimal?bcode=${avo.bcode}&nowPage=1&searchType='">���񡡡��ϡ�</button>
	</div>		
