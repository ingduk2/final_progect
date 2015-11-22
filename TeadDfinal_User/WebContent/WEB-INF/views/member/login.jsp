<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</style>

<c:url var="loginUrl" value="/j_spring_security_check"></c:url>

<div id="my_container">

	<form action="${loginUrl }" method="post">

    <div class="col-md-offset-5 col-md-3">
        <div class="form-login">
        <h1 class="text-center">Login<small>�α���������</small></h1>
         
        <input type="text" id="loginemail" name="mid" class="form-control input-lg chat-input" placeholder="���̵�" /></br>
         
        <input type="password" id="loginpwd" name="mpwd" class="form-control input-lg chat-input" placeholder="��й�ȣ" /></br>
         
        <div class="wrapper">
         <span class="group-btn">     
<!--              <a href="#" class="btn btn-success btn-lg btn-block">login <i class="fa fa-sign-in"></i></a> -->
			<input type="submit" class="btn btn-success btn-lg btn-block" value="login">
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
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Forget your ID?</h2>
      </div>
      <div class="modal-body">
        <p>		
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="�̸��� �Է��ϼ���" /><br/>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="������ �Է��ϼ���" /><br/>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="��ȭ��ȣ���� �Է��ϼ���" /><br/>
        </p>
        <button id="btn1" type="button" class="btn btn-success" data-toggle="collapse" data-target="#demo">�ԡ�������</button><p>
        <div id="demo" class="collapse alert alert-success">
        	{memname}���� ID�� {howsostupidru}�Դϴ�.
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>     



<div class="modal fade" id="findPwdModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
   <div class="modal-content">
     <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal">&times;</button>
       <h2 class="modal-title">Forget your Password?</h2>
     </div>
     <div class="modal-body">
       	<input type="text" id="" class="form-control input-xs chat-input" placeholder="ID�� �Է��ϼ���" /></br>
       	<input type="text" id="" class="form-control input-xs chat-input" placeholder="������ �Է��ϼ���" /></br>
       	<div style="text-align: left; color: #006600;">
       		<!-- ��й�ȣ ã�� ������ �̰��� ���;� �մϴ�.  -->
        		<span>&nbsp;&nbsp;������ ������ ?  �� ���ȳ�</span>
        	</div>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="������ ���� �Է��ϼ���" /></br>
        <button type="button" class="btn btn-success">�ԡ�������</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
<!-- Modal End --> 
  
   
</div>