<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

function checksubmit() {

//������ �����ǰ� �̹� ������ �� ����
if ($('#bipchkres').text()=="�ߺ��� ������ �Դϴ�." || $('#bipchkres').text()=="") {
	alert("������ �ߺ� Ȯ���� ���ּ���.")
	document.joinform.bip.focus()
	return false
	
}
}

//������ �ߺ� üũ
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

				if (res == "�ߺ��� ������ �Դϴ�.") {
					
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

�ƴ� �ٵ� ����� ��ü ���� ���� ����...

</form>