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

<form id="form1" class="form-inline">
  <label for="sel1" class="mr-sm-2">진료과목:</label>
  <select class="form-control mb-2 mr-sm-2" id="sel1" name="dept">
  	<option hidden>진료과목 선택</option>
    <option value="01">내과</option>
    <option value="02">신경과</option>
    <option value="03">정신건강의학과</option>
    <option value="04">외과</option>
    <option value="05">정형외과</option>
    <option value="06">신경외과</option>
    <option value="07">흉부외과</option>
    <option value="08">성형외과</option>
    <option value="09">마취통증의학과</option>
    <option value="10">산부인과</option>
    <option value="11">소아청소년과</option>
    <option value="12">안과</option>
    <option value="13">이비인후과</option>
    <option value="14">피부과</option>
    <option value="15">비뇨기과</option>
    <option value="49">치과</option>
    <option value="90">한방의학과</option>
  </select>
  
  <label for="sel2" class="mr-sm-2">반경:</label>
  <select class="form-control mb-2 mr-sm-2" id="sel2" name="radius">
    <option value="500">500m</option>
    <option value="1000" selected>1km</option>
  </select>
  
  <button type="button" class="btn btn-primary mb-2" onclick="search();">검색</button>
</form>



<!-- <div class="form-group mx-auto" style="width:80%;">
  <select class="" id="sel1" name="dept">
  	<option hidden>진료과목 선택</option>
    <option value="01">내과</option>
    <option value="02">신경과</option>
    <option value="03">정신건강의학과</option>
    <option value="04">외과</option>
    <option value="05">정형외과</option>
    <option value="06">신경외과</option>
    <option value="07">흉부외과</option>
    <option value="08">성형외과</option>
    <option value="09">마취통증의학과</option>
    <option value="10">산부인과</option>
    <option value="11">소아청소년과</option>
    <option value="12">안과</option>
    <option value="13">이비인후과</option>
    <option value="14">피부과</option>
    <option value="15">비뇨기과</option>
    <option value="49">치과</option>
    <option value="90">한방의학과</option>
  </select>
  
  <label for="sel2">반경</label>
  <select class="" id="sel2" name="radius">
    <option value="500">500m</option>
    <option value="1000" selected>1km</option>
    
  </select>
</div> -->



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
var currentLat;
var currentlng;

$(function() {
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(position) {
        	var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
			var locPosition = new kakao.maps.LatLng(lat, lon);
            
			var marker = new kakao.maps.Marker({
			    position: locPosition
			});
            
			mapOption = { 
				center: locPosition, // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

       	 	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        	map = new kakao.maps.Map(mapContainer, mapOption);
       	 	
        	marker.setMap(map);
            
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
    $("#map").mousedown(function(){
    	$('body').one("mouseup", function(){
    		search();
    		/* moveMap(map.getCenter().getLat(), map.getCenter().getLng()); */
    	})
    })
    
    
    $("#map").scroll(function(){
    	
    	
    });
    
    
    
});

function search(){
	var params = $("#form1").serialize(); //진료과목, 반경
	var lat = map.getCenter().getLat();
	var lng = map.getCenter().getLng();
	params += "&latitude="+lat+"&longitude="+lng; //지도중심좌표 파라미터로 추가
	
	$.ajax({
		url: "${path}/hospitalFind.do",
		type: "post",
		data: params,
		dataType: 'json',
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success: function(data){
			var radius = $("#sel2").val();
			if(circle){
				circle.setMap(null);
			}
			hideMarkers();
			markers.length=0;
			displayMarker(data, lat, lng, radius);
		},
		
		beforeSend:function(){
	        $('#Progress_Loading').show();
	    },
	    
	    complete:function(){
	    	$('#Progress_Loading').hide();
	    }



	});
}

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



function displayMarker(data, lat, lng, radius){
	
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
	    radius: radius, // 미터 단위의 원의 반지름입니다 
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

//에이잭스
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