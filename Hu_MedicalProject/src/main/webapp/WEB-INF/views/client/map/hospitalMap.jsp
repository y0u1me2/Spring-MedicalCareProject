<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<style>
#Progress_Loading
{
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 5;
	display: none;
}
</style>
<section class="container-fluid border" >
	


<div id="map" class="mx-auto my-5" style="width:80%;height:500px;" ondrop="getInfo();"></div>
<!-- <button onclick="getInfo();">중심좌표</button> -->

<div id = "Progress_Loading"><!-- 로딩바 -->
	<img src="${path }/resources/images/loading.gif"/>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a74ea60d1848a1ea867826229c40b3f6&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOption;
var map;
var markers = [];
var circle;

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
    		moveMap(map.getCenter().getLat(), map.getCenter().getLng());
    	})
    })
    
    
    $("#map").scroll(function(){
    	
    	
    });
    
    
    
});


function getInfo(){
	/* alert(map.getCenter().getLat()); */
	
}


function moveMap(lat, lng){
	$.ajax({
		url: "${path}/hospitalFind.do",
		type: "post",
		data: {latitude:lat, longitude:lng},
		dataType: 'json',
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success: function(data){
			alert("데이터 로드 성공");
			if(circle){
				circle.setMap(null);
			}
			hideMarkers();
			markers.length=0;
			displayMarker(data, lat, lng);
			
			
		},
		
		beforeSend:function(){
	        $('#Progress_Loading').show();
	    },
	    
	    complete:function(){
	    	$('#Progress_Loading').hide();
	    }



	});
}



function displayMarker(data, lat, lng){
	
	var arr = data.response.body.items.item;
	var positions = [];
	
	for(p in arr){
		var p = {
				title : arr[p].yadmNm,
				latlng : new kakao.maps.LatLng(arr[p].YPos, arr[p].XPos)
		};
		positions.push(p)
	}
	
	console.log(positions);
	
	 
    
	for (var i = 0; i < positions.length; i ++) {
	    
	    addMarker(positions[i]);
	    
	}
	
	
	// 지도에 표시할 원을 생성합니다
	circle = new kakao.maps.Circle({
	    center : new kakao.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다 
	    radius: 100, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 5, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
	}); 

	// 지도에 원을 표시합니다 
	circle.setMap(map);
	
	
}

function addMarker(position) {
	
	var imageSrc = "${path}/resources/images/logo5.png";
    var imageSize = new kakao.maps.Size(25, 25); 
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position.latlng,
        title : position.title,
        image : markerImage
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)    
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);    
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