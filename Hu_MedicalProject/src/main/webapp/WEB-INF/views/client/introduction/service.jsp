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

body{
	background-image:url('https://cdn.imweb.me/thumbnail/20190418/5cb808dca2354.png'); 
	background-attachment: fixed;
}
</style>

<div class="container-fluid p-0 border" style="">
	<div class="w-100 border" style="height:600px;">
		<h1 align="center" style="font-size:72px; color:white; margin-top:200px;">편리한 병원 예약 / 접수부터</h1>
		<h1 align="center" style="font-size:72px; color:white;">다양한 건강정보 확인까지</h1>
	</div>

	<div class="w-100" style="height:900px; background-color:white;">
		<div class="w-50  mx-auto d-flex flex-wrap">
			<div class=" w-50" >
				<p style="font-size:26px;">병원 예약 / 접수</p>
				<p style="font-size:18px;">병원 방문 후 기다림은 끝<br>모바일 예약과 접수 후, 시간에 맞춰 방문하세요</p>
			</div>
			
			
			
			<div class=" w-50">
				<p style="font-size:26px;">병원 / 약국 찾기</p>
				<p style="font-size:18px;">일일이 전화하지 않아도 됩니다<br>병원 / 약국 위치, 영업시간 정보 등을 알려드립니다</p>
			</div>
			
			<div class=" w-50">
				<p style="font-size:26px;">건강정보</p>
				<p style="font-size:18px;">전문가가 검수해서 믿을 수 있어요<br>증상별 2,500개의 콘텐츠를 제공합니다 </p>
			</div>
		</div>
	</div>
	
	

</div>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>