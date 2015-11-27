<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!-- 
	�� ���� ���� ��
	- ��ܿ� ���� ���� �߰�
 -->

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
	
/* �̹����� Css */
/* �޴��ٿ뽺Ÿ�� */
#menubar{
	background-image: url('img/mypagemenu.png');
	background-repeat:no-repeat;
	height: 400px;
	text-align: left;
/* 	 -webkit-text-stroke: 1px black; */
	 -webkit-text-fill-color: white;	
/*   	color: white; */
/*  	 text-shadow: */
/*    	 -1px -1px 0 #000, /*�ں����ΰ�����*/ */
/*    	  1px -1px 0 white, /*�굵 �ں����ΰ�����.. �³�..*/ */
/*   	  -1px 1px 0 #000, */
/*    	  1px 1px 0 #000; /*�׸����ΰ�����*/ */
}
.list-group-item-success{
	background-color: transparent;
/* 	font-weight:bold;  */
	font-size: 15px
}
#aa{
	color : white;
	padding-top: 140px;
	margin-left: 50px;	
}
.list-group-item{
	border: 1px solid transparent;
	width: 150px
}
a:link {
    text-decoration: none;
}
/* �������ε��style */
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
#id{
	height: 100px;
	width: 100px;
}
.list-group>li>a{
	color: white;
}
</style>


<script>
function execDaumPostcode() {   //�ּ� �������� api
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
} // ���������� ���̺귯���� �������� ����.



//�̹��� ������Ʈ��
$(document).on('change', '.btn-file :file', function() {
	  var input = $(this),
	      numFiles = input.get(0).files ? input.get(0).files.length : 1,
	      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	  input.trigger('fileselect', [numFiles, label]);
	  
// 	  alert(label);
	  
	  previewImage(input.get(0), 'imgimg');
	});
$(document).ready( function() {
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
function previewImage(targetObj, View_area) {
	
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie�϶�(IE8 ���Ͽ����� �۵�)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10���� ��� �Ұ�)
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + View_area);
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error�� ������ delete
            }
 
            var img = document.getElementById(View_area); //�̹����� �ѷ��� ��
 
            //�̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie�� �ƴҶ�(ũ��, ���ĸ�, FF)
    } else {
        var files = targetObj.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
            if (!file.type.match(imageType))
                continue;
            var prevImg = document.getElementById("prev_" + View_area); //������ �̸����Ⱑ �ִٸ� ����
            if (prevImg) {
                preview.removeChild(prevImg);
            }
            var img = document.createElement("img");
            img.id = "prev_" + View_area;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '100px';
            img.style.height = '100px';
            preview.appendChild(img);
            if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}	



//�̸��� �ּ� �ߺ� üũ
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

//��й�ȣ Ȯ�� �Ȱ��� �Է��ߴ��� Ȯ���ؼ� �ѷ���
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


	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�
	function checksubmit() {
		
// 		var ori = ${mvo.mpwd};
		
		//�̺κ��� �߸��Ǽ� javascript �Ʒ� �κ��� �ȵ��µ���....
		// ��й�ȣ�� ������ ����Ǹ� ����
// 		if (document.updateform.mpwd.value!=ori) {
			
// 			if (document.updateform.mpwd.value=="") {
// 				alert("��й�ȣ�� �Է����ּ���.")
// 				document.updateform.mpwd.focus()
// 				return false
// 			}
// 			if (document.updateform.mpwdchk.value=="") {
// 				alert("��й�ȣ�� Ȯ�����ּ���.")
// 				document.updateform.mpwdchk.focus()
// 				return false
// 			}
			
			
			// ��й�ȣ�� ��й�ȣ Ȯ���� ��й�ȣ�� �������� ���� �� ����
// 			if (document.updateform.mpwd.value!=document.updateform.mpwdchk.value) {
// 				alert("��й�ȣ�� Ʋ���ϴ�. �ٽ� Ȯ�����ּ���.")
// 				document.updateform.mpwdchk.focus()
// 				return false
// 			}
// 		}
		
		// ��й�ȣ�� ��й�ȣ Ȯ���� ��й�ȣ�� �������� ���� �� ����
		if (document.updateform.mpwd.value!=document.updateform.mpwdchk.value) {
			alert("��й�ȣ�� Ʋ���ϴ�. �ٽ� Ȯ�����ּ���.")
			document.updateform.mpwdchk.focus()
			return false
		}
		
		if (document.updateform.mpwdkey.value=="") {
			alert("��й�ȣ ã�� ������ �Է����ּ���.")
			document.updateform.mpwdkey.focus()
			return false
		}
		if (document.updateform.mpwdval.value=="") {
			alert("��й�ȣ ã�� �亯�� �Է����ּ���.")
			document.updateform.mpwdval.focus()
			return false
		}
		
		if (document.updateform.memail.value=="") {
			alert("�̸����� �Է����ּ���.")
			document.updateform.memail.focus()
			return false
		}
		if (document.updateform.mtel.value=="") {
			alert("��ȭ��ȣ�� �Է����ּ���.")
			document.updateform.mtel.focus()
			return false
		}
		if (document.updateform.mpost.value=="") {
			alert("�ּҸ� �Է����ּ���.")
			document.updateform.mpost.focus()
			return false
		}
		if (document.updateform.mroad.value=="") {
			alert("�ּҸ� �Է����ּ���.")
			document.updateform.mroad.focus()
			return false
		}
		
		// ������ ���� �ּҰ� �̹� ������ �� ����
		var memail = "�̹� �����ϴ� ���� �ּ� �Դϴ�.";
		
		if ($('#memailchkres').text==memail) {
			alert("�̸����� �ٽ� �Է����ּ���.")
			document.updateform.memail.focus()
			return false
		}
		
		return true;
	}
	// ��� ��� ����� �������� ���� ������ �� �ֵ��� üũ�ϴ� �Լ�

