<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
	<!-- ������� �޷����� �ޱ� ���� by sky -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<!-- 	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- 	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- 	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

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
	
</style>

<script>
	//���� ���ε�� ��ũ��Ʈ 
	$(document).on('change', '.btn-file :file', function() {
		  var input = $(this),
		      numFiles = input.get(0).files ? input.get(0).files.length : 1,
		      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		  input.trigger('fileselect', [numFiles, label]);
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
		    
		    $('#write').click(function(){
				
				if($('#girl').is(':checked')){
					$('#anisex').val($('#girl').val());
				}else if($('#boy').is(':checked')){
					$('#anisex').val($('#boy').val());
				}
				
				if($('#small').is(':checked')){
					
					$('#anisize').val($('#small').val());
				}else if($('#middle').is(':checked')){
					
					$('#anisize').val($('#middle').val());
				}else if($('#big').is(':checked')){
					console.log($('#big').is(':checked'));
					$('#anisize').val($('#big').val());
				}
			});
		    
		    
		});
		
		//������� �޷����� �ޱ� ���� by sky
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
			
			// �⵵ �Ⱓ ����
			$( "#datepicker" ).datepicker({
				yearRange: "1915:2015"
			});
			// �⵵ �Ⱓ getter
			var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
			// �⵵ �Ⱓ setter
			$( "#datepicker" ).datepicker( "option", "yearRange", "1915:2015" );
		});   //������� �������� function
		
		
		//ǰ�� - ��з�, �Һз� ���� �迭�� ó��ó��
		var kindv=new Array(new Array("--����--"),
				  new Array("--����--", "��ũ���׸���", "Ǫ��", "�㽺Ű", "�����Ʈ", "���", "��Ƽ��", "����", "������", "����Ʈ", "�۱�", "���鸵���׸���","�����ݸ�", "�����ڱ�", "��ī���ĴϿ�", "�������Ͽ��", "�ù��̴�", "�ټ��Ͽ��", "���������", "�������þ", "�����Ͽ��", "���޶��̾�", "���߿�", "�������׸���", "ġ�Ϳ�", "��������", "������"),
				  new Array("--����--", "�丣�þ�", "�ͽ�Ʈ��", "�丣�þ���ĥ��", "�������", "��Ű���Ӱ��", "���þȺ��", "����Ƽ������", "�ڸ��ȼ����", "�Ƹ޸�ĭ�����", "����ũ��", "����", "�븣���̽�", "����ƽ", "����", "�긮Ƽ�������", "������", "������", "�󰡸���", "�߸�����", "��", "��ġŲ","�ƺ�ôϾ�", "��"),
				  new Array("--����--", "����ġ", "�䳢", "��", "�ź���", "�临", "������", "�縷����", "�ܽ���", "����Ǳ�", "�̴��Ǳ�", "��Ÿ")
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
		
		
</script>


<div>
	<form action="ins" method="post" enctype="multipart/form-data">
	<h1>�̹����Խ���<small>�����Ű�,�߽߰Ű� etc</small></h1>
	
	<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			
			<table width="500px">				
				<tr>	
					<th width="80px">title</th>	
					<td align="left">
						<input class="form-control input-sm" name="btitle" placeholder="������ �Է��ϼ���">
					</td>
				</tr>
				
				<tr>
					<th>�̹���</th>
					<td>
			            <div class="input-group">
			                <input type="text" class="form-control input-sm" placeholder="Try selecting one file" readonly>
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
					<th>�����Է�</th> 
					<td align="left">
						<table id="animalapplyform">
							<tr> 
								<th>��з�</th>
								<td>
			      					<select name="anispecies" id="bigkind" class="form-control input-sm">
										<option>-- ���� --</option>
									    <option value="dog">������</option>
									    <option value="cat">�����</option>
									    <option value="etc">��Ÿ</option>
									</select>
								</td> 
							</tr>
							<tr> 
								<th>�Һз�</th>
								<td>
			      					<select name="anibreed" id="smallkind" class="form-control input-sm">
										<option>-- ���� --</option>
									</select>
								</td> 
							</tr>
							<tr> 
								<th>�̸�</th>
								<td>
									<input type="text" name="aniname" class="form-control input-sm" placeholder="�̸�" />
								</td> 
							</tr>

							<tr> 
								<th>����</th>
								
								<td>
								<input type="hidden" name="anisex" id="anisex"/>
									<label class="radio-inline">
					     				<input name="gender" type="radio" id="girl" value="����">����
					    			</label>
					   				<label class="radio-inline">
					      				<input name="gender" type="radio" id="boy" value="����">����
					   				</label>
								</td> 
							</tr>
							
							<tr> 
								<th>����</th>
								<td>
									<input type="number" name="aniage" class="form-control input-sm" placeholder="����" />
								</td> 
							</tr>
							
							<tr> 
								<th>ũ��</th>
								<td>
									<input type="hidden" name="anisize" id="anisize" />
									<label class="radio-inline">
					     				<input name="anisize" type="radio" id="small" value="��">��
					    			</label>
					   				<label class="radio-inline">
					      				<input name="anisize" type="radio" id="middle" value="��">��
					   				</label>									
					   				<label class="radio-inline">
					      				<input name="anisize" type="radio" id="big" value="��">��
					   				</label>									
								</td> 
							</tr>
							<tr> 
								<th>������</th>
								<td>
									<input type="number" name="aniweight" class="form-control input-sm" placeholder="Kg"/>
								</td> 
							</tr>
							<tr> 
								<th>Ư¡</th>
								<td>
									<div class="form-group">
      									<textarea class="form-control" name="anifeature" placeholder="�Ҿ���� ���� ������ Ư¡�� �Է����ּ���."></textarea>
    								</div>
								</td> 
							</tr>
							<tr> 
								<th>����</th>
								<td>
									<input type="text" name="aniregion" class="form-control input-sm" placeholder="����" />
								</td> 
							</tr>
							<tr> 
								<th>��¥</th>
								<td>
									<input class="form-control input-sm" type="text" placeholder="��¥(����)" id="datepicker" name="anidate" readonly="readonly"  />
								</td> 
							</tr>
						</table>
					</td> 
				</tr>
					
				
				
				<tr>	
					<th colspan="2">Content</th>		
				</tr>
				
				<tr>	
					<td colspan="2"  height="500px">
						<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="������ �Է��ϼ���"></textarea>
					</td>		
				</tr>

			</table>				
			<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}"/>
			<input type="hidden" name="bcode" value="5"/>
			<input type="hidden" name="bip" value="<%=request.getRemoteAddr() %>">
<!-- 			<input type="hidden" name="mid"/> ���̵� ����ó���� �κ� -->
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			<button type="submit" class="btn btn-success btn-sm" id="write">���� �� ����</button>
			<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
			</form>
</div>