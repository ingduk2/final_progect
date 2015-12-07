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
			document.getElementById("qus1sup1").selectedIndex=0; // 아니요 선택 시, 추가 질문 답변 초기화
	        $('#collapseOne').hide();
		});
		
		// qus2sup1 show or hide
		$("#qus2radiobtn1").click(function(){
			// 네 선택 시, 추가 질문 답변 초기화
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
			document.getElementById("qus6sup1").value=""; // 아니요 선택 시, 추가 질문 답변 초기화
	        $('#collapseThree').hide();
		});
		
	});
	
	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수
	function checksubmit() {
		
		if (document.adoptapplyform.qus1.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus2.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus3.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus4.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus5.value == 0) {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus6.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus7.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus8.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus9.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		if (document.adoptapplyform.qus10.value == "") {
			alert("모든 질문에 답변해주세요.")
			return false
		}
		
		// Qus1 - sup1
		if($('#qus1radiobtn1').is(':checked')) {
			if (document.adoptapplyform.qus1sup1.value == 0) {
				alert("모든 질문에 답변해주세요.")
				return false
			}
		}
		
		// Qus2 - sup1
		if($('#qus2radiobtn2').is(':checked')) {
			if (document.adoptapplyform.qus2sup1.value == "") {
				alert("모든 질문에 답변해주세요.")
				return false
			}
		}
		
		// Qus6 - sup1
		if($('#qus6radiobtn1').is(':checked')) {
			if (document.adoptapplyform.qus6sup1.value == "") {
				alert("모든 질문에 답변해주세요.")
				return false
			}
		}
		
		return true;
	}
	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수

</script>

<form action="adoptapply" method="post" onsubmit="return checksubmit()" name="adoptapplyform">	

	<div>
		<h1>입양신청서<small>Please Adopt, Don't BUY</small></h1>
		
		<div id="fontstyle">		
			<table>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 1</th>　　
					<th align="left">　동물을 키워본 경험이 있으십니까?</th>  
				</tr>
					
				<tr>              
					<th class="qusNumber"></th>
					<td align="left">	　　　
						<label class="radio-inline">
				     		<input type="radio"  name="qus1" id="qus1radiobtn1" value="yes"   
				     		data-toggle="collapse" data-target="#collapseOne" >네
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio"  name="qus1" id="qus1radiobtn2" value="nope" 
				      		data-toggle="collapse" data-target="#collapseOne" >아니요
				   		</label>
		
				   		<div id="collapseOne" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 1-1. 가장 최근에 함께했던 동물은 어떻게 되었습니까?</p>
               					<div class="col-sm-6">
			      					<select class="form-control" id="qus1sup1" name="qus1sup1">
								        <option value="0">-- 선택 --</option>
								        <option value="1">현재 함께 살고있다</option>
								        <option value="2">무지개 다리</option>
								        <option value="3">파양</option>
								        <option value="4">분실</option>
								        <option value="5">유기</option>
								    </select>
								</div>
				            </div>
				        </div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr>
					<th class="qusNumber">Q 2</th>　　
					<th align="left">　현재 혼자 거주중 이십니까?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th>
					<td align="left">	　　　
						<label class="radio-inline">
				     		<input type="radio" name="qus2" id="qus2radiobtn1" value="yes"
				     		data-toggle="collapse" data-target="#collapseTwo" >네
		
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus2" id="qus2radiobtn2" value="nope"
				      		data-toggle="collapse" data-target="#collapseTwo" >아니요					      	
				   		</label>
					   		
				   		<div id="collapseTwo" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 2-1. 모든 가족이 입양에 찬성했습니까?</p>
               					<div class="col-sm-6">
               						&nbsp;&nbsp;&nbsp;
			      					<label class="radio-inline">
							     		<input type="radio" name="qus2sup1" id="qus2sup1radiobtn1" value="yes">네
							    	</label>
							   		<label class="radio-inline">
							      		<input type="radio" name="qus2sup1" id="qus2sup1radiobtn2" value="nope">아니요					      	
							   		</label>
							   	</div>
				            </div>
				        </div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 3</th>
					<th align="left">　하루에 집이 완전히 비는 시간이 얼마나 됩니까?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
							<input type="number" class="form-control input-xs" placeholder="시간" name="qus3"
							min="0" max="10" step="1" id="qus3" />
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 4</th>
					<th align="left">　한 달 수입이 어느 정도 되십니까?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
							<input type="number" class="form-control input-xs" placeholder="만원" name="qus4" 
							min="10" step="10" id="qus4" />
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 5</th>
					<th align="left">　주거형태가 어떻게 되십니까?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">
						<div class="col-sm-5">
      						<select class="form-control"  id="qus5" name="qus5">
						        <option value="0">-- 선택 --</option>
						        <option value="1">단독 주택</option>
						        <option value="2">전원 주택</option>
						        <option value="3">다세대 주택</option>
						        <option value="4">아파트</option>
						    </select>
						</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 6</th>
					<th align="left">　향후 이사 계획이 있으십니까?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">　　
						<label class="radio-inline">
				     		<input type="radio" name="qus6" id="qus6radiobtn1" value="yes"  
				     		data-toggle="collapse" data-target="#collapseThree" >네
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus6" id="qus6radiobtn2" value="nope" 
				      		data-toggle="collapse" data-target="#collapseThree" >아니요
		     	   		</label>
		     	   		
		     	   		<div id="collapseThree" class="panel-collapse collapse">
           					<div class="panel-body">
               					<p>Q 6-1. 약 얼마 후 이사를 계획하고 계십니까?</p>
								<div class="col-sm-6">
									<input type="number" class="form-control input-xs" id="qus6sup1" name="qus6sup1" 
									placeholder="개월 후" min="0" max="24" step="3" />
								</div> 	
				            </div>
		     	   		</div>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 7</th>
					<th align="left">　유기동물을 위한 봉사활동에 참여한 경험이 있으십니까?</th>  
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">　　
						<label class="radio-inline">
				     		<input type="radio" name="qus7" id="qus7radiobtn1" value="yes">네
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus7" id="qus7radiobtn2" value="nope">아니요
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 8</th>
					<th align="left">　입양 후 동물 등록제에 참여하시겠습니까?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">　　
						<label class="radio-inline">
				     		<input type="radio" name="qus8" id="qus8radiobtn1" value="yes">네
					    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus8" id="qus8radiobtn2" value="nope">아니요
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 9</th>
					<th align="left">　입양 후 중성화 수술을 하시겠습니까?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">　　
						<label class="radio-inline">
				     		<input type="radio" name="qus9" id="qus9radiobtn1" value="yes">네
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus9" id="qus9radiobtn2" value="nope">아니요
				   		</label>
					</td>  
				</tr>
	<!-- ========================================================================================= -->
				<tr> 
					<th class="qusNumber">Q 10</th>
					<th align="left">　입양 후 아이의 모습을 주기적으로 전해주실 수 있으십니까?</th>
				</tr>

				<tr> 
					<th class="qusNumber"></th> 
					<td align="left">　　
						<label class="radio-inline">
				     		<input type="radio" name="qus10" id="qus10radiobtn1" value="yes">네
				    	</label>
				   		<label class="radio-inline">
				      		<input type="radio" name="qus10" id="qus10radiobtn2" value="nope">아니요
				   		</label>
					</td>  
				</tr>	
	<!-- ========================================================================================= -->
			</table>

	<!-- ========================================================================================= -->
			<!-- 해당 입양 대기 동물 번호 -->
			<input type="hidden" name="anino" value="${anino}">
	<!-- ========================================================================================= -->
		
			<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
			
			<button type="button" class="btn btn-success btn-sm" onclick="goUrl('')">　취　　소　</button>
			<button type="submit" class="btn btn-success btn-sm">　입양 신청　</button>
		</div>
	</div>
</form>