</script>

<div>
			<!--MenuBar_ȸ����������/����/Ż��/��������-->
	<div id="menubar">
	  <div id="aa">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-info-sign"></span><a href="selectoneMember"> ���� ����</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-cog"></span><a href="updateformMember"> ���� ����</a>
		  </li>
		  	
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-user"></span><a href="selectAllMyActivity"> ���� Ȱ��</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-trash"></span><a href="formWithdrawal"> Ż ������</a>
		  </li>
		</ul>
	  </div>
	</div>


		
		<!-- ���� ���� �� -->
		<table><tr height="50px"><td></td></tr></table>

		<form onsubmit="return checksubmit()" name="updateform" action="updateMember" method="post" enctype="multipart/form-data">

		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>���̵�</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="���̵�" name="mid" value="${mvo.mid }" readonly="readonly"/>
				</td> 
				<td rowspan="3">
					<div id="imgimg"></div>
				</td> 
			</tr>
			
			
			<tr>
				<th>������ ����</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="������ ����" name="mimg" value="${mvo.mimg }" readonly="readonly" >
						<span class="input-group-btn">
							<span class="btn btn-success btn-file btn-sm">
		                    	<span class="glyphicon glyphicon-folder-open"></span>
		                        &nbsp;ImageUpload<input type="file" name="mfile" id="file">
		                    </span>
		              	</span>
			        </div>
				</td>
			</tr>
			
			<tr>
				<th>��й�ȣ</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ(8�ڸ� �̻�)" name="mpwd" id="mpwd" value="${mvo.mpwd }" minlength="8" maxlength=20">
				</td> 
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
					<input type="text" class="form-control input-sm" placeholder="��й�ȣ�� �ؾ��� �� ����� ������ �Է����ּ���" name="mpwdkey" value="${mvo.mpwdkey }">
				</td>
			</tr>
			
			<tr>
				<th>��й�ȣ ã�� �亯</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="�� ������ ���� �Է����ּ���" name="mpwdval" value="${mvo.mpwdval }">
				</td>
			</tr>
			
			<tr> 
				<th>�̸�</th>
				<td>
					<input class="form-control input-sm" placeholder="�̸�" name="mname" value="${mvo.mname }" readonly="readonly" >
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>�������</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="������� (Ŭ��)" name="mbirth" value="${mvo.mbirth }" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>�̸���</th>
				<td>
					<input type="email" class="form-control input-sm" 
					placeholder="�̸��� �ּ� (abc@abc.com)" 
					name="memail" id="memail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" value="${mvo.memail }" />
					<div id="memailchkres" name="memailchkres"></div>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" id="memailchk"> �ߺ�üũ	</button>
				</td> 
			</tr>
			
			<tr> 
				<th>�޴���ȭ��ȣ</th>
				<td>
					<input class="form-control input-sm" name="mtel" placeholder=" -  ���� �ۼ����ּ���" pattern="[0-9]{10,11}" value="${mvo.mtel}">
				</td> 
				<td></td>
			</tr>
			
			<tr> 
				<th>�ּ�</th>   
				<td>
					<div class="input-group" style="width: 100%">
						<input id="post" name="mpost" class="form-control input-sm" type="text" placeholder="�����ȣ(�˻�)" value="${mvo.mpost }" readonly="readonly"/>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">�����ȣ</button>
						</span>
					</div>
				</td> 
				<td></td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="mroad" placeholder="���θ� �ּ�" value="${mvo.mroad }" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<c:if test="${mvo.mjibun != null }">
					<td>
						<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="���� �ּ�" value="${mvo.mjibun }" readonly="readonly"/>
						<span id="guide" style="color:#999"></span>
					</td> 
				</c:if>
				
				<c:if test="${mvo.mjibun == null }">
					<td>
						<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="���� �ּ�" readonly="readonly"/>
						<span id="guide" style="color:#999"></span>
					</td> 
				</c:if>
			</tr>
			
			<tr> 
				<th>������ �λ縻</th>   
				<td>
					<input id="mintro" name="mintro" class="form-control input-sm" type="text" placeholder="������ �λ縻" value="${mvo.mintro }" />
				</td> 
				<td>
				</td> 
			</tr>
			
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">������������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('selectoneMember')">���롡���ҡ�</button>
		
		</form>
	</div>