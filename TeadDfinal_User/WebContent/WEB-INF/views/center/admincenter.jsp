<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="wrap">
<form method="post" action="insertcenter">
	<table>
		<thead>
			<tr>
				<td colspan="2">���� ���!</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="2">���� �̸� : <input type="text" name="cname" id="cname">
			</tr>
			<tr>
				<td>���� �ּ� : <input type="text" size="50" name="caddr" id="caddr" placeholder="�ּ�"></td>
				<td><input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br></td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="2"><input type="submit" size="20" value="���!"></td>
			</tr>
		</tfoot>
	</table>
</form>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=cafcd4fae4be10d7ffdde1bc7cadf004&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = data.address; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // �⺻ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.addressType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("caddr").value = fullAddr;
                // �ּҷ� ��ǥ�� �˻�
                geocoder.addr2coord(data.address, function(status, result) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {
                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
