<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.subimgmenuborder{
		float: left;
		width: 50%;
		text-align: left;
	}
	.panel{
		background-color: transparent;
		margin: 5px
	}
	.carousel-control.right, .carousel-control.left {
	    background-image: none;
	    color: #9ACD32;
	}
	.carousel-indicators li {
	    border-color: #9ACD32;
	}
	.carousel-indicators li.active {
	    background-color: #9ACD32;
	}
	.item h4 {
	    font-size: 19px;
	    line-height: 1.375em;
	    font-weight: 400;
	    font-style: italic;
	    margin: 70px 0;
	}
	.item span {
	    font-style: normal;
	}
	.label{
		margin-left: 15px
	}
	.panel-body>table td {
		border-bottom: 1px solid #ddd;
		text-align: left; 
		font-size: 5px;
		height: auto;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		padding: 0px
	}
	.panel-body>table{
		margin-bottom: 0px
	}
	.panel-body>table th{
		margin-bottom: 3px
	}
	#secondlabel1, #secondlabel2{
		margin-left: 5px;
		background-color: #D3FA9D;
		margin-bottom: 2px;
	}
	#itsfloatdiv{
		position: fixed; position: absolute; 
/* 		z-index: -1; */
		overflow: hidden;
		left: 0px;
		top: 160px;
		margin: 0;
		padding: 0
	}
	#imgtest{
		background-image: url("img/mainimg.png");
		width: 50%;
		height: 250px;
		background-repeat: no-repeat;
		margin: auto;
		background-position: center center;
	}
	.label-info{
		background-color: #C8E798;
	}
</style>

<script> //팝업
	function popup(){
		var specs = "left=10,top=10,width=697,height=546, location=no, realzable=no, scrollbars=no";
		window.open("popup?num=1", "popup", specs);
	}
	function popup2(){
		var specs = "left=10,top=10,width=697,height=515, location=no, realzable=no, scrollbars=no";
		window.open("popup2?num=2", "popup", specs);
	}
	function popup3(){
		var specs = "left=10,top=10,width=697,height=470, location=no, realzable=no, scrollbars=no";
		window.open("popup3?num=3", "popup", specs);
	}
	function popup4(){
		var specs = "left=10,top=10,width=697, height=515, location=no, realzable=no, scrollbars=no";
		window.open("popup4?num=4", "popup", specs);
	}
</script>


