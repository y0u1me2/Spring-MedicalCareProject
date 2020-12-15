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
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;}
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

<div class="d-flex justify-content-center mt-5" >
	
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-outline-danger">
			<input type="radio" name="jb-radio" id="jb-radio-1" value="1" checked> 내 주변 약국 찾기
		</label>
		<label class="btn btn-outline-danger">
			<input type="radio" name="jb-radio" id="jb-radio-2" value="2"> 현재 영업 중인 약국 찾기
		</label>
		<label class="btn btn-outline-danger">
			<input type="radio" name="jb-radio" id="jb-radio-3" value="3"> 마스크 지도 보기
		</label>
	</div>
	
</div>

<div class="d-flex justify-content-between mx-auto my-2" style="width:80%;">
	<div>총 검색결과: <span id="total"></span>건</div>
	<button type="button" class="btn btn-outline-primary" onclick="myPosition();">내 위치로 이동</button>
</div>

<div class="map_wrap mx-auto border d-flex mb-5" style="width:80%;">
    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white" style="width:25%;">
        
        <ul id="placesList">
        	
        		<h1 class="font-weight-bold pt-5 text-center" style="font-size:40px;">지도 이용방법</h1>
	       		<p class="px-4 pt-5 pb-3" style="font-size:20px">1. 내 주변 약국 찾기</p>
	       		<p class="px-4" style="font-size:15px">지도에서 원하는 위치를 클릭하면 그 지점을 중심으로 검색합니다.</p>
	       		
	       		<p class="px-4 pt-5 pb-3" style="font-size:18px">2. 현재 영업 중인 약국 찾기</p>
	       		<p class="px-4" style="font-size:15px">현재 시간 기준으로 영업 중인 약국만 검색합니다. (최대 100건)</p>
	       		
	       		<p class="px-4 pt-5 pb-3" style="font-size:20px">3. 마스크 지도 보기</p>
	       		<p class="px-4" style="font-size:15px">재고 업데이트 시간을 반드시 확인해주세요.</p>
        	
        </ul>
        <div id="pagination"></div>
    </div>
</div>




<div id = "Progress_Loading"><!-- 로딩바 -->
	<img src="${path }/resources/images/loading.gif"/>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a74ea60d1848a1ea867826229c40b3f6&libraries=services"></script>
<script>
var map;
var markers = [];
var circle;
var curLat;
var curLon;
var curPosition;
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

$(function() {//처음에 페이지 로딩되었을때 지도에 현재 위치 찍어주기
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(position) {
        	
        	curLat = position.coords.latitude; // 위도
            curLon = position.coords.longitude; // 경도
			curPosition = new kakao.maps.LatLng(curLat, curLon);
			
            var mapContainer = document.getElementById('map');
			mapOption = {
				center: curPosition, // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
			map = new kakao.maps.Map(mapContainer, mapOption);

			var imageSrc = '${path}/resources/images/here3.png'; // 마커이미지의 주소입니다    
	        var imageSize = new kakao.maps.Size(50, 50); // 마커이미지의 크기입니다
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	        
			var marker = new kakao.maps.Marker({
				title: "현재 내 위치",
			    position: curPosition,
			    image: markerImage
			});
        	marker.setMap(map);
        	
        	
        	//지도에 이벤트 등록
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
        	    default:
        	    	radius = 2000;
        	    }
        	    
        	    if(circle){
    				circle.setMap(null);
    			}
        	    
        	    removeMarker();
        	    
        	    $("#placesList").empty();//좌표 이동 시에는 비워준다
    			$("#pagination").empty();//좌표 이동 시에는 비워준다
    			$("#total").empty();
    			
        	    map.panTo(latlng);//클릭한 지점으로 지도중심좌표 이동시키기
        	    
        	    
        	    var radioVal = $('input[name="jb-radio"]:checked').val();
        	    
        	    switch(radioVal){
	        	    case '1':
	        	    	searchPhrm1(latlng.getLat(), latlng.getLng(), radius);
	        	    	break;
	        	    case '2':
	        	    	searchPhrm2(latlng.getLat(), latlng.getLng());
	        	    	break;
	        	    case '3':
	        	    	searchMask(latlng.getLat(), latlng.getLng(), radius);
	        	    	break;
	        	    default:
	        	    	alert('검색 옵션을 선택해주세요');
        	    }
        	    
        	});
            
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
    
    
    
    
});



