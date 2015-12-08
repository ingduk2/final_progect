<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 메뉴바와 게시판 리스트 사이 공간 띄움
	- bcode 1 (공지사항) 에서는 글쓰기 버튼 안보이게 함
	- 각종 멘트 변경
	- bcode에 따라 어디 게시판인지 출력하도록 함
 -->


<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

<style>
	.glyphicon {
		color: #8fbc8f
	}
/* 	tootip style */
	.plz>a:HOVER, .plz>td>a:focus{
		color: green;
	}
	/* Hover tooltips */
	.field-tip {
	    position:relative;
	    cursor:help;
	}
	    .field-tip .tip-content {
        position:absolute;
        top:-10px; /* - top padding */
        right:9999px;
        width:200px;
        margin-right:-220px; /* width + left/right padding */
        padding:10px;
        color:#fff;
        background:#89D495;
        -webkit-box-shadow:2px 2px 5px #aaa;
           -moz-box-shadow:2px 2px 5px #aaa;
                box-shadow:2px 2px 5px #aaa;
        opacity:0;
        -webkit-transition:opacity 250ms ease-out;
           -moz-transition:opacity 250ms ease-out;
            -ms-transition:opacity 250ms ease-out;
             -o-transition:opacity 250ms ease-out;
                transition:opacity 250ms ease-out;
    }
        /* <http://css-tricks.com/snippets/css/css-triangle/> */
        .field-tip .tip-content:before {
            content:' '; /* Must have content to display */
            position:absolute;
            top:50%;
            left:-16px; /* 2 x border width */
            width:0;
            height:0;
            margin-top:-8px; /* - border width */
            border:8px solid transparent;
            border-right-color:#89D495;
        }
        .field-tip:hover .tip-content {
            right:-20px;
            opacity:1;
        }
/* title style */
.titlename{width: 50%; margin: auto;}
#titlename{text-align: left; margin-bottom: 0px; margin-left: 8px; color: #27592F}


/* 채팅창 */
	.label-success{
		background-color:#69EEA8
	}
	#itsfloatdiv{
		position: fixed; position: absolute; 
		overflow: hidden;
		left: 0px;
		top: 160px;
		margin: 0;
		padding: 0;
		background-color: white;
		border-radius:10px;
		color: black;
		width: 280px
	}
	.chatchat{
			clear: both;
			width: 100%;
			padding: 2px
	}
</style>

<script>
var socket=null;
var id="";
var code="";
$(function() {
	id=$('#cid').val();
	code=$('#ccode').val();



var url="ws://localhost/TeadDfinal_User/chatting?id="+id+"&code="+code;
function connect() {
	if(socket==null){
		socket = new WebSocket(url); //afterconnection
		socket.onopen = function () {
			// 서버에 접속한 후 이벤트 정의
		};
		socket.onmessage = function (message) {
			$("#contents").append(message.data+"<br/>")
			// 서버에서 Session.send를 이용해서 메시지 전송할 때 수신 이벤트 정의
		};
		socket.onclose = function (event) {
			// 서버에서 접속 종료한 후 이벤트 정의
		};
	}else{
		alert("이미 접속중입니다");
	}
}


connect();

});

function disconnect() {
	socket.close();
	socket = null;
}

function send(){ //서버로 데이터를 전송하는 메서드
	if(socket!=null){
		socket.send($("#message").val());
		$("#message").val("");
	}else{
		alert("접속중이 아닙니다");
	}
}
</script>

<%-- <c:if test="${bcode!=1 }">
<div id="itsfloatdiv">

<input type="hidden" id="cid" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" id="ccode" value="board/${bcode }">
	<div id="contents"></div>
<br>
<a href="javascript:disconnect();">퇴장</a>
<br>
<a href="javascript:connect();">재접속</a>
<br>
<input type="text" id="message"><a href="javascript:send();">전송</a>
</div>
</c:if> --%>

<c:if test="${bcode!=1 }">
<div id="itsfloatdiv">
<input type="hidden" id="cid" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" id="ccode" value="board/${bcode }">

