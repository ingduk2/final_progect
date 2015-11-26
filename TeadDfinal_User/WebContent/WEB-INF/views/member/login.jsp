<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	�� ���� ���� ��
	- �޴��ٿ� �α��� �� ���� ���� ���
 -->

<style>
	#my_container {
	  -webkit-font-smoothing: antialiased;
	  font: normal 14px Roboto,arial,sans-serif;
	}
	.form-login {
	    background-color: #EDEDED;
	    padding-top: 10px;
	    padding-bottom: 20px;
	    padding-left: 20px;
	    padding-right: 20px;
	    border-radius: 15px;
	    border-color:#d2d2d2;
	    border-width: 5px;
	    box-shadow:0 1px 0 #cfcfcf;
	}
	
	h1 { 
	 border:0 solid #fff; 
	 border-bottom-width:1px;
	 padding-bottom:10px;
	 text-align: center;
	}
	
	.form-control {
	    border-radius: 10px;
	}
	
	.wrapper {
	    text-align: center;
	}
	.form-login{
		background-color: #90ee90;
		
	}
	
/* 	Modal�� style */
	.modal-dialog{
		width: 600px
	}
	.modal-content{
		background-color:#CCFFCC
	}
	
	.col-md-offset-4 {
		margin-top: 50px;
	}
	
	
	
	.col-md-offset-4{
		padding-top: 60px
	}
	
</style>

<script>
// ȸ�� ���̵� ã��
$(function() {
	$('#findmid').click(function() {
		$.ajax({
			url: "findmid",
			type: "GET",
			data: {
				mname: $('#midmname').val(),
				memail: $('#midmemail').val(),
				mtel: $('#midmtel').val()
			},
			dataType: "text",
			
			success: function(res) {
				if (res == "���� ��� �Է����ּ���.") {
					alert(res);
				}
				else {
					$('#demo').html(res);
				}
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
// ȸ�� ���̵� ã��

// ȸ�� ��й�ȣ ã�� _ ��й�ȣ ã�� ���� ��������
$(function() {
	$('#findmpwdkey').click(function() {
		$.ajax({
			url: "findmpwdkey",
			type: "GET",
			data: {
				mid: $('#mpwdmid').val(),
				memail: $('#mpwdmemail').val()
			},
			dataType: "text",
			
			success: function(res) {
				if (res == "���� ��� �Է����ּ���.") {
					alert(res);
				}
				else if (res == "�ش��ϴ� ������ �������� �ʽ��ϴ�.") {
					alert(res);
				}
				else {
					$('#mpwdkey').html(res);
				}
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
//ȸ�� ��й�ȣ ã�� _ ��й�ȣ ã�� ���� ��������

// ȸ�� ��й�ȣ ã��
$(function() {
	$('#findmpwd').click(function() {
		$.ajax({
			url: "findmpwd",
			type: "GET",
			data: {
				mid: $('#mpwdmid').val(),
				memail: $('#mpwdmemail').val(),
				mpwdval: $('#mpwdmpwdval').val()
			},
			dataType: "text",
			
			success: function(res) {
				alert(res);
			},
			error: function(a, b) {
				alert("Request: " + JSON.stringify(a));
			}
		});
	});
});
//ȸ�� ��й�ȣ ã��

$(document).ready(function(){
	$("#close1").click(function(){
		closereset1();
	});
	$("#close2").click(function(){
		closereset1();
	});
	$("#close3").click(function(){
		closereset2();
	});
	$("#close4").click(function(){
		closereset2();
	});
});
function closereset1(){
	document.getElementById("midmname").value="";
	document.getElementById("midmemail").value="";
	document.getElementById("midmtel").value="";
	$('#demo').empty();
}
function closereset2(){
	document.getElementById("mpwdmid").value="";
	document.getElementById("mpwdmemail").value="";
	document.getElementById("mpwdmpwdval").value="";
	$('#mpwdkey').empty();
}

</script>

<c:url var="loginUrl" value="/j_spring_security_check"></c:url>

<div id="my_container">

	<form action="${loginUrl }" method="post">

    <div class="col-md-offset-4 col-md-3" style="width: 450px">
        <div class="form-login">
        <h1 class="text-center">Login</h1>
         
        <input type="text" id="loginemail" name="mid" class="form-control input-lg chat-input" placeholder="���̵�" /></br>
         
        <input type="password" id="loginpwd" name="mpwd" class="form-control input-lg chat-input" placeholder="��й�ȣ" /></br>
         
        <div class="wrapper">
         <span class="group-btn">     
<!--              <a href="#" class="btn btn-success btn-lg btn-block">login <i class="fa fa-sign-in"></i></a> -->
			<input type="submit" class="btn btn-success btn-lg btn-block" value="�α���">
         </span>
        </div>
         
        <hr>
         <!-- autocomplete: HTML5 �Ӽ�, �ڵ��ϼ� ���ִ� ��� -->
        <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#findIdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tag"> ���̵�ã��&nbsp;</span>
        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#findPwdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tags"> ��й�ȣã��&nbsp;</span>
        </button>
       </div>
    </div>
    </form>
    
    <!-- Modal Start -->   
 <div class="modal fade" id="findIdModal" role="dialog">
 <div class="modal-dialog">
 
   <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" id="close1" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Forget your ID?</h2>
      </div>
      <div class="modal-body">
        <p>		
        	<input type="text" id="midmname" class="form-control input-xs chat-input" placeholder="�����Ͻ� �̸��� �Է��ϼ���" /><br/>
        	<input type="text" id="midmemail" class="form-control input-xs chat-input" placeholder="�����Ͻ� �����ּҸ� �Է��ϼ���" /><br/>
        	<input type="text" id="midmtel" class="form-control input-xs chat-input" placeholder="�����Ͻ� ��ȭ��ȣ�� �Է��ϼ���" /><br/>
        </p>
<!--         <button id="findmid" type="button" class="btn btn-success" data-toggle="collapse" data-target="#demo">ã��������</button><p> -->
        <button id="findmid" type="button" class="btn btn-success">ã��������</button><p><p>
<!--         <div id="demo" class="collapse alert alert-success"> -->
        <div id="demo">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="close2" class="btn btn-success input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>     



<div class="modal fade" id="findPwdModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
   <div class="modal-content">
     <div class="modal-header">
       <button type="button" class="close" id="close3" data-dismiss="modal">&times;</button>
       <h2 class="modal-title">Forget your Password?</h2>
     </div>
     <div class="modal-body">
       	<input type="text" id="mpwdmid" class="form-control input-xs chat-input" placeholder="�����Ͻ� ���̵� �Է��ϼ���" /></br>
       	<input type="text" id="mpwdmemail" class="form-control input-xs chat-input" placeholder="�����Ͻ� �����ּҸ� �Է��ϼ���" /></br>
       	
       	<button type="button" class="btn btn-success" id="findmpwdkey">�ԡ�������</button>
       	
       	<div style="text-align: left; color: #006600;">
       		<!-- ��й�ȣ ã�� ������ �̰��� ���;� �մϴ�.  -->
        		<span>&nbsp;&nbsp;��й�ȣ ã�� ���� : <span id="mpwdkey"></span></span>
        	</div>
        	<input type="text" id="mpwdmpwdval" class="form-control input-xs chat-input" placeholder="������ ���� �Է��ϼ���" /></br>
        <button type="button" class="btn btn-success" id="findmpwd">ã��������</button>
      </div>
      <div class="modal-footer">
        <button type="button" id="close4" class="btn btn-success input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
<!-- Modal End --> 
  
   
</div>