function myPosition(){
	
	$("#placesList").empty();
	$("#pagination").empty();
	$("#total").empty();
	
	if(circle){
		circle.setMap(null);
	}
    
    removeMarker();
	
	map.setCenter(curPosition);
	map.setLevel(3);
}






/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
//1. 내 주변 약국 찾기
function searchPhrm1(lat, lng, radius, pageNo){
	
	if(circle){
		circle.setMap(null);
	}
	
	displayCircle(lat, lng, radius);//해당 위치에 원 표시
	
	$.ajax({
		url:"${path}/searchPhrm1.do",
		data:{"latitude":lat, "longitude":lng, "radius":radius, "pageNo":pageNo},
		dataType: 'json',
		success: function(data){
			var places = data.response.body.items.item;
			var totalCount = data.response.body.totalCount;
			var totalPage;
			
			$("#total").html(totalCount);

			if(totalCount=='0'){
				alert("검색결과가 없습니다.");
				return;
			}else{
				totalPage = Math.ceil(Number(totalCount)/10);
			}
			
			if(totalCount==1){
				var place = places;
				places = [];
				places.push(place);
			}
			
			displayPlaces1(places, lat, lng, radius);
			displayPagination1(lat, lng, radius, pageNo, totalPage);
		},
		
		beforeSend:function(){
	        $('#Progress_Loading').show();
	    },
	    
	    complete:function(){
	    	$('#Progress_Loading').hide();
	    }
	});
}


//1. 내주변 약국찾기
function displayPlaces1(places, lat, lng, radius) {
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].YPos, places[i].XPos),
            marker = addMarker1(placePosition, i, places[i].yadmNm), 
            itemEl = getListItem1(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
				
                /* kakao.maps.event.addListener(marker, 'click', function() {
                    overlay.setMap(map);
                }); */
                
                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].yadmNm);    
            

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

}

//1. 내주변 약국찾기
function getListItem1(index, places) {

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

//1. 내주변 약국찾기
function addMarker1(position, idx, title) {
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

//1. 내주변 약국찾기
function displayPagination1(lat, lng, radius, pageNo, totalPage) {
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
                	searchPhrm1(lat, lng, radius, i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}





/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
//2.현재 영업중인 약국 찾기
function searchPhrm2(lat, lng, pageNo){
	
	if(circle){
		circle.setMap(null);
	}
	
	$.ajax({
		url:"${path}/searchPhrm2.do",
		data:{"latitude":lat, "longitude":lng, "pageNo":pageNo},
		dataType: 'json',
		success: function(data){
			var places = data.response.body.items.item;
			var totalCount = data.response.body.totalCount;
			var totalPage;
			

			if(totalCount=='0'){
				alert("검색결과가 없습니다.");
				return;
			}else{
				totalPage = Math.ceil(Number(totalCount)/10);
				if(totalPage>10){
					totalCount = 100;
					totalPage = 10;//데이터 최대 100개까지만 표시
				}
			}
			
			if(totalCount==1){
				var place = places;
				places = [];
				places.push(place);
			}
			
			$("#total").html(totalCount);
			
			displayPlaces2(places, lat, lng);
			displayPagination2(lat, lng, pageNo, totalPage);
		},
		
		beforeSend:function(){
	        $('#Progress_Loading').show();
	    },
	    
	    complete:function(){
	    	$('#Progress_Loading').hide();
	    }
	});
}


//2.현재 영업중인 약국 찾기
//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces2(places, lat, lng) {
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    bounds.extend(new kakao.maps.LatLng(lat, lng));//지도에 찍은 좌표를 바운더리에 추가
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
    startOption = { 
        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

	// 출발 마커 이미지를 생성합니다
	var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
    
	// 출발 마커를 생성합니다
	var startMarker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(lat, lng),
	    image: startImage // 출발 마커이미지를 설정합니다
	});
    
	startMarker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(startMarker);  // 배열에 생성된 마커를 추가합니다
    
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker2(placePosition, i, places[i].dutyName), 
            itemEl = getListItem2(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
				
                /* kakao.maps.event.addListener(marker, 'click', function() {
                    overlay.setMap(map);
                }); */
                
                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].dutyName);    
            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    
}

