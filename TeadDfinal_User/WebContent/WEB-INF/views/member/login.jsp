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
	
/* 	Modal용 style */
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
        <h1 class="text-center">Login<small>로그인페이지</small></h1>
         
        <input type="text" id="loginemail" name="mid" class="form-control input-lg chat-input" placeholder="아이디" /></br>
         
        <input type="password" id="loginpwd" name="mpwd" class="form-control input-lg chat-input" placeholder="비밀번호" /></br>
         
        <div class="wrapper">
         <span class="group-btn">     
<!--              <a href="#" class="btn btn-success btn-lg btn-block">login <i class="fa fa-sign-in"></i></a> -->
			<input type="submit" class="btn btn-success btn-lg btn-block" value="login">
         </span>
        </div>
         
        <hr>
         <!-- autocomplete: HTML5 속성, 자동완성 꺼주는 기능 -->
        <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#findIdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tag"> 아이디찾기&nbsp;</span>
        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#findPwdModal" autocomplete="off">
        	<span class="glyphicon glyphicon-tags"> 비밀번호찾기&nbsp;</span>
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
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="이름을 입력하세요" /><br/>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="메일을 입력하세요" /><br/>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="전화번호를을 입력하세요" /><br/>
        </p>
        <button id="btn1" type="button" class="btn btn-success" data-toggle="collapse" data-target="#demo">입　　　력</button><p>
        <div id="demo" class="collapse alert alert-success">
        	{memname}님의 ID는 {howsostupidru}입니다.
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
       	<input type="text" id="" class="form-control input-xs chat-input" placeholder="ID를 입력하세요" /></br>
       	<input type="text" id="" class="form-control input-xs chat-input" placeholder="메일을 입력하세요" /></br>
       	<div style="text-align: left; color: #006600;">
       		<!-- 비밀번호 찾기 질문은 이곳에 나와야 합니당.  -->
        		<span>&nbsp;&nbsp;질문이 뭐였게 ?  난 기억안남</span>
        	</div>
        	<input type="text" id="" class="form-control input-xs chat-input" placeholder="질문에 답을 입력하세요" /></br>
        <button type="button" class="btn btn-success">입　　　력</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success input-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
<!-- Modal End --> 
  
   
</div>