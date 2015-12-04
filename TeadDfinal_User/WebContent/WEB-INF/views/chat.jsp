<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//code.jquery.com/jquery-1.8.0.min.js"></script>
<script>
var socket=null;
var url="ws://localhost:8080/websocket2/sample.do?id=bbaico";
function connect() {
	if(socket==null){
		socket = new WebSocket(url); //afterconnection
		socket.onopen = function () {
			// 서버에 접속한 후 이벤트 정의
			socket.send("code/sessionid");
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
connect();
</script>


<div id="contents"></div>
<br>
<a href="javascript:disconnect();">퇴장</a>
<br>
<a href="javascript:connect();">재접속</a>
<br>
<input type="text" id="message"><a href="javascript:send();">전송</a>