<div class="chatchat" >
	<!-- <div class="btn-group" style="clear: both;">
	  <a type="button" class="btn btn-success" href="javascript:disconnect();">　퇴　　　장　</a>
	  <a type="button" class="btn btn-success" href="javascript:connect();">　재　접　속　</a>
	</div> -->
	<div style="margin-top: 5px">
	<span class="label label-success" style="background-color: #C8E798; font-size:1em;">미니채팅</span><small>*회원분들과 대화를 나눠보세요</small>
	</div>
	<hr style="margin-top: 5px; margin-bottom: 3px">
	<div id="contents"><!-- 내용이 들어간다. --></div>
	<div class="input-group" style="width:100%;">
		<input type="text" class="form-control input-sm" type="text" id="message"/>
		<span class="input-group-btn">
    		<a type="button" class="btn btn-success btn-sm" href="javascript:send();">전송</a>
		</span>
	</div>
</div>
</div>
</c:if>

<div id="bg">
<!-- 공간 띄우기 용 -->
<table><tr height="50px"><td></td></tr></table>

<div class="titlename">
	<h3 id="titlename">
		<c:if test="${bcode==1}">▣ 공지사항</c:if>
		<c:if test="${bcode==2}">▣ 자유 게시판</c:if>
		<c:if test="${bcode==3}">▣ 질문 게시판</c:if>
	</h3>
<hr style="margin-top: 3px">
</div>

<table style="width: 50%;">
	<thead style="font-weight:bold; color:black;">
		<tr id="title"> <td colspan="2" width="300px" style=" text-overflow: ellipsis;">제목</td><td width="180px">작성자</td><td width="100px">작성일</td><td>조회</td> </tr>
	</thead>
	
	<tbody id="tbodycss">
		<c:forEach var="list" items="${list}">
			<tr>
				<td width="30px">${list.bno}</td>
				<td class="plz" style="text-align: left; padding-left: 20px; text-overflow: ellipsis;">
					<c:forEach begin="1" end="${list.blvl}">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${list.blvl != 0}">
						<span class="glyphicon glyphicon-arrow-right"></span>&nbsp;
					</c:if>
					<a href="selectoneBoard?bno=${list.bno}&mid=${list.mid}&nowPage=${nowPage}">
						<span class="field-tip">${list.btitle}
							<span class="tip-content" style="z-index: 99;">${list.bcontent}...</span>
						</span>
					</a>
				</td>
				<td>${list.mid}</td>
				<td>${list.bdate}</td>
				<td>${list.bhit}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	
	<tfoot>
		<tr><td>　</td></tr>
		<tr> 
			<td colspan="5"> 
				<!-- 공지사항 게시판에서는 글쓰기 버튼 안보이게 -->
				<c:if test="${bcode != 1}">
					<button type="submit" onclick="location='formBoard?bcode=${bcode}&nowPage=${nowPage}'" class="btn btn-success btn-sm">
						&nbsp;&nbsp;글 등 록&nbsp;&nbsp;
					</button>
				</c:if>
			</td> 
		</tr>
		<tr><td>　</td></tr>
	</tfoot>
	
	</table>
	
	<form action="selectallBoard" method="post">
	<table><!-- 넘버링이랑, 검색, 글쓰기버튼,  --> 
		<thead> 
			<tr> <td colspan="5"> <!-- 페이징작업부분입니다. --> ${pagingCode }  </td> </tr>
		</thead>
		<tbody>
			<tr>  
				<td> &nbsp;
						<!--  다이나믹쿼리로 검색기능 추가할 부분 -->
				      <select name="searchType" class="form-control input-sm" id="sel1">
					        <option value="1">제목</option>
					        <option value="2">작성자</option>
					        <option value="3">내용</option>
				      </select>&nbsp;
				</td>
				<td>&nbsp;
					<input type="hidden" name="bcode" value="${bcode}">
					<input type="hidden" name="nowPage" value="1">
					<input class="form-control input-sm" type="text" name="searchValue" />&nbsp;
				</td>
				<td>&nbsp;
				 <!--  검색버튼, 파라미터값넘길부분  -->
					<button type="submit" class="btn btn-default btn-sm">검색</button> &nbsp;
				</td>  
			</tr>
		</tbody>
	</table>
	</form>
</div>