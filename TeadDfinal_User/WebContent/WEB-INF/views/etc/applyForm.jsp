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
	.form-control{
		text-align: right;
	}
	.alert{
		width: 500px
	}

</style>
<script>
	$(document).ready(function(){
		$("#inexperience").click(function(){
			document.getElementById("experience").selectedIndex = 0;
		});   //end inexperience click event
		
		$("#notmove").click(function(){
			document.getElementById("months").value=0;
		});
	});
	
	function checksubmit() {
		if(document.checkall.optradio1.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio1.focus()
			return false
		}
		if(document.checkall.optradio2.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio2.focus()
			return false
		}
		if(document.checkall.homeshape.value==""){
			alert("Please fill the all forms")
			document.checkall.homeshape.focus()
			return false
		}
		if(document.checkall.income.value==""){
			alert("Please fill the all forms")
			document.checkall.income.focus()
			return false
		}
		if(document.checkall.stayhour.value==""){
			alert("Please fill the all forms")
			document.checkall.stayhour.focus()
			return false
		}
		if(document.checkall.optradio3.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio3.focus()
			return false
		}
		if(document.checkall.optradio4.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio4.focus()
			return false
		}
		if(document.checkall.optradio5.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio5.focus()
			return false
		}
		if(document.checkall.optradio6.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio6.focus()
			return false
		}
		if(document.checkall.optradio7.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio7.focus()
			return false
		}
		return true
	}
</script>

<!-- null check 때문에 id랑 name잔뜩 줬습니다. 꼭꼭 값넘기기 전에 확인해보세영~-ㅠ- -->
<form action="" name="checkall" onsubmit="return checksubmit()">
	<div>
		<img src="img/applytitle.png" width="300px">
			<div id="fontstyle">
				
<table>
	<tr> 
		<th>1</th>　　
		<td align="left">　동물을 키워본 경험이 있으십니까?</td>  
	</tr>
	<tr>              
		<th></th>
		<td align="left">	　　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio1" data-toggle="collapse" data-target="#collapseOne">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio1" data-toggle="collapse" data-target="#collapseOne" id="inexperience">nope
	   		</label>
	   		<div id="collapseOne" class="panel-collapse collapse">
        					<div class="panel-body">
            					<p>가장 최근에 함께하였던 동물은 어떻게 되었습니까?</p>
            					<div class="col-sm-6">
      					<select class="form-control"  id="experience">
					        <option>-- 선택 --</option>
					        <option>현재 함께 살고있다.</option>
					        <option>무지개다리</option>
					        <option>유기</option>
					        <option>파양</option>
					    </select>
					</div>
	            </div>
	        </div>
		</td>  
	</tr>
	
	<tr> 
		<th>2</th>　　
		<td align="left">　혼자 거주중 이십니까?</td>  
	</tr>
	<tr> 
		<th></th>
		<td align="left">	　　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio2">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio2">nope
	   		</label>
		</td>  
	</tr>
	
	
	<tr> 
		<th>3</th>
		<td align="left">　주거형태</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
   						<select class="form-control"  id="" name="homeshape">
			        <option>-- 선택 --</option>
			        <option>단독주택</option>
			        <option>전원주택</option>
			        <option>아파트</option>
			        <option>다세대주택</option>
			    </select>
			</div>
		</td>  
	</tr>
	
	
	
	<tr> 
		<th>4</th>
		<td align="left">　월수입</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
				<input type="number" name="income" class="form-control input-xs" placeholder="수입" step="100" />
			</div>
		</td>  
	</tr>
	
	
	<tr> 
		<th>5</th>
		<td align="left">　하룻동안 집에 사람이 없는 시간입니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
				<input type="number" name="stayhour" class="form-control input-xs" placeholder="hour"/>
			</div> <p style="vertical-align: bottom;">시간</p>   <!--  왜 안될까요.. 왜 밑으로 안갈까여.. -->
		</td>  
	</tr>
	
	
	
	<tr> 
		<th>6</th>
		<td align="left">　향후 이사 계획이 있으십니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio3" data-toggle="collapse" data-target="#collapseTwo">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio3" data-toggle="collapse" data-target="#collapseTwo" id="notmove">nope
	   		</label>
	   		<div id="collapseTwo" class="panel-collapse collapse">
        					<div class="panel-body">
            					<p>얼마 후 이사 계획을 계획하고 계십니까?</p>
					<div class="col-sm-6">
						<input type="number" class="form-control input-xs" id="months" placeholder="개월"/>
					</div> <p style="vertical-align: bottom;">개월 후</p> 	
	            </div>
	        </div>					   		
		</td>  
	</tr>
	
	<tr> 
		<th>7</th>
		<td align="left">　유기동물을 위한 봉사활동에 참여하신 경험이 있으십니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio4">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio4">nope
	   		</label>
		</td>  
	</tr>
	
	<tr> 
		<th>8</th>
		<td align="left">　입양 후 아이의 모습을 주기적으로 전해주실수 있으십니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio5">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio5">nope
	   		</label>
		</td>  
	</tr>
	
	<tr> 
		<th>9</th>
		<td align="left">　동물등록제에 참여하시겠습니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio6">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio6">nope
	   		</label>&nbsp;&nbsp;
	   		<!-- 동물등록제 설명 start-->
	   		 <button type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo">
	   		 	<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;동물등록제란?
	   		 </button>
	   		 <div id="demo" class="collapse alert alert-success"><br>
			    2014년 1월 1일 부터 개를 소유한 사람은 전국 시,군,구청에 반드시 동물 등록을 해야 합니다. 단, 동물등록 업무를 대행할수 있는 자를 지정할 수 없는 읍,면 및 도서 지역은 제외되며, 등록하지 않을 경우 40만원이하의 과태료가 부과됩니다.
			 </div>
	   		<!-- 동물등록제 설명 end-->
		</td>  
	</tr>
	
	
	<tr> 
		<th>10</th>
		<td align="left">　입양 후 중성화수술을 하시겠습니까?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">　　
			<label class="radio-inline">
	     		<input type="radio" name="optradio7">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio7">nope
	   		</label>
		</td>  
	</tr>
</table>
	
<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
<button type="button" class="btn btn-success btn-sm">　취　　소　</button>
<button type="submit" class="btn btn-success btn-sm">　입양신청　</button>
</div>
	</div>
</form>