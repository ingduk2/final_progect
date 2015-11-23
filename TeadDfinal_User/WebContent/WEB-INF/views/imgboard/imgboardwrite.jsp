<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
	<!-- 생년월일 달력으로 받기 위함 by sky -->
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
	//파일 업로드용 스크립트 
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
		
		//생년월일 달력으로 받기 위함 by sky
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
			$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
			
			// 년도 기간 변경
			$( "#datepicker" ).datepicker({
				yearRange: "1915:2015"
			});
			// 년도 기간 getter
			var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
			// 년도 기간 setter
			$( "#datepicker" ).datepicker( "option", "yearRange", "1915:2015" );
		});   //생년월일 가져오는 function
		
		
		//품종 - 대분류, 소분류 종류 배열에 처넣처넣
		var kindv=new Array(new Array("--선택--"),
				  new Array("--선택--", "요크셔테리어", "푸들", "허스키", "말라뮤트", "비글", "말티즈", "시츄", "진돗개", "세퍼트", "퍼그", "베들링턴테리어","보더콜리", "웰시코기", "코카스파니엘", "아프간하운드", "시바이누", "바셋하운드", "비숑프리제", "제페니즈첸", "블러드하운드", "포메라이언", "빠삐용", "보스턴테리어", "치와와", "차우차우", "샤페이"),
				  new Array("--선택--", "페르시안", "익스트림", "페르시안핀칠라", "히말라얀", "터키쉬앙고라", "러시안블루", "스콜티쉬폴드", "코리안숏헤어", "아메리칸숏헤어", "스핑크스", "렉돌", "노르웨이숲", "엔죠틱", "버만", "브리티쉬숏헤어", "봄베이", "메인쿤", "라가머핀", "발리네즈", "샴", "먼치킨","아비시니안", "뱅갈"),
				  new Array("--선택--", "고슴도치", "토끼", "새", "거북이", "페릿", "원숭이", "사막여우", "햄스터", "기니피그", "미니피그", "기타")
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
		
		
</script>


<div>
	<form action="ins" method="post" enctype="multipart/form-data">
	<h1>이미지게시판<small>실종신고,발견신고 etc</small></h1>
	
	<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
			
			<table width="500px">				
				<tr>	
					<th width="80px">title</th>	
					<td align="left">
						<input class="form-control input-sm" name="btitle" placeholder="제목을 입력하세요">
					</td>
				</tr>
				
				<tr>
					<th>이미지</th>
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
					<th>정보입력</th> 
					<td align="left">
						<table id="animalapplyform">
							<tr> 
								<th>대분류</th>
								<td>
			      					<select name="anispecies" id="bigkind" class="form-control input-sm">
										<option>-- 선택 --</option>
									    <option value="dog">강아지</option>
									    <option value="cat">고양이</option>
									    <option value="etc">기타</option>
									</select>
								</td> 
							</tr>
							<tr> 
								<th>소분류</th>
								<td>
			      					<select name="anibreed" id="smallkind" class="form-control input-sm">
										<option>-- 선택 --</option>
									</select>
								</td> 
							</tr>
							<tr> 
								<th>이름</th>
								<td>
									<input type="text" name="aniname" class="form-control input-sm" placeholder="이름" />
								</td> 
							</tr>

							<tr> 
								<th>성별</th>
								
								<td>
								<input type="hidden" name="anisex" id="anisex"/>
									<label class="radio-inline">
					     				<input name="gender" type="radio" id="girl" value="남아">남아
					    			</label>
					   				<label class="radio-inline">
					      				<input name="gender" type="radio" id="boy" value="여아">여아
					   				</label>
								</td> 
							</tr>
							
							<tr> 
								<th>나이</th>
								<td>
									<input type="number" name="aniage" class="form-control input-sm" placeholder="나이" />
								</td> 
							</tr>
							
							<tr> 
								<th>크기</th>
								<td>
									<input type="hidden" name="anisize" id="anisize" />
									<label class="radio-inline">
					     				<input name="anisize" type="radio" id="small" value="소">소
					    			</label>
					   				<label class="radio-inline">
					      				<input name="anisize" type="radio" id="middle" value="중">중
					   				</label>									
					   				<label class="radio-inline">
					      				<input name="anisize" type="radio" id="big" value="대">대
					   				</label>									
								</td> 
							</tr>
							<tr> 
								<th>몸무게</th>
								<td>
									<input type="number" name="aniweight" class="form-control input-sm" placeholder="Kg"/>
								</td> 
							</tr>
							<tr> 
								<th>특징</th>
								<td>
									<div class="form-group">
      									<textarea class="form-control" name="anifeature" placeholder="잃어버린 유기 동물의 특징을 입력해주세요."></textarea>
    								</div>
								</td> 
							</tr>
							<tr> 
								<th>지역</th>
								<td>
									<input type="text" name="aniregion" class="form-control input-sm" placeholder="지역" />
								</td> 
							</tr>
							<tr> 
								<th>날짜</th>
								<td>
									<input class="form-control input-sm" type="text" placeholder="날짜(선택)" id="datepicker" name="anidate" readonly="readonly"  />
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
						<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="내용을 입력하세요"></textarea>
					</td>		
				</tr>

			</table>				
			<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}"/>
			<input type="hidden" name="bcode" value="5"/>
			<input type="hidden" name="bip" value="<%=request.getRemoteAddr() %>">
<!-- 			<input type="hidden" name="mid"/> 아이디 세션처리할 부분 -->
			<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
			<button type="submit" class="btn btn-success btn-sm" id="write">　글 작 성　</button>
			<button type="button" class="btn btn-success btn-sm">　취　　소　</button>
			</form>
</div>