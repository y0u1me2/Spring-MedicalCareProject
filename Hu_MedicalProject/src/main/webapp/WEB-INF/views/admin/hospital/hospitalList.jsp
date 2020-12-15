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
			<h1 class="text-themecolor m-b-0 m-t-0" style="width:100%; text-align:center;">병원 회원 리스트</h1>
		</div>
		
		<div class="row my-5">
			<table class="box" style="width:100%;">
					<tr>					
						<td>번호</td>
						<td>회원 아이디</td>
						<td>병원명</td>
						<td>담당자 이름</td>
						<td>담당자 이메일</td>
						<td>담당자 연락처</td>
						<td>가입일자</td>
						<td>가입승인여부</td>
					</tr>

				<c:forEach items="${list }" var="m">
					<tr>						
						<td><c:out value="${m.no}"/></td>
						<td><c:out value="${m.id}"/></td>
						<td><a href="${path }/admin/hospitalDetail?hospNo=${m.hospNo}"><c:out value="${m.hospName}"/></a></td>
						<td><c:out value="${m.managerName}"/></td>
						<td><c:out value="${m.managerEmail}"/></td>
						<td><c:out value="${m.managerPhone}"/></td>
						<td><fmt:formatDate value="${m.enrollDate}" type="date" pattern="yyyy/MM/dd"/></td>
						<td>
							<c:if test="${m.status eq 'Y'}">
								승인 완료
							</c:if>
							<c:if test="${m.status eq 'N'}">
								<button class="btn_white" type="button" onclick="approval(${m.no})" id="inquiry-btn">가입 승인</button>
							</c:if>
						</td>
						
					</tr>
				</c:forEach>
				
				
					
				</table>
		</div>
		
		<div class="container">
			${pageBar }
		</div>
	</div>
	
<script>
function approval(no){
	if(confirm("회원가입을 승인하시겠습니까?")){
		location.replace("${path}/admin/hospitalApproval?no="+no);
		
	}
}
</script>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>