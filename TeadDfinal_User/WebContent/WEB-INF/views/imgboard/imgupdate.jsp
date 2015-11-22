<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</style>

<script>
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
		});
</script>


<div>
	
	<img src="img/boardupdate.png" width="300px">
	<form action="imgupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="anino" value="${avo.anino }">
	<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>		
			<table width="500px">				
				<tr>	
					<th>title</th>	
					<td align="left">
						<input class="form-control input-sm" placeholder="������ �Է��ϼ���"  
						name="btitle" type="text" value="${avo.btitle }">
					</td>	
				</tr>
				
				<tr>
					<th>�̹���</th>
					<td>
			            <div class="input-group">
			                <!-- placeholder�� ���� �÷ȴ� �̹��� ������ �;��Ұ� �����ϴ�.  -->
<!-- ���� �����ؾ�??? -->   <input type="text" class="form-control input-sm" placeholder="Try selecting one file" 
			                readonly="readonly" value="${avo.aniimg }">
			                <img width="150px" id="upimg" src="upload/${avo.aniimg }">
			                <span class="input-group-btn">
			                    <span class="btn btn-success btn-file btn-sm">
			                        ImageUpload<input type="file" multiple="multiple" name="maniimg" id="maniimg">
			                    </span>
			                </span>
			            </div>
					</td>
				</tr>
				
				
				<tr>	
					<th colspan="2">Content</th>		
				</tr>
				
				<tr>	
					<td colspan="2"  height="500px">
						<textarea class="form-control" rows="10" id="comment" 
						placeholder="������ �Է��ϼ���" name="bcontent">${avo.bcontent }</textarea>
					</td>		
				</tr>
			</table>				
	
			
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			<button type="submit" class="btn btn-success btn-sm">�������Ϸᡡ</button>
			<button type="button" class="btn btn-success btn-sm" 
			onclick="location='imgboarddetail?anino=${avo.anino}&bno=${avo.bno }'">��������ҡ�</button>
			</form>	
</div>