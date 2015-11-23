<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ���� �ּ� ã�� api ��� -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<!-- ������� �޷����� �ޱ� ���� -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	#formtable{
		height: 400px
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
	}
	.exit{
		border-bottom: 1px solid transparent;
	}
	
	#fsf{
		color: red;
	}
	.ui-datepicker{z-index: 99 !important};
</style>

<script>
	// ���� �ּ� ã�� api
	function execDaumPostcode() {   
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	
						// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
	
						// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
						// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
						if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
	
						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('post').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;
	
						// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
						if (data.autoRoadAddress) {
							//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : '
									+ expRoadAddr + ')';
	
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(���� ���� �ּ� : '
									+ expJibunAddr + ')';
	
						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	} // �������� ���̺귯���� �������� ����.



	//������� �޷����� �ޱ� ����
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
		// �⵵ �Ⱓ setter
		$( "#datepicker" ).datepicker( "option", "yearRange", "-50:c" );
	}); // end ������� �������� function
	
	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�
	function checksubmit() {
		if (document.joinform.mid.value=="") {
			alert("���̵� �Է����ּ���")
			document.joinform.mid.focus()
			return false
		}
		if (document.joinform.mpwd.value=="") {
			alert("��й�ȣ�� �Է����ּ���.")
			document.joinform.mpwd.focus()
			return false
		}
		if (document.joinform.mpwdchk.value=="") {
			alert("��й�ȣ�� Ȯ�����ּ���.")
			document.joinform.mpwdchk.focus()
			return false
		}
		if (document.joinform.mpwdkey.value=="") {
			alert("��й�ȣ ã�� ������ �Է����ּ���.")
			document.joinform.mpwdkey.focus()
			return false
		}
		if (document.joinform.mpwdval.value=="") {
			alert("��й�ȣ ã�� �亯�� �Է����ּ���.")
			document.joinform.mpwdval.focus()
			return false
		}
		if (document.joinform.mname.value=="") {
			alert("�̸��� �Է����ּ���.")
			document.joinform.mname.focus()
			return false
		}
		if (document.joinform.mbirth.value=="") {
			alert("��������� �Է����ּ���.")
			document.joinform.mbirth.focus()
			return false
		}
		if (document.joinform.memail.value=="") {
			alert("�̸����� �Է����ּ���.")
			document.joinform.memail.focus()
			return false
		}
		if (document.joinform.mtel.value=="") {
			alert("��ȭ��ȣ�� �Է����ּ���.")
			document.joinform.mtel.focus()
			return false
		}
		if (document.joinform.mpost.value=="") {
			alert("�ּҸ� �Է����ּ���.")
			document.joinform.mpost.focus()
			return false
		}
		if (document.joinform.mroad.value=="") {
			alert("�ּҸ� �Է����ּ���.")
			document.joinform.mroad.focus()
			return false
		}
		
		// ��й�ȣ�� ��й�ȣ Ȯ���� ��й�ȣ�� �������� ���� �� ����
		if (document.joinform.mpwd.value!=document.joinform.mpwdchk.value) {
			alert("��й�ȣ�� Ʋ���ϴ�. �ٽ� Ȯ�����ּ���.")
			document.joinform.mpwdchk.focus()
			return false
		}
		
		// ������ ���̵� �̹� ������ �� ����
		var mid = "�̹� �����ϴ� ���̵� �Դϴ�.";
		
		if ($('#midchkres').text()==mid) {
			alert("���̵� �ߺ� Ȯ���� ���ּ���.")
			document.joinform.mid.focus()
			return false
		}
		
		// ������ ���� �ּҰ� �̹� ������ �� ����
		var memail = "�̹� �����ϴ� ���� �ּ� �Դϴ�.";
		
		if ($('#memailchkres').text()==memail) {
			alert("�̸��� �ߺ� Ȯ���� ���ּ���.")
			document.joinform.memail.focus()
			return false
		}
		
		return true;
	}
	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�
	
	// ��й�ȣ Ȯ�� �Ȱ��� �Է��ߴ��� Ȯ���ؼ� �ѷ���
	$(function() {
		$('#mpwdchk').keyup(function() {		
			$val_mpwdchk = $('#mpwdchk').val();
			$val_mpwd = $('#mpwd').val();
			
			if ($val_mpwdchk.length > 0) {
				$('#mpwdchkres').load('mpwdchk?mpwd='+$val_mpwd+'&mpwdchk='+$val_mpwdchk);
			}
		});
	});
	// ��й�ȣ Ȯ�� �Ȱ��� �Է��ߴ��� Ȯ���ؼ� �ѷ���
	
	// ���̵� �ߺ� üũ
	$(function() {
		$('#midchk').click(function() {
			$.ajax({
				url: "midchk",
				type: "GET",
				data: {
					mid: $('#mid').val()
				},
				dataType: "text",
				
				success: function(res) {

					if (res == "�̹� �����ϴ� ���̵� �Դϴ�.") {
						
						$('#mid').val("");
						$('#midchkres').html(res).css('color', 'red');
					}
					else {
						
						$('#midchkres').html(res).css('color', 'blue');
					}
				}
			});
		});
	});
	// ���̵� �ߺ� üũ
	
	// �̸��� �ּ� �ߺ� üũ
	$(function() {
		$('#memailchk').click(function() {
			$.ajax({
				url: "memailchk",
				type: "GET",
				data: {
					memail: $('#memail').val()
				},
				dataType: "text",
				
				success: function(res) {

					if (res == "�̹� �����ϴ� ���� �ּ� �Դϴ�.") {
						
						$('#memail').val("");
						$('#memailchkres').html(res).css('color', 'red');
					}
					else {
						$('#memailchkres').html(res).css('color', 'blue');
					}
				}
			});
		});
	});
	
