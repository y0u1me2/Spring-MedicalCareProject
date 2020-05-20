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

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:600px;}
#menu_wrap {padding:5px;overflow-x: auto;overflow-y:auto;background:light-gray;z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}


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
    <option value="80">한방의학과</option>
  </select>
  
  <!-- <label for="sel2" class="mr-sm-2">반경:</label>
  <select class="form-control mb-2 mr-sm-2" id="sel2" name="radius">
    <option value="100" selected>100m</option>
    <option value="500">500m</option>
    <option value="1000">1km</option>
  </select> -->
  
  <button type="button" class="btn btn-primary mb-2" onclick="search();">검색</button>
</form>






<!-- <div id="map" class="mx-auto my-5" style="width:80%;height:500px;" ondrop="getInfo();"></div> -->
<!-- <button onclick="getInfo();">중심좌표</button> -->


<div class="map_wrap mx-auto border d-flex" style="width:1100px;">
    <div id="map" style="width:75%;height:600px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white" style="width:25%;">
        
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>


<div id = "Progress_Loading"><!-- 로딩바 -->
	<img src="${path }/resources/images/loading.gif"/>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a74ea60d1848a1ea867826229c40b3f6&libraries=services"></script>
<script>
var mapContainer; // 지도를 표시할 div
var mapOption;
var map;
var markers = [];
var circle;
var curLat;
var curLon;

$(function() {//처음에 페이지 로딩되었을때 지도에 현재 위치 찍어주기
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(position) {
        	
        	mapContainer = document.getElementById('map');
        	curLat = position.coords.latitude; // 위도
            curLon = position.coords.longitude; // 경도
			var locPosition = new kakao.maps.LatLng(curLat, curLon);
            
			var marker = new kakao.maps.Marker({
				title: "현재 내 위치",
			    position: locPosition
			});
            
			mapOption = {
				center: locPosition, // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};

       	 	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        	map = new kakao.maps.Map(mapContainer, mapOption);
        	marker.setMap(map);
        	
        	
        	//지도에 이벤트 등록(지도에서 특정 지점 클릭 시 그 지점을 기준으로 병원 검색)
        	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        	    
        	    var latlng = mouseEvent.latLng;
        	    var level = map.getLevel();
        	    var radius;
        	    
        	    switch(level){
        	    case 1:
        	    	radius = 80; 
        	    	break;
        	    case 2:
        	    	radius = 120;
        	    	break;
        	    case 3:
        	    	radius = 200;
        	    	break;
        	    case 4:
        	    	radius = 400;
        	    	break;
        	    case 5:
        	    	radius = 1000;
        	    	break;
        	    case 6:
        	    	radius = 2000;
        	    	break;
        	    }
        	    
        	    map.panTo(latlng);//클릭한 지점으로 지도중심좌표 이동시키기
				searchHospital(latlng.getLat(), latlng.getLng(), radius);//병원 검색
        	    
        	});
            
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
    
    
    
    
});

function searchHospital(lat, lng, radius, pageNo){
	var params = $("#form1").serialize(); //진료과목, 반경
	/* var lat = map.getCenter().getLat();
	var lng = map.getCenter().getLng(); */
	params += "&latitude="+lat+"&longitude="+lng+"&radius="+radius+"&pageNo="+pageNo; //파라미터 추가
	
	$.ajax({
		url: "${path}/hospitalFind.do",
		type: "post",
		data: params,
		dataType: 'json',
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success: function(data){
			var places = data.response.body.items.item;
			var totalCount = data.response.body.totalCount;
			var totalPage;
			
			if(totalCount != '0'){
				totalPage = Math.ceil(Number(totalCount)/10);
			}
			if(!places){
				alert("검색결과가 없습니다.");
				return;
			}
			if(circle){
				circle.setMap(null);
			}
			/* hideMarkers();
			markers.length=0; */
			/* displayMarker(data, lat, lng, radius); */
			displayPlaces(places, lat, lng, radius);
			displayPagination(lat, lng, radius, pageNo, totalPage);
		},
		
		beforeSend:function(){
	        $('#Progress_Loading').show();
	    },
	    
	    complete:function(){
	    	$('#Progress_Loading').hide();
	    }



	});
}












//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places, lat, lng, radius) {
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].YPos, places[i].XPos),
            marker = addMarker(placePosition, i, places[i].yadmNm), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    //map.setBounds(bounds);
    
 // 지도에 표시할 원을 생성합니다
	circle = new kakao.maps.Circle({
	    center : new kakao.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다 
	    radius: radius, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 5, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.5  // 채우기 불투명도 입니다   
	}); 

	// 지도에 원을 표시합니다 
	circle.setMap(map);
    
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.yadmNm + '</h5>';

    itemStr += '    <span>' +  places.addr  + '</span>'; 
    
                 
    itemStr += '  <span class="tel">' + places.telno  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            title: title,
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(lat, lng, radius, pageNo, totalPage) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=totalPage; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i==pageNo) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    searchHospital(lat, lng, radius, i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
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
	    fillOpacity: 0.5  // 채우기 불투명도 입니다   
	}); 

	// 지도에 원을 표시합니다 
	circle.setMap(map);
	
	
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



</section>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>