<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 거의 새로 작성함
 -->
 
<!-- 다음 주소 찾기 api 등록 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<!-- 달력 input api 등록 -->
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
	
	// 파일 업로드용 스크립트 
	$(document).on('change', '.btn-file :file', function() {
		  var input = $(this),
		      numFiles = input.get(0).files ? input.get(0).files.length : 1,
		      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		  input.trigger('fileselect', [numFiles, label]);
		});
	
	$(document).ready( function() {
	
	// 로드시 파일을 가져옴.
// 	var path = "${maniimg}".lastIndexOf("\\")+1;
// 	var file =  "${maniimg}".substring(path, "${maniimg}".length);
// 	document.getElementById('maniimg').value=file;	
		
	// 분류 선택	 id="anistate" value="${avo.anistate}
	$('#anistate option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anistate}"){
			$(this).attr("selected", "selected");
		}	
	});
		

	
	// 성별 선택  value="${avo.anisex}" id="anisex"
		$('#anisex option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anisex}"){
			$(this).attr("selected", "selected");
		}
	});
		
		
var i=0; // 인덱스 값을 위한...
var selint; // 인덱스 값을 저장하기 위한...
		// 동물  선택
		
		$('#bigkind option').each(function(){
				var sel = $(this).val();
				selint = i++;
				if(sel == "${avo.anispecies}"){
					$(this).attr("selected", "selected");
					getKind(selint); // 동물 종에 따른 배열 값을 가져오기 위해 여기서 실행
				}
			});
		
		// 품종 선택  
		$('#smallkind option').each(function(){
		var sel = $(this).val();
		if(sel == "${avo.anibreed}"){
			$(this).attr("selected", "selected");
		}
	});
	
		
	// 중성화 선택
	$('#anineutral option').each(function(){
	    var sel = $(this).val();
	    if(sel == "${avo.anineutral}")
	        $(this).attr("selected", "selected");
	});

		
		// 동물 종별 수명
		$('#bigkind').change(function(){
			var age;
			if($('#bigkind').val()=="강아지"){
				age=25;
				 $('#aniage').attr("max", age);				
			}else if($('#bigkind').val()=="고양이"){
				age=20;
				$('#aniage').attr("max", age);
			}else if($('#bigkind').val()=="토끼"){
				age=15;
				$('#aniage').attr("max", age);
			}
			else if($('#bigkind').val()=="새"){
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
		
	// 달력 input api
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		// 날짜 형식 yyyy-mm-dd로 변경
		$( "#datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		// 날짜 형식 getter
		var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
		// 날짜 형식 setter
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy/mm/dd" );
		// 날짜 기본값 
		$( "#datepicker" ).datepicker( "setDate", "${avo.anidate}");
		// 년도 기간 getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// 년도 기간 setter (50년 전 ~ 현재)
		$( "#datepicker" ).datepicker( "option", "yearRange", "-50:c" );
	
	});   //생년월일 가져오는 function

	// 다음 주소 찾기 api
	function execDaumPostcode() {   
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';

						// 도/시
						if (data.sido !== '') {
							addr = data.sido;
						}
						// 시/군/구
						if (data.sigungu !== '' && /[시|군|구]$/g.test(data.sigungu)) {
							addr += ' ' + data.sigungu;
						}
						// 동
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							addr += ' ' + data.bname;
						}

						document.getElementById('region').value = addr;
					}
				}).open();
	} // 다음에서 라이브러리를 가져오기 위함.
	
	
	//------------------------------------------------------------------------------------------------
	//품종 - 대분류, 소분류 종류 배열에 처넣처넣
	var kindv=new Array(new Array("-- 선택 --"),
			  new Array("-- 선택 --", "닥스훈트", "말라뮤트", "말티즈", "바셋하운드", "보더콜리", "보스턴테리어", "비글", "비숑프리제", "빠삐용", "세퍼트", "스피츠", "시바이누", "시츄", "아프간하운드", "요크셔테리어", "웰시코기", "진돗개", "차우차우 ", "치와와", "코카스파니엘", "퍼그", "포메라이언", "푸들", "허스키", "기타", " "),
			  new Array("-- 선택 --", "노르웨이숲", "러시안블루", "레그돌", "먼치킨", "뱅갈", "샴", "스콜티쉬폴드", "스핑크스", "아메리칸숏헤어", "이비시니안", "코리안숏헤어", "터키쉬앙고라", "페르시안", "페르시안친칠라", "기타", " "),
			  new Array("-- 선택 --", "더치", "드워프", "라이언헤드", "렉스", "롭이어", "브라운마스카라", "블랙마스카라", "앙고라", "재페니즈화이트", "친칠라", "기타", " "),//토끼
			  new Array("-- 선택 --", "구관조", "금강앵무", "금화조", "모란앵무", "문조", "십자매", "왕관 앵무", "잉꼬", "지빠귀", "직박구리", "찌르레기", "청휘조", "카나리아", "핀치", "기타", " "),//새
			  new Array("-- 선택 --", "고슴도치", "거북이", "페릿", "원숭이", "사막여우", "햄스터", "기니피그", "미니피그", "기타", " ")
	);
	var temp;
	var oSelect="";
	
	function getKind(item){
		temp=document.getElementById("smallkind");
		var subCnt=temp.options.length;
		console.log(subCnt);
			console.log(kindv[item].length);  //선택한 애들 뽑아내봅시다.
		
		//초기화
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
	
	// bcode 5, 6 (목격, 개인 보호)
	function checksubmit() {
		
		if (document.imgupdate.btitle.value == "") {
			alert("제목을 입력해주세요")
			document.imgupdate.btitle.focus()
			return false
		}
		if (document.imgupdate.anistate.value == "0") {
			alert("분류를 선택해주세요")
			document.imgupdate.anistate.focus()
			return false
		}
		if (document.imgupdate.anispecies.value == "0") {
			alert("동물을 선택해주세요")
			document.imgupdate.anispecies.focus()
			return false
		}
		if (document.imgupdate.anidate.value == "") {
			alert("날짜를 입력해주세요")
			document.imgupdate.anidate.focus()
			return false
		}
		if (document.imgupdate.aniregion.value == "") {
			alert("지역을 입력해주세요")
			document.imgupdate.regionbtn.focus()
			return false
		}
		if (document.imgupdate.anibreed.value == "-- 선택 --") {
			// alert("품종에 디폴트 값을 넣는다")
			document.imgupdate.anibreed.value = " "
			// return false
		}
		if (document.imgupdate.aniname.value == "") {
			// alert("이름에 디폴트 값을 넣는다")
			document.imgupdate.aniname.value = " "
			// return false
		}
		if (document.imgupdate.anisex.value == "0") {
			// alert("성별에 디폴트 값을 넣는다")
			document.imgupdate.anisex.value = "모름"
			// return false
		}
		if (document.imgupdate.anineutral.value == "0") {
			// alert("중성화에 디폴트 값을 넣는다")
			document.imgupdate.anineutral.value = "모름"
			// return false
		}
		if (document.imgupdate.aniage.value == "") {
			// alert("나이에 디폴트 값을 넣는다")
			document.imgupdate.aniage.value = "0"
			// return false
		}
		if (document.imgupdate.aniweight.value == "") {
			// alert("몸무게에 디폴트 값을 넣는다")
			document.imgupdate.aniweight.value = "0"
			// return false
		}
		if (document.imgupdate.anifeature.value == "") {
			// alert("특징에 디폴트 값을 넣는다")
			document.imgupdate.anifeature.value = " "
			// return false
		}
		if (document.imgupdate.bcontent.value == "") {
			// alert("내용에 디폴트 값을 넣는다")
			document.imgupdate.bcontent.value = " "
			// return false
		}
		
		return true;
	}
	
	// bcode 4 (실종 신고)
	function checksubmit4() {
		
		if (document.imgupdate.btitle.value == "") {
			alert("제목을 입력해주세요")
			document.imgupdate.btitle.focus()
			return false
		}
// 		if (document.imgupdate.maniimg.value == "") {
// 			alert("사진을 등록해주세요")
// 			document.imgupdate.maniimg.focus()
// 			return false
// 		}
		if (document.imgupdate.anistate.value == "0") {
			alert("분류를 선택해주세요")
			document.imgupdate.anistate.focus()
			return false
		}
		if (document.imgupdate.anispecies.value == "0") {
			alert("동물을 선택해주세요")
			document.imgupdate.anispecies.focus()
			return false
		}
		if (document.imgupdate.anibreed.value == "-- 선택 --") {
			alert("품종을 선택해주세요")
			document.imgupdate.anibreed.focus()
			return false
		}
		if (document.imgupdate.aniname.value == "") {
			alert("이름을 입력해주세요")
			document.imgupdate.aniname.focus()
			return false
		}
		if (document.imgupdate.anisex.value == "0") {
			alert("성별을 선택해주세요")
			document.imgupdate.anisex.focus()
			return false
		}
		if (document.imgupdate.anineutral.value == "0") {
			alert("중성화 여부를 선택해주세요")
			document.imgupdate.anineutral.focus()
			return false
		}
		if (document.imgupdate.aniage.value == "") {
			alert("나이를 입력해주세요")
			document.imgupdate.aniage.focus()
			return false
		}
		if (document.imgupdate.aniweight.value == "") {
			alert("몸무게를 입력해주세요")
			document.imgupdate.aniweight.focus()
			return false
		}
		if (document.imgupdate.anidate.value == "") {
			alert("날짜를 입력해주세요")
			document.imgupdate.anidate.focus()
			return false
		}
		if (document.imgupdate.aniregion.value == "") {
			alert("지역을 입력해주세요")
			document.imgupdate.regionbtn.focus()
			return false
		}
		if (document.imgupdate.anireward.value == "") {
			alert("사례금을 입력해주세요")
			document.imgupdate.anireward.focus()
			return false
		}
		if (document.imgupdate.anifeature.value == "") {
			alert("특징을 입력해주세요")
			document.imgupdate.anifeature.focus()
			return false
		}
		
		return true;
	}
	
</script>



<div>

	<!-- 공간 띄우기 용 -->
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
			<tr> <th colspan="2">　</th> </tr>	
			
			<tr>	
				<th width="60px">제목</th>	
				<td align="left">
					<input class="form-control input-sm" name="btitle" placeholder="제목을 입력하세요" value="${avo.btitle}">
				</td>
			</tr>
			
			<tr>
				<th>사진</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" name="aniimg" id="aniimg" placeholder="업로드 할 파일을 선택하세요" readonly value="${avo.aniimg}">
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
				<th colspan="2">　</th>
			</tr>
			
			<tr>
				<th>정보</th>
				
				<td align="left">
					<table id="animalapplyform">
					
						<c:if test="${avo.bcode != 4}">
							<tr>
								<th>분류</th>
								<td colspan="3">
									<select class="form-control input-sm" name="anistate" id="anistate" value="${avo.anistate}">
										<option value="0">-- 선택 --</option>
										<option value="4">목격 했어요</option>
										<option value="5">개인적으로 보호 중이에요</option>
									</select>
								</td>
							</tr>
						</c:if>
						<c:if test="${avo.bcode == 4}">
							<tr>
								<th>분류</th>
								<td colspan="3">
									<input type="text" class="form-control input-sm" 
										   id="anistate" value="찾아주세요" readonly="readonly" value="${avo.anistate}">
									<input type="hidden" name="anistate" value="3">
								</td>
							</tr>
						</c:if>
					
						<tr> 
							<th style="width: 60px">동물</th>
							<td style="width: 160px">
		      					<select name="anispecies" id="bigkind" class="form-control input-sm"  value="${avo.anispecies}">
									<option value="0">-- 선택 --</option>
								    <option value="강아지">강아지</option>
								    <option value="고양이">고양이</option>
								    <option value="토끼">토끼</option>
								    <option value="새">새</option>
								    <option value="기타">기타</option>
								</select>
							</td>
							
							<th style="width: 60px">품종</th>
							<td style="width: 160px">
		      					<select name="anibreed" id="smallkind" class="form-control input-sm" value="${avo.anibreed}">
									<option>-- 선택 --</option>
								</select>
							</td>
						</tr>
						
						<tr> 
							<th>이름</th>
							<td colspan="3">
								<input type="text" name="aniname" class="form-control input-sm" placeholder="동물의 이름을 입력해주세요" value="${avo.aniname}" />
							</td> 
						</tr>

						<tr> 
							<th style="width: 60px">성별</th>
							<td style="width: 160px">
								<select name="anisex" class="form-control input-sm" value="${avo.anisex}" id="anisex">
									<option value="0">-- 선택 --</option>
									<option value="남아">남아</option>
									<option value="여아">여아</option>
									<option hidden="모름">모름</option>
								</select>
							</td>
							
							<th style="width: 60px">중성화</th>
							<td style="width: 160px">
								<select name="anineutral" id="anineutral" class="form-control input-sm" value="${avo.anineutral}">
									<option value="0">-- 선택 --</option>
									<option value="o">O</option>
									<option value="x">X</option>
									<option hidden="모름">모름</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th style="width: 60px">나이</th>
							<td style="width: 160px">
								<input type="number" name="aniage" class="form-control input-sm" id="aniage"
									   placeholder="나이를 입력해주세요" min="0" value="${avo.aniage}" />
							</td>
						 
							<th style="width: 60px">몸무게</th>
							<td style="width: 160px">
								<input type="number" name="aniweight" class="form-control input-sm"
									   placeholder="몸무게를 입력해주세요" min="0" value="${avo.aniweight}" />
							</td>
						</tr>
						
						<tr>
							<th>날짜</th>
							<td colspan="3">
								<c:if test="${avo.bcode != 4}">
									<input class="form-control input-sm" type="text" placeholder="목격, 보호 날짜(선택)"
										   id="datepicker" name="anidate" readonly="readonly" value="${avo.anidate}"  />
								</c:if>
								<c:if test="${avo.bcode == 4}">
									<input class="form-control input-sm" type="text" placeholder="잃어버린 날짜(선택)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
							</td>
						</tr>
						
						<tr> 
							<th>지역</th>
							<td colspan="3">
								<div class="input-group" style="width: 100%">
									<c:if test="${avo.bcode != 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="목격, 보호중인 지역 (검색)" readonly="readonly" value="${avo.aniregion}"/>
									</c:if>
									<c:if test="${avo.bcode == 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="잃어버린 지역 (검색)" readonly="readonly" value="${avo.aniregion}"/>
									</c:if>
									
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm" name="regionbtn" onclick="execDaumPostcode()">　검　　색　</button>
									</span>
								</div>
							</td> 
						</tr>
						
						<c:if test="${avo.bcode == 4}">
							<tr>
								<th>사례금</th>
								<td colspan="3">
									<input type="number" class="form-control input-sm" name="anireward"
										   placeholder="사례할 금액을 입력해주세요" min="0" step="10000" value="${avo.anireward}" />
								</td>
							</tr>
						</c:if>
						<c:if test="${avo.bcode != 4}">
							<input type="hidden" name="anireward"  value="${avo.anireward}">
						</c:if>
						
						<tr> 
							<th>특징</th>
							<td colspan="3">
								<div class="form-group">
     									<textarea class="form-control" name="anifeature" rows="3" placeholder="동물의 특징을 입력해주세요">${avo.anifeature}</textarea>
   								</div>
							</td> 
						</tr>
						
					</table>
				</td> 
			</tr>
			
			<tr>
				<th colspan="2">　</th>
			</tr>
			
			<tr>	
				<td colspan="2"  height="500px">
					<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="내용을 입력하세요" >${avo.bcontent}</textarea>
				</td>		
			</tr>

		</table>				
 
		<input type="hidden" name="bcode" value="${avo.bcode}">
		<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}">
		<input type="hidden" name="bip" value="<%= request.getRemoteAddr() %>">
		<input type="hidden" name="anino" value="${avo.anino }">
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">　완　　료　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="location='selectoneAnimal?bcode=${avo.bcode}&anino=${avo.anino}&bno=${avo.bno}&mid=${avo.mid}&nowPage=${nowPage}'">　취　　소　</button>
		
	</form>
</div>