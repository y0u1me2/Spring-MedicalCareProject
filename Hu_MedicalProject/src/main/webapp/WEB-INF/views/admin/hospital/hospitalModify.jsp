<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>


* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* 섹션안 공간  */
div.back {
	position: relative;
	left: 370px;
	top: 50px;
	margin-bottom:25px;
}

/* content 공간 */
div.goodsback {
	width: 80%;
}

/* 전체 1:1상담 목록 텍스트 */
h1#title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

/* 제목밑에 선 */
hr#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}
/* content 위치 */
div.list-container {
	position: relative;
	top: 10px;
}

/* 테이블 선 색상 */
div.box>th, tr, td {
	border: 1px solid #e2e0e0;
	border-right: 1px solid #e2e0e0;
	padding: 7px;
}

tr:first-of-type {
	color: #80878d;
	text-align: center;
	vertical-align: middle;
	font-weight: normal;
	font-size: 15px;
	background-color:  rgb(228, 235, 246);
	padding: 9px 10px 7px;
}

/* 테이블 스타일 */
table.box {
	width: 80%;
	text-align: center;
	border: 1px solid #e2e0e0;
	border-collapse: collapse;
}

/* 문의내용이 존재하지 않습니다. */
td#conbox {
	text-align: center;
	height: 300px;
	font-size: 15px;
	position: relative;
	width: 100%;
}

/* 페이지바 위치 */
div#pageBar {
	position: relative;
	top: 20px;
}

/* 페이지바 a태그  */
div#pageBar a {
	text-decoration: none;
	color: rgb(95, 93, 93);
}

/* 답변상태 버튼 */
#inquiry-btn {
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

#inquiry-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

/* 리스트상자  */
.mListHeader {
	padding: 7px 15px;
	padding-bottom: 10px;
	border: 1px solid #bcbfc4;
	line-height: 21px;
	text-align: center;
	background: rgb(190, 209, 245);
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
	width: 80%;
	height: 50px;
	top: 23px;
}

/* 삭제 버튼위치 */
.gleft {
	position: relative;
	right: 330px;
	top: 2px;
}

#numPerPage {
	position: relative;
	left: 370px;
	top: -25px;
}

/* 삭제  버튼 스타일 */
.btn_Wihte {
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
}

/* 검색결과 스타일 */
.total {
	font-size: 15px;
	font-family: "Nanum Gothic";
	color: rgb(49, 49, 49);
	margin: 2px 8px 0px 0px;
}

.total>strong {
	color:  rgb(76, 231, 231);
}

#pageBar {
	width: 80%;
	margin: 40px 0 40px 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #eee;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}
</style>
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	
	
	<div class="container-fluid">
	
	
		<div class="row my-3">
			<h1 class="text-themecolor m-b-0 m-t-0" style="width:100%; text-align:center;">병원 정보 수정</h1>
		</div>
		<form action="${path }/admin/hospitalModifyEnd" method="post" onsubmit="return validate();">
		<div class="row">
			<input type="hidden" name="hospNo" value="${h.hospNo }">
			<table class="w-50 mx-auto">
				<tr>
					<th>병원이름</th>
					<td><input class="w-100" type="text" name="hospName" value="${h.hospName }" ></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input class="w-100" type="text" name="hospAddr" value="${h.hospAddr }"></td>
				</tr>
				
				<tr>
					<th>대표전화</th>
					<td><input class="w-100" type="tel" name="hospTel" value="${h.hospTel }"></td>
				</tr>
				
				<tr>
					<th>찾아오시는길</th>
					<td><input class="w-100" type="text" name="hospDirections" value="${h.hospDirections }"></td>
				</tr>
			
				<tr>
					<th>진료과목</th>
					<td><input class="w-100" type="text" name="medicalDepartment" value="${h.medicalDepartment }"></td>
				</tr>
				
				<tr>
					<th>진료시간</th>
					<td>월요일 : <input type="text" name="officeHour1" value="${h.officeHour1 }"><br>
						화요일 : <input type="text" name="officeHour2" value="${h.officeHour2 }"><br>
						수요일 : <input type="text" name="officeHour3" value="${h.officeHour3 }"><br>
						목요일 : <input type="text" name="officeHour4" value="${h.officeHour4 }"><br>
						금요일 : <input type="text" name="officeHour5" value="${h.officeHour5 }"><br>
						토요일 : <input type="text" name="officeHour6" value="${h.officeHour6 }"><br>
						일요일 : <input type="text" name="officeHour7" value="${h.officeHour7 }"><br>
						공휴일 : <input type="text" name="officeHour8" value="${h.officeHour8 }"><br>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="row my-3">
			<div class="mx-auto">
				<button>수정하기</button>
				<button type="button" onclick="location.href='${path}/admin/hospitalList'">취소</button>
			</div>
		</div>
		</form>
	</div>
	
	
	<script>
		function validate(){
			if(confirm('수정하시겠습니까?')){
				return true;				
			}else{
				return false;
			}
		}
	
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>