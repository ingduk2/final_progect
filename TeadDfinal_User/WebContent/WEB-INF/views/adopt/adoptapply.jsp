<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
	table th {
		height: 35px;
	}
	.qusNumber {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 45px;
	}
	.form-control{
		text-align: right;
	}
</style>

<script>

	$(document).ready(function(){
		
		// qus1sup1 show or hide
		$("#qus1radiobtn1").click(function(){
	        $('#collapseOne').show();
		});
		$("#qus1radiobtn2").click(function(){
			document.getElementById("qus1sup1").selectedIndex=0; // �ƴϿ� ���� ��, �߰� ���� �亯 �ʱ�ȭ
	        $('#collapseOne').hide();
		});
		
		// qus2sup1 show or hide
		$("#qus2radiobtn1").click(function(){
			// �� ���� ��, �߰� ���� �亯 �ʱ�ȭ
			var chk = document.getElementsByName("qus2sup1");
			chk[0].checked=false;
			chk[1].checked=false;
			
	        $('#collapseTwo').hide();
		});
		$("#qus2radiobtn2").click(function(){
	        $('#collapseTwo').show();
		});
		
		// qus6sup1 show or hide
		$("#qus6radiobtn1").click(function(){
	        $('#collapseThree').show();
		});
		$("#qus6radiobtn2").click(function(){
			document.getElementById("qus6sup1").value=""; // �ƴϿ� ���� ��, �߰� ���� �亯 �ʱ�ȭ
	        $('#collapseThree').hide();
		});
		
	});
	
	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�
	function checksubmit() {
		
		if (document.adoptapplyform.qus1.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus2.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus3.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus4.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus5.value == 0) {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus6.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus7.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus8.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus9.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		if (document.adoptapplyform.qus10.value == "") {
			alert("��� ������ �亯���ּ���.")
			return false
		}
		
		// Qus1 - sup1
		if($('#qus1radiobtn1').is(':checked')) {
			if (document.adoptapplyform.qus1sup1.value == 0) {
				alert("��� ������ �亯���ּ���.")
				return false
			}
		}
		
		// Qus2 - sup1
		if($('#qus2radiobtn2').is(':checked')) {
			if (document.adoptapplyform.qus2sup1.value == "") {
				alert("��� ������ �亯���ּ���.")
				return false
			}
		}
		
		// Qus6 - sup1
		if($('#qus6radiobtn1').is(':checked')) {
			if (document.adoptapplyform.qus6sup1.value == "") {
				alert("��� ������ �亯���ּ���.")
				return false
			}
		}
		
		return true;
	}
	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�

</script>

<form action="adoptapply" method="post" onsubmit="return checksubmit()" name="adoptapplyform">	

	<div>
		<h1>�Ծ��û��<small>Please Adopt, Don't BUY</small></h1>
		
		<div id="fontstyle">		
			<table>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 1</th>����
					<th align="left">�������� Ű���� ������ �����ʴϱ�?</th>  
				</tr>
					
				<tr>              
					<th class="qusNumber"></th>
					<td align="left">	������
						<label class="radio-inline">
				     		<input type="radio"  name="qus1" id="qus1radiobtn1" value="yes"   
				     		data-toggle="collapse" data-target="#collapseOne" >��
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio"  name="qus1" id="qus1radiobtn2" value="nope" 
				      		data-toggle="collapse" data-target="#collapseOne" >�ƴϿ�
				   		</label>
		
				   		<div id="collapseOne" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 1-1. ���� �ֱٿ� �Բ��ߴ� ������ ��� �Ǿ����ϱ�?</p>
               					<div class="col-sm-6">
			      					<select class="form-control" id="qus1sup1" name="qus1sup1">
								        <option value="0">-- ���� --</option>
								        <option value="1">���� �Բ� ����ִ�</option>
								        <option value="2">������ �ٸ�</option>
								        <option value="3">�ľ�</option>
								        <option value="4">�н�</option>
								        <option value="5">����</option>
								    </select>
								</div>
				            </div>
				        </div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr>
					<th class="qusNumber">Q 2</th>����
					<th align="left">������ ȥ�� ������ �̽ʴϱ�?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th>
					<td align="left">	������
						<label class="radio-inline">
				     		<input type="radio" name="qus2" id="qus2radiobtn1" value="yes"
				     		data-toggle="collapse" data-target="#collapseTwo" >��
		
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus2" id="qus2radiobtn2" value="nope"
				      		data-toggle="collapse" data-target="#collapseTwo" >�ƴϿ�					      	
				   		</label>
					   		
				   		<div id="collapseTwo" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 2-1. ��� ������ �Ծ翡 �����߽��ϱ�?</p>
               					<div class="col-sm-6">
               						&nbsp;&nbsp;&nbsp;
			      					<label class="radio-inline">
							     		<input type="radio" name="qus2sup1" id="qus2sup1radiobtn1" value="yes">��
							    	</label>
							   		<label class="radio-inline">
							      		<input type="radio" name="qus2sup1" id="qus2sup1radiobtn2" value="nope">�ƴϿ�					      	
							   		</label>
							   	</div>
				            </div>
				        </div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 3</th>
					<th align="left">���Ϸ翡 ���� ������ ��� �ð��� �󸶳� �˴ϱ�?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
							<input type="number" class="form-control input-xs" placeholder="�ð�" name="qus3"
							min="0" max="10" step="1" id="qus3" />
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 4</th>
					<th align="left">���� �� ������ ��� ���� �ǽʴϱ�?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
							<input type="number" class="form-control input-xs" placeholder="����" name="qus4" 
							min="10" step="10" id="qus4" />
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 5</th>
					<th align="left">���ְ����°� ��� �ǽʴϱ�?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
      						<select class="form-control"  id="qus5" name="qus5">
						        <option value="0">-- ���� --</option>
						        <option value="1">�ܵ� ����</option>
						        <option value="2">���� ����</option>
						        <option value="3">�ټ��� ����</option>
						        <option value="4">����Ʈ</option>
						    </select>
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 6</th>
					<th align="left">������ �̻� ��ȹ�� �����ʴϱ�?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">����
						<label class="radio-inline">
				     		<input type="radio" name="qus6" id="qus6radiobtn1" value="yes"  
				     		data-toggle="collapse" data-target="#collapseThree" >��
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus6" id="qus6radiobtn2" value="nope" 
				      		data-toggle="collapse" data-target="#collapseThree" >�ƴϿ�
		     	   		</label>
		     	   		
		     	   		<div id="collapseThree" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 6-1. �� �� �� �̻縦 ��ȹ�ϰ� ��ʴϱ�?</p>
								<div class="col-sm-6">
									<input type="number" class="form-control input-xs" id="qus6sup1" name="qus6sup1" 
									placeholder="���� ��" min="0" max="24" step="3" />
								</div> 	
				            </div>
		     	   		</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 7</th>
					<th align="left">�����⵿���� ���� ����Ȱ���� ������ ������ �����ʴϱ�?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">����
						<label class="radio-inline">
				     		<input type="radio" name="qus7" id="qus7radiobtn1" value="yes">��
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus7" id="qus7radiobtn2" value="nope">�ƴϿ�
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 8</th>
					<th align="left">���Ծ� �� ���� ������� �����Ͻðڽ��ϱ�?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">����
						<label class="radio-inline">
				     		<input type="radio" name="qus8" id="qus8radiobtn1" value="yes">��
					    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus8" id="qus8radiobtn2" value="nope">�ƴϿ�
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 9</th>
					<th align="left">���Ծ� �� �߼�ȭ ������ �Ͻðڽ��ϱ�?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">����
						<label class="radio-inline">
				     		<input type="radio" name="qus9" id="qus9radiobtn1" value="yes">��
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus9" id="qus9radiobtn2" value="nope">�ƴϿ�
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 10</th>
					<th align="left">���Ծ� �� ������ ����� �ֱ������� �����ֽ� �� �����ʴϱ�?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">����
						<label class="radio-inline">
				     		<input type="radio" name="qus10" id="qus10radiobtn1" value="yes">��
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus10" id="qus10radiobtn2" value="nope">�ƴϿ�
				   		</label>
					</td>  
				</tr>	
	<!-- ========================================================================================= -->
			</table>

	<!-- ========================================================================================= -->
			<!-- �ش� �Ծ� ��� ���� ��ȣ -->
			<input type="hidden" name="anino" value="${anino}">
	<!-- ========================================================================================= -->
		
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			
			<button type="button" class="btn btn-success btn-sm" onclick="goUrl('')">���롡���ҡ�</button>
			<button type="submit" class="btn btn-success btn-sm">���Ծ� ��û��</button>
		</div>
	</div>
</form>