</script>



<form onsubmit="return checksubmit()" name="joinform" action="minsert" method="post">
	<div>
		<img src="img/jointitle.png" width="200px">
		
		<table id="formtable">
			
			<tr>
				<th>���̵�</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="���̵�" id="mid" name="mid" maxlength="20" />
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" id="midchk"> �ߺ�üũ	</button>
						</span>
					</div>
					<div id="midchkres"></div>
				</td> 
				<td></td> 
			</tr>
	
			<tr>
				<th>��й�ȣ</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ (8�ڸ� �̻�)" name="mpwd" id="mpwd" minlength="8" maxlength="20">
				</td> 
				<td></td> 
			</tr>
	
			<tr> 
				<th>��й�ȣ Ȯ��</th>  
				<td>
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ Ȯ��" id="mpwdchk" name="mpwdchk"/>
					<div id="mpwdchkres"></div>
				</td> 
				<td></td> 
			</tr>
			
			<tr>
				<th>��й�ȣ ã�� ����</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="������ �Է����ּ���" name="mpwdkey">
				</td>
			</tr>
			
			<tr>
				<th>��й�ȣ ã�� �亯</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="������ ���� �Է����ּ���" name="mpwdval">
				</td>
			</tr>
	
			<tr> 
				<th>�̸�</th>
				<td>
					<input class="form-control input-sm" placeholder="�̸�" name="mname">
				</td> 
				<td></td> 
			</tr>
	
			<tr> 
				<th>�������</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="������� (Ŭ��)" id="datepicker" name="mbirth" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>�̸���</th>
				<td>
					<div class="input-group">
						<input type="email" class="form-control input-sm" 
						placeholder="�̸��� �ּ�" 
						name="memail" id="memail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" id="memailchk"> �ߺ�üũ	</button>
						</span>
					</div>
					<div id="memailchkres" name="memailchkres"></div>
									</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>��ȭ��ȣ</th>   
				<td>
<!-- 					<div class="col-sm-4"> -->
<!-- 						<select class="form-control input-sm" id="sel1" name="memtelf"> -->
<!-- 							<option>010</option> -->
<!-- 							<option>011</option> -->
<!-- 							<option>016</option> -->
<!-- 							<option>017</option> -->
<!-- 							<option>018</option> -->
<!-- 							<option>019</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<input class="form-control input-sm" placeholder=" - ���� �ۼ����ּ���" name="memtel_back" pattern="[0-9]{7,8}"> -->
<!-- 					</div> -->
					<input type="tel" class="form-control input-sm" name="mtel">
				</td> 
				<td></td>
			</tr>
			
			<tr> 
				<th class="exit">�ּ�</th>   
				<td>
					<div class="input-group">
						<input id="post" name="mpost" class="form-control input-sm" type="text" placeholder="�����ȣ (�˻�)" readonly="readonly"/>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">�����ȣ</button>
						</span>
					</div>
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th class="exit"></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="mroad" placeholder="���θ� �ּ�" readonly="readonly"/>
				</td> 
			</tr>
			
			<tr> 
				<th class="exit"></th> 
				<td>
					<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="���� �ּ�" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('index')">���롡���ҡ�</button>
		
	
		<button type="submit" class="btn btn-success btn-sm" >���������ԡ�</button>
		
	</div>
</form>