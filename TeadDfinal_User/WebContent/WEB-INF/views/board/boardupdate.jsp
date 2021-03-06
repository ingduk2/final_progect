<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- 
	※ 변경 사항 ※
	- 메뉴바와 폼 사이 공간 띄움
	- 각종 멘트 변경
	- 취소 시, 원본 글로 돌아가도록 변경
 -->

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
	// 	파일 업로드용 스크립트
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
		
		function checksubmit() {
			
			if (document.boardupdateform.btitle.value == "") {
				alert("제목을 입력해주세요")
				document.boardupdateform.btitle.focus()
				return false
			}
			
			return true;
		}
</script>

<div>
	
<!-- 공간 띄우기 용 -->
<table><tr height="50px"><td></td></tr></table>
	
<form action="updateBoard" method="post" name="boardupdateform" onsubmit="return checksubmit()" enctype="multipart/form-data">
	
	
<input type="hidden" name="bno" value="${bvo.bno}">
<input type="hidden" name="mid" value="${bvo.mid }">
<input type="hidden" name="nowPage" value="${nowPage}">	

<table width="500px">	
	<tr> <th colspan="2">　</th> </tr>			
	<tr>	
		<th>제목</th>	
		<td>
			<input class="form-control input-sm" name="btitle" value="${bvo.btitle}">
		</td>	
	</tr>
	
	<tr>
		<th>파일</th>
		<td>
			<div class="input-group">
                <input type="text" class="form-control input-sm" placeholder="업로드 할 파일을 선택하세요" readonly >
                <span class="input-group-btn">
                    <span class="btn btn-success btn-file btn-sm">
                    	<span class="glyphicon glyphicon-folder-open"></span>
                        &nbsp;FileUpload<input type="file" name="mfile" multiple>
                    </span>
                </span>
            </div>
		</td>
	</tr>
	
	<tr>	
		<th colspan="2">　</th>		
	</tr>
	
	<tr>	
		<td colspan="2"  height="500px">
			<textarea name="bcontent" class="form-control" rows="10" id="comment">${bvo.bcontent}</textarea>
		</td>		
	</tr>
</table>				

	
<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
<button type="submit" class="btn btn-success btn-sm">　완　　료　</button>
<button type="button" class="btn btn-success btn-sm" onclick="location='selectoneBoard?bno=${bvo.bno}&mid=${bvo.mid}&nowPage=${nowPage}'">　취　　소　</button>

</form>		

</div>