//2.현재 영업중인 약국 찾기
function getListItem2(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.dutyName + '</h5>';//약국 이름

    itemStr += '    <span>' +  places.dutyAddr  + '</span>';//주소
    
    /* itemStr += '    <span> 직선거리 : ' +  places.distance  + '</span>';//직선거리 */
    
    itemStr += '    <span> 마감시간 : ' +  places.endTime  + '</span>';//마감시간
    
    itemStr += '  <span class="tel">' + places.dutyTel1  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

//2.현재 영업중인 약국 찾기
function addMarker2(position, idx, title) {
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

//2.현재 영업중인 약국 찾기
function displayPagination2(lat, lng, pageNo, totalPage) {
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
                	searchPhrm2(lat, lng, i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}












/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  */

//3. 마스크 지도
function searchMask(lat, lng, radius){
	
	if(circle){
		circle.setMap(null);
	}
	
	displayCircle(lat, lng, radius);//해당 위치에 원 표시
	
	$.ajax({
		url:"https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json",
		data:{"lat":lat, "lng":lng, "m":radius},
		success: function(data){
			var totalCount = data.count;
			var places = data.stores;
			
			$("#total").html(totalCount);
			
			if(totalCount=='0'){
				alert("검색결과가 없습니다.");
				return;
			}
			
			displayPlaces3(places, lat, lng, radius);
		}
	});
	
}


//3. 마스크 지도
function displayPlaces3(places, lat, lng, radius) {
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].lat, places[i].lng),
            marker = addMarker3(placePosition, i, places[i].name), 
            itemEl = getListItem3(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        
            
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].name);    
            
        listEl.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    
    menuEl.scrollTop = 0;

}

//3. 마스크 지도
function getListItem3(index, places) {
	
	var stock;
	var updateTime = (places.stock_at==null)?"정보 없음":places.stock_at;
	
	switch (places.remain_stat){
	case 'plenty':
		stock = "100개 이상";
		break;
	case 'some':
		stock = "30개 이상 100개 미만";
		break;
	case 'few':
		stock = "2개 이상 30개 미만";
		break;
	case 'empty':
		stock = "1개 이하";
		break;
	case 'break':
		stock = "판매 중지";
		break;
	default:
		stock = "확인 불가";
	}
	
    var el = document.createElement('li'),
    itemStr = '<span>'+(index+1)+'</span>' +
                '<div class="info">' +
                '   <h5>' + places.name + '</h5>';

    itemStr += '    <span>' +  places.addr  + '</span>'; 
    
    itemStr += '    <span> 재고상태 : ' + stock  + '</span>';
    
    itemStr += '  <span>업데이트 시간 : ' + updateTime  + '</span>'
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

//3. 마스크 지도
function addMarker3(position, idx, title) {
        
        var imageSrc = '${path}/resources/images/mask4.png'; // 마커이미지의 주소입니다    
        var imageSize = new kakao.maps.Size(30, 30); // 마커이미지의 크기입니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        
        
        var marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            title: title,
            image: markerImage
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */


//공통 함수들


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1; text-align:center;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
 
function displayCircle(lat, lng, radius){
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

	circle.setMap(map);//지도 표시
}
 


</script>



</section>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>