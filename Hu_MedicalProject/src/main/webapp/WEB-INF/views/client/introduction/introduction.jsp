<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp"/>

<style>
* {
	font-family: 'helvetica','Spoqa Han Sans','Apple SD Gothic Neo', 'Malgun Gothic','Nanum Gothic', 'Noto Sans','sans-serif';
}
</style>

<div class="container-fluid py-5">
	<h5 class="text-center" style="font-size:40px;">"우리는 생각합니다"</h5>
	<br>
	<h6 class="text-center" style="font-size:18px;">건강한 삶을 위해 필요한 서비스와 유용한 정보를 제공하여</h6>
	<h6 class="text-center" style="font-size:18px;">더 행복하고 편리한 내일을 만드는 것이 HU의 미션입니다</h6> 
</div>

<div class="container-fluid p-0">
<img class="w-100" src="https://cdn.imweb.me/thumbnail/20190520/5ce2146681c55.jpg">
</div>


<div class="container-fluid py-5">
	<h5 class="text-center" style="font-size:40px;">"우리는 꿈 꿉니다"</h5>
	<br>
	<h6 class="text-center" style="font-size:18px;">병원접수/예약시스템을 시작으로</h6>
	<h6 class="text-center" style="font-size:18px;">통합 헬스케어 플랫폼의 꿈을 실현하고 있습니다 </h6> 
</div>

<div class="container-fluid p-0">
<img class="w-100" src="https://cdn.imweb.me/thumbnail/20190520/5ce2146f92cab.jpg">
</div>

<div class="container-fluid py-5">
	<h5 class="text-center" style="font-size:40px;">찾아오시는 길</h5>
	
</div>


<div align="center" class="container-fluid px-5">
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1589518445083" class="root_daum_roughmap root_daum_roughmap_landing w-75"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1589518445083",
		"key" : "ycko",
		"mapWidth" : "640",
		"mapHeight" : "500"
	}).render();
</script>

</div>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>