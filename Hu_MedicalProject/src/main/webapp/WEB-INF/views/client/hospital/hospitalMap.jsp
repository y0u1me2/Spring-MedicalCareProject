<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>

<section class="container-fluid border" >
	


<div id="map" class="mx-auto my-5" style="width:80%;height:500px;" ondrop="getInfo();"></div>
<button onclick="getInfo();">중심좌표</button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a74ea60d1848a1ea867826229c40b3f6&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOption;
var map;

$(function() {
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            
			mapOption = { 
				center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

       	 	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        	map = new kakao.maps.Map(mapContainer, mapOption);
            
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
    $("#map").mousedown(function(){
    	$('body').one("mouseup", function(){
    		alert(map.getCenter().getLat());
    	})
    })
    
});


function getInfo(){
	alert(map.getCenter().getLat());
}
</script>


<!-- <script>
	function findHospital(){
		$.ajax({
			url: "${path}/hospitalFind.do",
			type: "post",
			dataType: 'json',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success: function(data){
				alert("데이터 로드 성공");
				console.log(data);
			}
		});
	}

</script> -->

</section>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>