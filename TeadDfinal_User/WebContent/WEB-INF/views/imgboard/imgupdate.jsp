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
	
	// �ε�� ������ ������.
// 	var path = "${maniimg}".lastIndexOf("\\")+1;
// 	var file =  "${maniimg}".substring(path, "${maniimg}".length);
// 	document.getElementById('maniimg').value=file;	
		
	// �з� ����	 id="anistate" value="${avo.anistate}
	$('#anistate option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anistate}"){
			$(this).attr("selected", "selected");
		}	
	});
		

	
	// ���� ����  value="${avo.anisex}" id="anisex"
		$('#anisex option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anisex}"){
			$(this).attr("selected", "selected");
		}
	});
		
		
var i=0; // �ε��� ���� ����...
var selint; // �ε��� ���� �����ϱ� ����...
		// ����  ����
		
		$('#bigkind option').each(function(){
				var sel = $(this).val();
				selint = i++;
				if(sel == "${avo.anispecies}"){
					$(this).attr("selected", "selected");
					getKind(selint); // ���� ���� ���� �迭 ���� �������� ���� ���⼭ ����
				}
			});
		
		// ǰ�� ����  
		$('#smallkind option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anibreed}"){
			$(this).attr("selected", "selected");
		}
	});
	
		
	// �߼�ȭ ����
	$('#anineutral option').each(function(){
	    var sel = $(this).val();
	    if(sel == "${avo.anineutral}")
	        $(this).attr("selected", "selected");
	});

		
		// ���� ���� ����
		$('#bigkind').change(function(){
			var age;
			if($('#bigkind').val()=="������"){
				age=25;
				 $('#aniage').attr("max", age);				
			}else if($('#bigkind').val()=="�����"){
				age=20;
				$('#aniage').attr("max", age);
			}else if($('#bigkind').val()=="�䳢"){
				age=15;
				$('#aniage').attr("max", age);
			}
			else if($('#bigkind').val()=="��"){
				age=10;
				$('#aniage').attr("max", age);
			}else{
				age=100;
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
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy/mm/dd" );
		// ��¥ �⺻�� 
		$( "#datepicker" ).datepicker( "setDate", "${avo.anidate}");
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
		
		if (document.imgupdate.btitle.value == "") {
			alert("������ �Է����ּ���")
			document.imgupdate.btitle.focus()
			return false
		}
		if (document.imgupdate.anistate.value == "0") {
			alert("�з��� �������ּ���")
			document.imgupdate.anistate.focus()
			return false
		}
		if (document.imgupdate.anispecies.value == "0") {
			alert("������ �������ּ���")
			document.imgupdate.anispecies.focus()
			return false
		}
		if (document.imgupdate.anidate.value == "") {
			alert("��¥�� �Է����ּ���")
			document.imgupdate.anidate.focus()
			return false
		}
		if (document.imgupdate.aniregion.value == "") {
			alert("������ �Է����ּ���")
			document.imgupdate.regionbtn.focus()
			return false
		}
		if (document.imgupdate.anibreed.value == "-- ���� --") {
			// alert("ǰ���� ����Ʈ ���� �ִ´�")
			document.imgupdate.anibreed.value = " "
			// return false
		}
		if (document.imgupdate.aniname.value == "") {
			// alert("�̸��� ����Ʈ ���� �ִ´�")
			document.imgupdate.aniname.value = " "
			// return false
		}
		if (document.imgupdate.anisex.value == "0") {
			// alert("������ ����Ʈ ���� �ִ´�")
			document.imgupdate.anisex.value = "��"
			// return false
		}
		if (document.imgupdate.anineutral.value == "0") {
			// alert("�߼�ȭ�� ����Ʈ ���� �ִ´�")
			document.imgupdate.anineutral.value = "��"
			// return false
		}
		if (document.imgupdate.aniage.value == "") {
			// alert("���̿� ����Ʈ ���� �ִ´�")
			document.imgupdate.aniage.value = "0"
			// return false
		}
		if (document.imgupdate.aniweight.value == "") {
			// alert("�����Կ� ����Ʈ ���� �ִ´�")
			document.imgupdate.aniweight.value = "0"
			// return false
		}
		if (document.imgupdate.anifeature.value == "") {
			// alert("Ư¡�� ����Ʈ ���� �ִ´�")
			document.imgupdate.anifeature.value = " "
			// return false
		}
		if (document.imgupdate.bcontent.value == "") {
			// alert("���뿡 ����Ʈ ���� �ִ´�")
			document.imgupdate.bcontent.value = " "
			// return false
		}
		
		return true;
	}
	
	// bcode 4 (���� �Ű�)
	function checksubmit4() {
		
		if (document.imgupdate.btitle.value == "") {
			alert("������ �Է����ּ���")
			document.imgupdate.btitle.focus()
			return false
		}
// 		if (document.imgupdate.maniimg.value == "") {
// 			alert("������ ������ּ���")
// 			document.imgupdate.maniimg.focus()
// 			return false
// 		}
		if (document.imgupdate.anistate.value == "0") {
			alert("�з��� �������ּ���")
			document.imgupdate.anistate.focus()
			return false
		}
		if (document.imgupdate.anispecies.value == "0") {
			alert("������ �������ּ���")
			document.imgupdate.anispecies.focus()
			return false
		}
		if (document.imgupdate.anibreed.value == "-- ���� --") {
			alert("ǰ���� �������ּ���")
			document.imgupdate.anibreed.focus()
			return false
		}
		if (document.imgupdate.aniname.value == "") {
			alert("�̸��� �Է����ּ���")
			document.imgupdate.aniname.focus()
			return false
		}
		if (document.imgupdate.anisex.value == "0") {
			alert("������ �������ּ���")
			document.imgupdate.anisex.focus()
			return false
		}
		if (document.imgupdate.anineutral.value == "0") {
			alert("�߼�ȭ ���θ� �������ּ���")
			document.imgupdate.anineutral.focus()
			return false
		}
		if (document.imgupdate.aniage.value == "") {
			alert("���̸� �Է����ּ���")
			document.imgupdate.aniage.focus()
			return false
		}
		if (document.imgupdate.aniweight.value == "") {
			alert("�����Ը� �Է����ּ���")
			document.imgupdate.aniweight.focus()
			return false
		}
		if (document.imgupdate.anidate.value == "") {
			alert("��¥�� �Է����ּ���")
			document.imgupdate.anidate.focus()
			return false
		}
		if (document.imgupdate.aniregion.value == "") {
			alert("������ �Է����ּ���")
			document.imgupdate.regionbtn.focus()
			return false
		}
		if (document.imgupdate.anireward.value == "") {
			alert("��ʱ��� �Է����ּ���")
			document.imgupdate.anireward.focus()
			return false
		}
		if (document.imgupdate.anifeature.value == "") {
			alert("Ư¡�� �Է����ּ���")
			document.imgupdate.anifeature.focus()
			return false
		}
		
		return true;
	}
	
</script>



<div>

	<!-- ���� ���� �� -->
	<table><tr height="50px"><td></td></tr></table>

<%-- 	<c:if test="${avo.bcode == 4}"> --%>
<!-- 	<form action="insertImgBoard" method="post" enctype="multipart/form-data" -->
<!-- 		  name="imgboardwriteform" onsubmit="return checksubmit4()"> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${avo.bcode != 4}"> --%>
<!-- 	<form action="insertImgBoard" method="post" enctype="multipart/form-data" -->
<!-- 		  name="imgboardwriteform" onsubmit="return checksubmit()"> -->
<%-- 	</c:if> --%>
	
	<form action="updateAnimal" method="post" enctype="multipart/form-data"
		  name="imgupdate" onsubmit="return checksubmit4()">
		<table width="500px">				
			<tr> <th colspan="2">��</th> </tr>	
			
			<tr>	
				<th width="60px">����</th>	
				<td align="left">
					<input class="form-control input-sm" name="btitle" placeholder="������ �Է��ϼ���" value="${avo.btitle}">
				</td>
			</tr>
			
			<tr>
				<th>����</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" name="aniimg" id="aniimg" placeholder="���ε� �� ������ �����ϼ���" readonly value="${avo.aniimg}">
						<span class="input-group-btn">
							<span class="btn btn-success btn-file btn-sm">
								<span class="glyphicon glyphicon-folder-open"></span>
								&nbsp;ImageUpload<input name="maniimg" id="maniimg" type="file" multiple="multiple" >
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
					
						<c:if test="${avo.bcode != 4}">
							<tr>
								<th>�з�</th>
								<td colspan="3">
									<select class="form-control input-sm" name="anistate" id="anistate" value="${avo.anistate}">
										<option value="0">-- ���� --</option>
										<option value="4">��� �߾��</option>
										<option value="5">���������� ��ȣ ���̿���</option>
									</select>
								</td>
							</tr>
						</c:if>
						<c:if test="${avo.bcode == 4}">
							<tr>
								<th>�з�</th>
								<td colspan="3">
									<input type="text" class="form-control input-sm" 
										   id="anistate" value="ã���ּ���" readonly="readonly" value="${avo.anistate}">
									<input type="hidden" name="anistate" value="3">
								</td>
							</tr>
						</c:if>
					
						<tr> 
							<th style="width: 60px">����</th>
							<td style="width: 160px">
		      					<select name="anispecies" id="bigkind" class="form-control input-sm"  value="${avo.anispecies}">
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
		      					<select name="anibreed" id="smallkind" class="form-control input-sm" value="${avo.anibreed}">
									<option>-- ���� --</option>
								</select>
							</td>
						</tr>
						
						<tr> 
							<th>�̸�</th>
							<td colspan="3">
								<input type="text" name="aniname" class="form-control input-sm" placeholder="������ �̸��� �Է����ּ���" value="${avo.aniname}" />
							</td> 
						</tr>

						<tr> 
							<th style="width: 60px">����</th>
							<td style="width: 160px">
								<select name="anisex" class="form-control input-sm" value="${avo.anisex}" id="anisex">
									<option value="0">-- ���� --</option>
									<option value="����">����</option>
									<option value="����">����</option>
									<option hidden="��">��</option>
								</select>
							</td>
							
							<th style="width: 60px">�߼�ȭ</th>
							<td style="width: 160px">
								<select name="anineutral" id="anineutral" class="form-control input-sm" value="${avo.anineutral}">
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
									   placeholder="���̸� �Է����ּ���" min="0" value="${avo.aniage}" />
							</td>
						 
							<th style="width: 60px">������</th>
							<td style="width: 160px">
								<input type="number" name="aniweight" class="form-control input-sm"
									   placeholder="�����Ը� �Է����ּ���" min="0" value="${avo.aniweight}" />
							</td>
						</tr>
						
						<tr>
							<th>��¥</th>
							<td colspan="3">
								<c:if test="${avo.bcode != 4}">
									<input class="form-control input-sm" type="text" placeholder="���, ��ȣ ��¥(����)"
										   id="datepicker" name="anidate" readonly="readonly" value="${avo.anidate}"  />
								</c:if>
								<c:if test="${avo.bcode == 4}">
									<input class="form-control input-sm" type="text" placeholder="�Ҿ���� ��¥(����)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
							</td>
						</tr>
						
						<tr> 
							<th>����</th>
							<td colspan="3">
								<div class="input-group" style="width: 100%">
									<c:if test="${avo.bcode != 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="���, ��ȣ���� ���� (�˻�)" readonly="readonly" value="${avo.aniregion}"/>
									</c:if>
									<c:if test="${avo.bcode == 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="�Ҿ���� ���� (�˻�)" readonly="readonly" value="${avo.aniregion}"/>
									</c:if>
									
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm" name="regionbtn" onclick="execDaumPostcode()">���ˡ�������</button>
									</span>
								</div>
							</td> 
						</tr>
						
						<c:if test="${avo.bcode == 4}">
							<tr>
								<th>��ʱ�</th>
								<td colspan="3">
									<input type="number" class="form-control input-sm" name="anireward"
										   placeholder="����� �ݾ��� �Է����ּ���" min="0" step="10000" value="${avo.anireward}" />
								</td>
							</tr>
						</c:if>
						<c:if test="${avo.bcode != 4}">
							<input type="hidden" name="anireward"  value="${avo.anireward}">
						</c:if>
						
						<tr> 
							<th>Ư¡</th>
							<td colspan="3">
								<div class="form-group">
     									<textarea class="form-control" name="anifeature" rows="3" placeholder="������ Ư¡�� �Է����ּ���">${avo.anifeature}</textarea>
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
					<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="������ �Է��ϼ���" >${avo.bcontent}</textarea>
				</td>		
			</tr>

		</table>				
 
		<input type="hidden" name="bcode" value="${avo.bcode}">
		<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}">
		<input type="hidden" name="bip" value="<%= request.getRemoteAddr() %>">
		<input type="hidden" name="anino" value="${avo.anino }">
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">���ϡ����ᡡ</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='selectoneAnimal?bcode=${avo.bcode}&anino=${avo.anino}&bno=${avo.bno}&mid=${avo.mid}&nowPage=${nowPage}'">���롡���ҡ�</button>
		
	</form>
</div>