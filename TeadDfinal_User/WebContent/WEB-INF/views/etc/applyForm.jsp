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

<!-- null check ������ id�� name�ܶ� ����ϴ�. ���� ���ѱ�� ���� Ȯ���غ�����~-��- -->
<form action="" name="checkall" onsubmit="return checksubmit()">
	<div>
		<img src="img/applytitle.png" width="300px">
			<div id="fontstyle">
				
<table>
	<tr> 
		<th>1</th>����
		<td align="left">�������� Ű���� ������ �����ʴϱ�?</td>  
	</tr>
	<tr>              
		<th></th>
		<td align="left">	������
			<label class="radio-inline">
	     		<input type="radio" name="optradio1" data-toggle="collapse" data-target="#collapseOne">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio1" data-toggle="collapse" data-target="#collapseOne" id="inexperience">nope
	   		</label>
	   		<div id="collapseOne" class="panel-collapse collapse">
        					<div class="panel-body">
            					<p>���� �ֱٿ� �Բ��Ͽ��� ������ ��� �Ǿ����ϱ�?</p>
            					<div class="col-sm-6">
      					<select class="form-control"  id="experience">
					        <option>-- ���� --</option>
					        <option>���� �Բ� ����ִ�.</option>
					        <option>�������ٸ�</option>
					        <option>����</option>
					        <option>�ľ�</option>
					    </select>
					</div>
	            </div>
	        </div>
		</td>  
	</tr>
	
	<tr> 
		<th>2</th>����
		<td align="left">��ȥ�� ������ �̽ʴϱ�?</td>  
	</tr>
	<tr> 
		<th></th>
		<td align="left">	������
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
		<td align="left">���ְ�����</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
   						<select class="form-control"  id="" name="homeshape">
			        <option>-- ���� --</option>
			        <option>�ܵ�����</option>
			        <option>��������</option>
			        <option>����Ʈ</option>
			        <option>�ټ�������</option>
			    </select>
			</div>
		</td>  
	</tr>
	
	
	
	<tr> 
		<th>4</th>
		<td align="left">��������</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
				<input type="number" name="income" class="form-control input-xs" placeholder="����" step="100" />
			</div>
		</td>  
	</tr>
	
	
	<tr> 
		<th>5</th>
		<td align="left">���Ϸ��� ���� ����� ���� �ð��Դϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">
			<div class="col-sm-4">
				<input type="number" name="stayhour" class="form-control input-xs" placeholder="hour"/>
			</div> <p style="vertical-align: bottom;">�ð�</p>   <!--  �� �ȵɱ��.. �� ������ �Ȱ��.. -->
		</td>  
	</tr>
	
	
	
	<tr> 
		<th>6</th>
		<td align="left">������ �̻� ��ȹ�� �����ʴϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">����
			<label class="radio-inline">
	     		<input type="radio" name="optradio3" data-toggle="collapse" data-target="#collapseTwo">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio3" data-toggle="collapse" data-target="#collapseTwo" id="notmove">nope
	   		</label>
	   		<div id="collapseTwo" class="panel-collapse collapse">
        					<div class="panel-body">
            					<p>�� �� �̻� ��ȹ�� ��ȹ�ϰ� ��ʴϱ�?</p>
					<div class="col-sm-6">
						<input type="number" class="form-control input-xs" id="months" placeholder="����"/>
					</div> <p style="vertical-align: bottom;">���� ��</p> 	
	            </div>
	        </div>					   		
		</td>  
	</tr>
	
	<tr> 
		<th>7</th>
		<td align="left">�����⵿���� ���� ����Ȱ���� �����Ͻ� ������ �����ʴϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">����
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
		<td align="left">���Ծ� �� ������ ����� �ֱ������� �����ֽǼ� �����ʴϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">����
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
		<td align="left">������������� �����Ͻðڽ��ϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">����
			<label class="radio-inline">
	     		<input type="radio" name="optradio6">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio6">nope
	   		</label>&nbsp;&nbsp;
	   		<!-- ��������� ���� start-->
	   		 <button type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo">
	   		 	<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;�����������?
	   		 </button>
	   		 <div id="demo" class="collapse alert alert-success"><br>
			    2014�� 1�� 1�� ���� ���� ������ ����� ���� ��,��,��û�� �ݵ�� ���� ����� �ؾ� �մϴ�. ��, ������� ������ �����Ҽ� �ִ� �ڸ� ������ �� ���� ��,�� �� ���� ������ ���ܵǸ�, ������� ���� ��� 40���������� ���·ᰡ �ΰ��˴ϴ�.
			 </div>
	   		<!-- ��������� ���� end-->
		</td>  
	</tr>
	
	
	<tr> 
		<th>10</th>
		<td align="left">���Ծ� �� �߼�ȭ������ �Ͻðڽ��ϱ�?</td>  
	</tr>
	<tr> 
		<th></th> 
		<td align="left">����
			<label class="radio-inline">
	     		<input type="radio" name="optradio7">yes
	    	</label>
	   		<label class="radio-inline">
	      		<input type="radio" name="optradio7">nope
	   		</label>
		</td>  
	</tr>
</table>
	
<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
<button type="submit" class="btn btn-success btn-sm">���Ծ��û��</button>
</div>
	</div>
</form>