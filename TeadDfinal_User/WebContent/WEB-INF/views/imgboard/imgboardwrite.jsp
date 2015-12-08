<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	�� ���� ���� ��
	- ���� ���� �ۼ���
 -->
 
<!-- ���� �ּ� ã�� api ��� -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<!-- �޷� input api ��� -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>

	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
	}
	.btn-file {
	  position: relative;
	  overflow: hidden;
	}
	.btn-file input[type=file] {
	  position: absolute;
	  top: 0;
	  right: 0;
	  min-width: 100%;
	  min-height: 100%;
	  font-size: 100px;
	  text-align: right;
	  filter: alpha(opacity=0);
	  opacity: 0;
	  background: red;
	  cursor: inherit;
	  display: block;
	}
	input[readonly] {
	  background-color: white !important;
	  cursor: text !important;
	}
	#animalapplyform{
		border: 1px;
		border-left:white;
		border-right: white;
		width: 100%
	}
	#animalapplyform th{
		background-color: #e0ffff
	}
	.ui-datepicker{z-index: 99 !important};
	
</style>

<script>
	// ���� ���ε�� ��ũ��Ʈ 
	$(document).on('change', '.btn-file :file', function() {
		  var input = $(this),
		      numFiles = input.get(0).files ? input.get(0).files.length : 1,
		      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		  input.trigger('fileselect', [numFiles, label]);
		});
	
	$(document).ready( function() {
		
		// ���� ���� ����
		$('#bigkind').change(function(){
			var age;
			alert($('#bigkind').val());
			if($('#bigkind').val()=="������"){
				age=25;
				alert(age)
				$('#aniage').val("");
				 $('#aniage').attr("max", age);				
			}else if($('#bigkind').val()=="�����"){
				age=20;
				$('#aniage').val("");
				$('#aniage').attr("max", age);
			}else if($('#bigkind').val()=="�䳢"){
				age=15;
				$('#aniage').val("");
				$('#aniage').attr("max", age);
			}
			else if($('#bigkind').val()=="��"){
				age=10;
				$('#aniage').val("");
				$('#aniage').attr("max", age);
			}else{
				age=100;
				$('#aniage').val("");
				$('#aniage').attr("max", age);
			}
		});
		
	    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
	        
	        var input = $(this).parents('.input-group').find(':text'),
	            log = numFiles > 1 ? numFiles + ' files selected' : label;
	        
	        if( input.length ) {
	            input.val(log);
	        } else {
	            if( log ) alert(log);
	        }
	    });
	});
		
	// �޷� input api
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		// ��¥ ���� yyyy-mm-dd�� ����
		$( "#datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		// ��¥ ���� getter
		var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
		// ��¥ ���� setter
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		
		// �⵵ �Ⱓ getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// �⵵ �Ⱓ setter (50�� �� ~ ����)
		$( "#datepicker" ).datepicker( "option", "yearRange", "-50:c" );
	});   //������� �������� function

	// ���� �ּ� ã�� api
	function execDaumPostcode() {   
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';

						// ��/��
						if (data.sido !== '') {
							addr = data.sido;
						}
						// ��/��/��
						if (data.sigungu !== '' && /[��|��|��]$/g.test(data.sigungu)) {
							addr += ' ' + data.sigungu;
						}
						// ��
						if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
							addr += ' ' + data.bname;
						}

						document.getElementById('region').value = addr;
					}
				}).open();
	} // �������� ���̺귯���� �������� ����.
	
	
	//------------------------------------------------------------------------------------------------
	//ǰ�� - ��з�, �Һз� ���� �迭�� ó��ó��
	var kindv=new Array(new Array("-- ���� --"),
			  new Array("-- ���� --", "�ڽ���Ʈ", "�����Ʈ", "��Ƽ��", "�ټ��Ͽ��", "�����ݸ�", "�������׸���", "���", "���������", "���߿�", "����Ʈ", "������", "�ù��̴�", "����", "�������Ͽ��", "��ũ���׸���", "�����ڱ�", "������", "�������� ", "ġ�Ϳ�", "��ī���ĴϿ�", "�۱�", "���޶��̾�", "Ǫ��", "�㽺Ű", "��Ÿ", " "),
			  new Array("-- ���� --", "�븣���̽�", "���þȺ��", "���׵�", "��ġŲ", "��", "��", "����Ƽ������", "����ũ��", "�Ƹ޸�ĭ�����", "�̺�ôϾ�", "�ڸ��ȼ����", "��Ű���Ӱ��", "�丣�þ�", "�丣�þ�ģĥ��", "��Ÿ", " "),
			  new Array("-- ���� --", "��ġ", "�����", "���̾����", "����", "���̾�", "�����ī��", "������ī��", "�Ӱ��", "�������ȭ��Ʈ", "ģĥ��", "��Ÿ", " "),//�䳢
			  new Array("-- ���� --", "������", "�ݰ��޹�", "��ȭ��", "����޹�", "����", "���ڸ�", "�հ� �޹�", "�ײ�", "������", "���ڱ���", "�����", "û����", "ī������", "��ġ", "��Ÿ", " "),//��
			  new Array("-- ���� --", "����ġ", "�ź���", "�临", "������", "�縷����", "�ܽ���", "����Ǳ�", "�̴��Ǳ�", "��Ÿ", " ")
	);
	var temp;
	var oSelect="";
	
	
	
	function getKind(item){
		temp=document.getElementById("smallkind");
		var subCnt=temp.options.length;
		console.log(subCnt);
			console.log(kindv[item].length);  //������ �ֵ� �̾Ƴ����ô�.
		
		//�ʱ�ȭ
		for (var i = (subCnt-1); i > 0 ; i--) {
			temp.options[i]=null;
		}
		
		for(var j=0; j < kindv[item].length; j++){
			oSelect=kindv[item][j];
			temp.options[j]=new Option(oSelect, oSelect);
		}
		
	};
	window.onload=function(){
		document.getElementById("bigkind").onchange=function(){
			getKind(this.options.selectedIndex);
		};
	};
	//------------------------------------------------------------------------------------------------
	
	// bcode 5, 6 (���, ���� ��ȣ)
	function checksubmit() {
		
		if (document.imgboardwriteform.btitle.value == "") {
			alert("������ �Է����ּ���")
			document.imgboardwriteform.btitle.focus()
			return false
		}
		if (document.imgboardwriteform.anistate.value == "0") {
			alert("�з��� �������ּ���")
			document.imgboardwriteform.anistate.focus()
			return false
		}
		if (document.imgboardwriteform.anispecies.value == "0") {
			alert("������ �������ּ���")
			document.imgboardwriteform.anispecies.focus()
			return false
		}
		if (document.imgboardwriteform.anidate.value == "") {
			alert("��¥�� �Է����ּ���")
			document.imgboardwriteform.anidate.focus()
			return false
		}
		if (document.imgboardwriteform.aniregion.value == "") {
			alert("������ �Է����ּ���")
			document.imgboardwriteform.regionbtn.focus()
			return false
		}
		if (document.imgboardwriteform.anibreed.value == "-- ���� --") {
			// alert("ǰ���� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.anibreed.value = " "
			// return false
		}
		if (document.imgboardwriteform.aniname.value == "") {
			// alert("�̸��� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.aniname.value = " "
			// return false
		}
		if (document.imgboardwriteform.anisex.value == "0") {
			// alert("������ ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.anisex.value = "��"
			// return false
		}
		if (document.imgboardwriteform.anineutral.value == "0") {
			// alert("�߼�ȭ�� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.anineutral.value = "��"
			// return false
		}
		if (document.imgboardwriteform.aniage.value == "") {
			// alert("���̿� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.aniage.value = "0"
			// return false
		}
		if (document.imgboardwriteform.aniweight.value == "") {
			// alert("�����Կ� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.aniweight.value = "0"
			// return false
		}
		if (document.imgboardwriteform.anifeature.value == "") {
			// alert("Ư¡�� ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.anifeature.value = " "
			// return false
		}
		if (document.imgboardwriteform.bcontent.value == "") {
			// alert("���뿡 ����Ʈ ���� �ִ´�")
			document.imgboardwriteform.bcontent.value = " "
			// return false
		}
		
		return true;
	}
	
	// bcode 4 (���� �Ű�)
	function checksubmit4() {
		
		if (document.imgboardwriteform.btitle.value == "") {
			alert("������ �Է����ּ���")
			document.imgboardwriteform.btitle.focus()
			return false
		}
		if (document.imgboardwriteform.maniimg.value == "") {
			alert("������ ������ּ���")
			document.imgboardwriteform.maniimg.focus()
			return false
		}
		if (document.imgboardwriteform.anistate.value == "0") {
			alert("�з��� �������ּ���")
			document.imgboardwriteform.anistate.focus()
			return false
		}
		if (document.imgboardwriteform.anispecies.value == "0") {
			alert("������ �������ּ���")
			document.imgboardwriteform.anispecies.focus()
			return false
		}
		if (document.imgboardwriteform.anibreed.value == "-- ���� --") {
			alert("ǰ���� �������ּ���")
			document.imgboardwriteform.anibreed.focus()
			return false
		}
		if (document.imgboardwriteform.aniname.value == "") {
			alert("�̸��� �Է����ּ���")
			document.imgboardwriteform.aniname.focus()
			return false
		}
		if (document.imgboardwriteform.anisex.value == "0") {
			alert("������ �������ּ���")
			document.imgboardwriteform.anisex.focus()
			return false
		}
		if (document.imgboardwriteform.anineutral.value == "0") {
			alert("�߼�ȭ ���θ� �������ּ���")
			document.imgboardwriteform.anineutral.focus()
			return false
		}
		if (document.imgboardwriteform.aniage.value == "") {
			alert("���̸� �Է����ּ���")
			document.imgboardwriteform.aniage.focus()
			return false
		}
		if (document.imgboardwriteform.aniweight.value == "") {
			alert("�����Ը� �Է����ּ���")
			document.imgboardwriteform.aniweight.focus()
			return false
		}
		if (document.imgboardwriteform.anidate.value == "") {
			alert("��¥�� �Է����ּ���")
			document.imgboardwriteform.anidate.focus()
			return false
		}
		if (document.imgboardwriteform.aniregion.value == "") {
			alert("������ �Է����ּ���")
			document.imgboardwriteform.regionbtn.focus()
			return false
		}
		if (document.imgboardwriteform.anireward.value == "") {
			alert("��ʱ��� �Է����ּ���")
			document.imgboardwriteform.anireward.focus()
			return false
		}
		if (document.imgboardwriteform.anifeature.value == "") {
			alert("Ư¡�� �Է����ּ���")
			document.imgboardwriteform.anifeature.focus()
			return false
		}
		
		return true;
	}
	
