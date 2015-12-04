<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

function checksubmit() {

//동일한 아이피가 이미 존재할 시 수행
if ($('#bipchkres').text()=="중복된 아이피 입니다." || $('#bipchkres').text()=="") {
	alert("아이피 중복 확인을 해주세요.")
	document.joinform.bip.focus()
	return false
	
}
}

//아이피 중복 체크
$(function() {
	$('#bipchk').click(function() {
		$.ajax({
			url: "bipchk",
			type: "GET",
			data: {
				bip: $('#bip').val()
			},
			dataType: "text",
			
			success: function(res) {

				if (res == "중복된 아이피 입니다.") {
					
					$('#bip').val("");
					$('#bipchkres').html(res).css('color', 'red');
				}
				else {
					
					$('#bipchkres').html(res).css('color', 'blue');
				}
			}
		});
	});
});



</script>

<form onsubmit="return checksubmit()" action="survey1" method="post">

아니 근데 여기는 대체 뭐가 들어가야 하지...

</form>