<div class="body" style="width: 100%">

	<div id="itsfloatdiv"> <!-- 얘는 설문조사를 넣을 애다. -->
	<span class="label label-info" style="margin-left: 100px" >설문조사 참여하기</span>
	<table style="margin-left: 100px; height: 500px">
		<tr>
			<td>
				<a href="#" onclick="popup()"><img src="img/test/research03.png"/></a>
			</td>  
		</tr>
		<tr>
			<td><a href="#" onclick="popup2()"><img src="img/test/research02.png"/></a></td>  
		</tr>
		<tr>
			<td><a href="#" onclick="popup3()"><img src="img/test/research01.png" height="95px"/></a></td>  
		</tr>
		<tr>
			<td><a href="#" onclick="popup4()"><img src="img/test/research04.png"/></a></td>
		</tr>
	</table> 
	</div>

	<!-- index page 입양 하기 바로가기 로그인 체크 -->
	<div id="imgtest">
		<c:if test="${pageContext.request.userPrincipal.name == null}">
			<a href="login">
				<img src="img/gobtn.png" style="margin-top:192px;  margin-right: 250px;">
			</a><!-- 바로가기버튼입니다 -->
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<a href="selectallAnimal?bcode=6&nowPage=1&searchType=">
				<img src="img/gobtn.png" style="margin-top:192px;  margin-right: 250px;">
			</a><!-- 바로가기버튼입니다 -->
		</c:if>
	</div>
	
	<div style="margin: auto; width: 50%">

		<div class="subimgmenuborder">
		
		<span class="label label-success">찾아주세요</span>
		<div class="panel panel-default">
			<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			      <li data-target="#myCarousel" data-slide-to="4"></li>
			      <li data-target="#myCarousel" data-slide-to="5"></li>
			    </ol>

				<div class="carousel-inner" role="listbox">
			    
			    <c:forEach var="mainminiimgboard1" items="${mainminiimgboard1}" varStatus="status">
			    	<c:if test="${status.count==1}">
				  		<div class="item active">
				  	</c:if>
				  	<c:if test="${status.count!=1}">
				  		<div class="item">
				  	</c:if>
				  
						  <div class="panel-body">
						  	<a href="selectoneAnimal?anino=${mainminiimgboard1.anino}&bno=${mainminiimgboard1.bno}&nowPage=1">
						  		<img src="img/${mainminiimgboard1.aniimg}" height="122px">
						  	</a>
						  </div>
				      </div>
			      </c:forEach>
			      
			    </div>
			    
		        <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      <span class="sr-only">Next</span>
			    </a>
			</div>
		</div>
		</div>
		
		
		<div class="subimgmenuborder">
		<span class="label label-success">나를찾아줘</span>
		<div class="panel panel-default">
			<div id="myCarousel2" class="carousel slide text-center" data-ride="carousel">
			<!--Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			      <li data-target="#myCarousel" data-slide-to="4"></li>
			      <li data-target="#myCarousel" data-slide-to="5"></li>
			    </ol>

				<div class="carousel-inner" role="listbox">
				
				  <c:forEach var="mainminiimgboard2" items="${mainminiimgboard2}" varStatus="status">
				  	
				  	<c:if test="${status.count==1}">
				  		<div class="item active">
				  	</c:if>
				  	<c:if test="${status.count!=1}">
				  		<div class="item">
				  	</c:if>
				  	
						  <div class="panel-body">
						  	<a href="selectoneAnimal?anino=${mainminiimgboard2.anino}&bno=${mainminiimgboard2.bno}&nowPage=1">
						  		<img src="img/${mainminiimgboard2.aniimg}" height="122px">
						  	</a>
						  </div>
				      </div>
			      </c:forEach>
			      
			    </div>
			    
		        <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      <span class="sr-only">Next</span>
			    </a>
			</div>
		  </div>
		</div>
	</div>
	
	<div style="clear: both; margin: auto; width: 50%"> <!-- 공지사항용 -->
		<div class="subimgmenuborder">
			<div class="panel panel-default ">
		  		<div class="panel-body">
		  		<!-- 공지사항게시판 -->
		  			<table class="table table-hover" id="mainlist">
		  				<thead>
		  					<tr>
		  						<th>
		  							공지사항
		  							<a href="selectallBoard?bcode=1&nowPage=1&searchType=">
		  								<span id="secondlabel1" class="label label-default">▷More..</span>
		  							</a>
		  						</th>
		  					</tr>
		  				</thead>
		  				<tbody><!--miniboard -->   <!-- http://localhost/TeadDfinal_User/selectoneBoard?bno=96&mid=winni -->
		  					<c:forEach var="minilist" items="${minilist}">
		  						<tr>
		  							<td>
		  								<a href="selectoneBoard?bno=${minilist.bno}&mid=${minilist.mid}&nowPage=1">
		  									
		  									<c:if test="${minilist.btitle.length() < 20}">
		  										${minilist.btitle}(${minilist.bdate})
		  									</c:if>
		  									<c:if test="${minilist.btitle.length() > 20}">
		  										${minilist.btitle}.....(${minilist.bdate})
		  									</c:if>
		  								</a>
		  							</td>
		  						</tr>
		  					</c:forEach>
		  				</tbody>
		  			</table>
		  		</div>
			</div>	
		</div>
		<div class="subimgmenuborder">
			<div class="panel panel-default ">
		  		<div class="panel-body">
		  			<!-- 질의응답게시판 -->
		  			<table class="table table-hover" id="mainlist">
		  				<thead>
		  					<tr>
		  						<th>
		  							질의응답
		  							<a href="selectallBoard?bcode=3&nowPage=1&searchType=">
		  								<span  id="secondlabel2" class="label label-default">▷More..</span>
		  							</a>
		  						</th>
		  					</tr>
		  				</thead>
		  				<tbody>
		  					<c:forEach var="minilist2" items="${minilist2}">
		  						<tr>
		  							<td>
		  								<a href="selectoneBoard?bno=${minilist2.bno}&mid=${minilist2.mid}&nowPage=1">
		  									<c:if test="${minilist2.btitle.length() < 20}">
		  										${minilist2.btitle}(${minilist2.bdate})
		  									</c:if>
		  									<c:if test="${minilist2.btitle.length() > 20}">
		  										${minilist2.btitle}.....(${minilist2.bdate})
		  									</c:if>
		  								</a>
		  							</td>
		  						</tr>
		  					</c:forEach>
		  				</tbody>
		  			</table>
		  		</div>
			</div>	
		</div>
	</div>
	
</div>