</script>



<div>

	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>

	<c:if test="${bcode == 4}">
	<form action="insertImgBoard" method="post" enctype="multipart/form-data"
		  name="imgboardwriteform" onsubmit="return checksubmit4()">
	</c:if>
	<c:if test="${bcode != 4}">
	<form action="insertImgBoard" method="post" enctype="multipart/form-data"
		  name="imgboardwriteform" onsubmit="return checksubmit()">
	</c:if>
		<table width="500px">				
			<tr> <th colspan="2">��</th> </tr>	
			
			<tr>	
				<th width="60px">����</th>	
				<td align="left">
					<input class="form-control input-sm" name="btitle" placeholder="������ �Է��ϼ���">
				</td>
			</tr>
			
			<tr>
				<th>����</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="���ε� �� ������ �����ϼ���" readonly>
						<span class="input-group-btn">
							<span class="btn btn-success btn-file btn-sm">
								<span class="glyphicon glyphicon-folder-open"></span>
								&nbsp;ImageUpload<input name="maniimg" type="file" multiple="multiple">
							</span>
						</span>
					</div>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">��</th>
			</tr>
			
			<tr>
				<th>����</th>
				
				<td align="left">
					<table id="animalapplyform">
					
						<c:if test="${bcode != 4}">
							<tr>
								<th>�з�</th>
								<td colspan="3">
									<select class="form-control input-sm" name="anistate" id="anistate">
										<option value="0">-- ���� --</option>
										<option value="4">��� �߾��</option>
										<option value="5">���������� ��ȣ ���̿���</option>
									</select>
								</td>
							</tr>
						</c:if>
						<c:if test="${bcode == 4}">
							<tr>
								<th>�з�</th>
								<td colspan="3">
									<input type="text" class="form-control input-sm" 
										   id="anistate" value="ã���ּ���" readonly="readonly">
									<input type="hidden" name="anistate" value="3">
								</td>
							</tr>
						</c:if>
					
						<tr> 
							<th style="width: 60px">����</th>
							<td style="width: 160px">
		      					<select name="anispecies" id="bigkind" class="form-control input-sm">
									<option value="0">-- ���� --</option>
								    <option value="������">������</option>
								    <option value="�����">�����</option>
								    <option value="�䳢">�䳢</option>
								    <option value="��">��</option>
								    <option value="��Ÿ">��Ÿ</option>
								</select>
							</td>
							
							<th style="width: 60px">ǰ��</th>
							<td style="width: 160px">
		      					<select name="anibreed" id="smallkind" class="form-control input-sm">
									<option>-- ���� --</option>
								</select>
							</td>
						</tr>
						
						<tr> 
							<th>�̸�</th>
							<td colspan="3">
								<input type="text" name="aniname" class="form-control input-sm" placeholder="������ �̸��� �Է����ּ���" />
							</td> 
						</tr>

						<tr> 
							<th style="width: 60px">����</th>
							<td style="width: 160px">
								<select name="anisex" class="form-control input-sm">
									<option value="0">-- ���� --</option>
									<option value="����">����</option>
									<option value="����">����</option>
									<option hidden="��">��</option>
								</select>
							</td>
							
							<th style="width: 60px">�߼�ȭ</th>
							<td style="width: 160px">
								<select name="anineutral" class="form-control input-sm">
									<option value="0">-- ���� --</option>
									<option value="o">O</option>
									<option value="x">X</option>
									<option hidden="��">��</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th style="width: 60px">����</th>
							<td style="width: 160px">
								<input type="number" name="aniage" class="form-control input-sm" id="aniage" 
									   placeholder="���̸� �Է����ּ���" min="1" />
							</td>
						 
							<th style="width: 60px">������</th>
							<td style="width: 160px">
								<input type="number" name="aniweight" class="form-control input-sm"
									   placeholder="�����Ը� �Է����ּ���" min="1" />
							</td>
						</tr>
						
						<tr>
							<th>��¥</th>
							<td colspan="3">
								<c:if test="${bcode != 4}">
									<input class="form-control input-sm" type="text" placeholder="���, ��ȣ ��¥(����)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
								<c:if test="${bcode == 4}">
									<input class="form-control input-sm" type="text" placeholder="�Ҿ���� ��¥(����)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
							</td>
						</tr>
						
						<tr> 
							<th>����</th>
							<td colspan="3">
								<div class="input-group" style="width: 100%">
									<c:if test="${bcode != 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="���, ��ȣ���� ���� (�˻�)" readonly="readonly"/>
									</c:if>
									<c:if test="${bcode == 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="�Ҿ���� ���� (�˻�)" readonly="readonly"/>
									</c:if>
									
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm" name="regionbtn" onclick="execDaumPostcode()">���ˡ�������</button>
									</span>
								</div>
							</td> 
						</tr>
						
						<c:if test="${bcode == 4}">
							<tr>
								<th>��ʱ�</th>
								<td colspan="3">
									<input type="number" class="form-control input-sm" name="anireward"
										   placeholder="����� �ݾ��� �Է����ּ���" min="0" step="10000" />
								</td>
							</tr>
						</c:if>
						<c:if test="${bcode != 4}">
							<input type="hidden" name="anireward" value="0">
						</c:if>
						
						<tr> 
							<th>Ư¡</th>
							<td colspan="3">
								<div class="form-group">
     									<textarea class="form-control" name="anifeature" rows="3" placeholder="������ Ư¡�� �Է����ּ���"></textarea>
   								</div>
							</td> 
						</tr>
						
					</table>
				</td> 
			</tr>
			
			<tr>
				<th colspan="2">��</th>
			</tr>
			
			<tr>	
				<td colspan="2"  height="500px">
					<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="������ �Է��ϼ���"></textarea>
				</td>		
			</tr>

		</table>				

		<input type="hidden" name="bcode" value="${bcode}">
		<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}">
		<input type="hidden" name="bip" value="<%= request.getRemoteAddr() %>">

		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">���ϡ����ᡡ</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='selectallAnimal?bcode=${bcode}&nowPage=${nowPage}&searchType='">���롡���ҡ�</button>
		
	</form>
</div>