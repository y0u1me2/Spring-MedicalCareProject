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

	<div class="w-100 border" style="height:900px; background-color:white;">
		<div class="w-50 border mx-auto d-flex flex-wrap">
			<div class="border w-50" >
				<p style="font-size:26px;">병원 예약 / 접수</p>
				<p style="font-size:18px;">병원 방문 후 기다림은 끝<br>모바일 예약과 접수 후, 시간에 맞춰 방문하세요</p>
			</div>
			
			
			<div class="border w-50" >
				<p style="font-size:26px;">진료 대기현황판</p>
				<p style="font-size:18px;">어느 곳에서도 편하게 진료 순번을 확인하세요<br>실시간으로 진료 차례를 안내해줍니다</p>
			</div>
			
			<div class="border w-50">
				<p style="font-size:26px;">영유아검진</p>
				<p style="font-size:18px;">어렵고 복잡했던 문진표 작성이 편해집니다<br>모바일로 손쉽게 작성하고 보관하세요</p>
			</div>
			
			
			<div class="border w-50">
				<p style="font-size:26px;">건강피드</p>
				<p style="font-size:18px;">자녀의 성장(키&몸무게), 체온, 해열제 복용 등을 등록하고, 관리할 수 있어요! 등록한 정보들은 소아 진료 시 참고할 수 있게 제공됩니다</p>
			</div>
			
			
			<div class="border w-50">
				<p style="font-size:26px;">모바일 처방전</p>
				<p style="font-size:18px;">처방 받은 약의 성분, 효능을 한 눈에 확인!<br>복약시기도 놓치지 않게 알람으로 알려드려요</p>
			</div>
			
			
			
			<div class="border w-50">
				<p style="font-size:26px;">병원 / 약국 찾기</p>
				<p style="font-size:18px;">일일이 전화하지 않아도 됩니다<br>병원 / 약국 위치, 영업시간 정보 등을 알려드립니다</p>
			</div>
			
			<div class="border w-50">
				<p style="font-size:26px;">건강정보</p>
				<p style="font-size:18px;">전문가가 검수해서 믿을 수 있어요<br>증상별 2,500개의 콘텐츠를 제공합니다 </p>
			</div>
		</div>
	</div>
	
	

</div>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>