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
			<h1 class="text-themecolor m-b-0 m-t-0" style="width:100%; text-align:center;">병원 정보 수정</h1>
		</div>
		<form action="${path }/admin/hospitalModifyEnd" method="post" onsubmit="return validate();">
		<div class="row">
			<input type="hidden" name="hospNo" value="${h.hospNo }">
			<table class="box w-75 mx-auto">
				<tr>
					<th>병원이름</th>
					<td><input class="w-100 form-control" type="text" name="hospName" value="${h.hospName }" ></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input class="w-100 form-control" type="text" name="hospAddr" value="${h.hospAddr }"></td>
				</tr>
				
				<tr>
					<th>대표전화</th>
					<td><input class="w-100 form-control" type="tel" name="hospTel" value="${h.hospTel }"></td>
				</tr>
				
				<tr>
					<th>찾아오시는길</th>
					<td><input class="w-100 form-control" type="text" name="hospDirections" value="${h.hospDirections }"></td>
				</tr>
			
				<tr>
					<th>진료과목</th>
					<td><input class="w-100 form-control" type="text" name="medicalDepartment" value="${h.medicalDepartment }"></td>
				</tr>
				
				<tr>
					<th>진료시간</th>
					<td>
						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">월요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour1" value="${h.officeHour1 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">화요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour2" value="${h.officeHour2 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">수요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour3" value="${h.officeHour3 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">목요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour4" value="${h.officeHour4 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">금요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour5" value="${h.officeHour5 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">토요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour6" value="${h.officeHour6 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">일요일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour7" value="${h.officeHour7 }">
  						</div>
  						
  						<div class="input-group">
    						<div class="input-group-prepend">
      							<span class="input-group-text mr-3">공휴일</span>
    						</div>
    						<input class="form-control" type="text" name="officeHour8" value="${h.officeHour8 }">
  						</div>
  						
  						
					
						<%-- 화요일 : <input  type="text" name="officeHour2" value="${h.officeHour2 }"><br>
						수요일 : <input  type="text" name="officeHour3" value="${h.officeHour3 }"><br>
						목요일 : <input  type="text" name="officeHour4" value="${h.officeHour4 }"><br>
						금요일 : <input  type="text" name="officeHour5" value="${h.officeHour5 }"><br>
						토요일 : <input  type="text" name="officeHour6" value="${h.officeHour6 }"><br>
						일요일 : <input  type="text" name="officeHour7" value="${h.officeHour7 }"><br>
						공휴일 : <input type="text" name="officeHour8" value="${h.officeHour8 }"> --%>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="row my-3">
			<div class="mx-auto">
				<button class="btn_white">수정하기</button>
				<button class="btn_white" type="button" onclick="location.href='${path}/admin/hospitalList'">취소</button>
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