<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>


/* 테이블 선 색상 */
div.box>th, tr, td {
	border: 1px solid #e2e0e0;
	border-right: 1px solid #e2e0e0;
	padding: 7px;
}



/* 테이블 스타일 */
table.box {
	width: 80%;
	border: 1px solid #e2e0e0;
	border-collapse: collapse;
}


.btn_white {
	position: relative;
	height: 30px;
	width: 80px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

.btn_white:hover {
	background: rgb(251, 251, 249);
	outline: none;
}
</style>
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	
	
	<div class="container-fluid">
	
	
		<div class="row my-3">
			<h1 class="text-themecolor m-b-0 m-t-0" style="width:100%; text-align:center;">병원 정보</h1>
		</div>
		
		<div class="row">
			<table class="box w-75 mx-auto">
				<tr>
					<th>병원이름</th>
					<td>${h.hospName }</td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td>${h.hospAddr }</td>
				</tr>
				
				<tr>
					<th>대표전화</th>
					<td>${h.hospTel }</td>
				</tr>
				
				<tr>
					<th>찾아오시는길</th>
					<td>${h.hospDirections }</td>
				</tr>
			
				<tr>
					<th>진료과목</th>
					<td>${h.medicalDepartment }</td>
				</tr>
				
				<tr>
					<th>진료시간</th>
					<td>월요일 : ${h.officeHour1 }<br>
						화요일 : ${h.officeHour2 }<br>
						수요일 : ${h.officeHour3 }<br>
						목요일 : ${h.officeHour4 }<br>
						금요일 : ${h.officeHour5 }<br>
						토요일 : ${h.officeHour6 }<br>
						일요일 : ${h.officeHour7 }<br>
						공휴일 : ${h.officeHour8 }<br>
						
					</td>
				</tr>
			</table>
		</div>
		
		<div class="row my-3">
			<div class="mx-auto">
				<button class="btn_white" onclick="location.href='${path}/admin/hospitalModify?hospNo=${h.hospNo }'">수정하기</button>
				<button class="btn_white" onclick="history.back();">목록으로</button>
			</div>
		</div>
	</div>
	

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>