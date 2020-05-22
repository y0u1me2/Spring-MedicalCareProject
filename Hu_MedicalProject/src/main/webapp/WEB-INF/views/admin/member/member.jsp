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


</style>
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	
	
	<div class="container-fluid">	
	 <div class="row my-3">
         <h1 class="text-themecolor m-b-0 m-t-0" style="width:100%; text-align:center;">일반 회원 관리</h1>
	 </div>		
			<hr id="gline">

			<br> <br>

			<p class="total">
				총 회원 수<strong>&nbsp;<c:out value="${count }"/></strong> 명 
			</p>

			<div class="row my-5">
        	 <table class="box" style="width:100%;">
             		<tr>              					
						<td>번호</td>
						<td>회원 아이디</td>
						<td>회원명</td>
						<td>전화번호</td>
						<td>가입날짜</td>
						<td>탈퇴</td>

					</tr>

				<c:forEach items="${list }" var="person">
					<tr>						

						<td><c:out value="${person.memberNo}"/><input type="hidden" id="personNO" name="personNO" value="${person.memberNo}"/></td>
						<td><c:out value="${person.email}"/></td>
						<td><c:out value="${person.name}"/></td>
						<td><c:out value="${person.phone}"/></td>
						<td><fmt:formatDate value="${person.enrollDate}" type="date" pattern="yyyy/MM/dd"/></td>
						<td>
							<button type="button" onclick="personDelChk()" id="inquiry-btn">회원 탈퇴</button>
						</td>
						
					</tr>
				</c:forEach>
				
				
					
				</table>
			</div>
				
				<div id="pageBar">
					${pageBar }
				</div>

			</div>
<script>
function personDelChk(){
	
	if(confirm("회원을 탈퇴시키겠습니까?")){
		location.replace("${path }/admin/personDelete?personNO="+$('#personNO').val());
		
	}
}
</script>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>