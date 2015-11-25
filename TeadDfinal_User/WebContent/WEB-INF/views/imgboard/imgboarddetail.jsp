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
					anino:$("#anino").val()
				}, 
				success : function(a){
					$("#rptchk").html(a);
					
				}
			});
		});
	});
	
</script>

	<div>		
		<img src="img/boarddetail.png" width="200px">
		
<!-- 		<table width="50%" border="1px">							 -->

	<!-- �ӽ÷� ����  ����..................-->
	
	<!-- �ӽ÷� ����  ����..................-->
	

		<table style="border:1px ; width: 500px"> 
		<tr><td colspan="4" style="margin-right: 0px;"><input type="button" id="rpt" value="�Ű��ϱ�" /></td><td><label>�Ű�� : </label></td><td><label id="rptchk">${avo.brpt}</label></td></tr>
			<tr>	
				<th>����</th>	
				<td colspan="5" class="bgwhite"> 
					${avo.btitle }
				</td>					
			</tr>
			<tr>	
				<th>�۾���</th>
				<td class="bgwhite">${avo.mid}</td>	
				<th>�ۼ���</th>	
				<td class="bgwhite">${avo.bdate }</td>	
				<th>��ȸ��</th>	
				<td class="bgwhite">${avo.bhit}<!--hit--></td>	
			</tr>
			<tr>	
				<th colspan="6">${avo.anifeature}</th>						
			</tr>
			
			<tr>
				<td colspan="6"><br>
				
					<!-- img/a.PNG�� �̹��� �ѷ��ִ� �� -->
					<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="�ڼ��� ������ ������ ���� �Ʒ� ��ư�� Ŭ�����ּ���!">
						<img src="upload/${avo.aniimg}" class="img-rounded" alt="NOT available" width="304" height="236">
					</a>
					
					<!--�ֱ⼳��start-->
					<div id="demo" class="collapse alert alert-success"><br>
						<!--�̸�, ǰ��, ����, ����, ũ��, ������, Ư¡, ����, ��¥-->
						  <ul class="list-group">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-gift"></span>
						    	<label>�� ��: </label>${avo.aniname}<!-- �̸��̸��־��ּ��� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>ǰ ��: </label>${avo.anibreed}<!-- ǰ�� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>�� ��: </label>${avo.aniage}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>�� ��: </label>${avo.anisex}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>ũ ��: </label>${avo.anisize}<!-- ũ�� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>Ư ¡: </label>${avo.anifeature}<!-- Ư¡ -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>�� ��: </label>${avo.aniregion}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	<label>��������: </label>${avo.anidate}<!-- ��¥ -->
						    </li>
						  </ul> 
					</div><p>
					<button type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo">
						<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;ClickHere
					</button>
					<!--�ֱ⼳��End-->
				</td>
			</tr>
			
			<tr height="300px">	<!-- ���� ���� height="500px" ������� -->
				<td colspan="6" class="bgwhite">
					${avo.bcontent}
				</textarea>
				</td>						
			</tr>
			<!-- ��� �Է�  -->
			
			
			<tr>
			
				<th>Comments</th>
				<td colspan="6">
					<form method="post" action="commInsert">
				    	<div class="input-group col-xs-12">
<%-- 				    		<input type="hidden" name="mid" value="${sessionScope['loginid']}"/> --%>
				    		<input type="text" name="mid" value="�׽�Ʈ"/>
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
				<td colspan="6">
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
		<button type="button" class="btn btn-success btn-sm" onclick="location='updateformAnimal?anino=${avo.anino}'">������������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='deleteAnimal?anino=${avo.anino}'">���衡������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='selectallAnimal'">���񡡡��ϡ�</button>
	</div>		
