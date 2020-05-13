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
	
	<div class="content-wrapper">
	<div class="back">

		<div class="goodsback">


			<h1 id="title">돌보미 등록 관리</h1>
			<hr id="gline">

			<br> <br>

			<p class="total">
				[오늘 등록된 새 글<strong>&nbsp;<c:out value="${today }"/></strong>건]
				검색결과<strong>&nbsp;<c:out value="${count }"/></strong>건
			</p>


			<div class="list-container">

			
				<div class="mListHeader">
					<div class="gleft">
						
					</div>

					<%-- <div class="gright" id="numPerPage-container">

						<form name="numPerPageFrm" id="numPerPageFrm"
							action="<%=request.getContextPath()%>/admin/InquiryList">

							<input type="hidden" name="cPage" value="<%=cPage%>"> <select
								name="numPerPage" id="numPerPage">
								<option value="30"
									<%=numPer == null || numPer.equals("30") ? "selected" : ""%>>30개씩
									보기</option>
								<option value="20"
									<%=numPer == null || numPer.equals("20") ? "selected" : ""%>>20개씩
									보기</option>
								<option value="10"
									<%=numPer == null || numPer.equals("10") ? "selected" : ""%>>10개씩
									보기</option>
							</select>

						</form>

					</div> --%>
				</div>
				<br/>

				<table class="box">
					<tr>					
						<td>번호</td>
						<td>제목</td>
						<td>답변상태</td>
						<td>삭제</td>

					</tr>

				<c:forEach items="${list }" var="c">
					<tr>						

						<td><c:out value="${c.careNo}"/></td>

						<td><a><c:out value="${c.careTitle}"/></a></td>

						<c:if test="${c.answerStatus eq 'Y' }">
						<td><button id="inquiry-btn">승인완료</button></td>
						</c:if>
					
							<c:if test="${c.answerStatus eq 'N' }">
						<td><a
							href="${path }/admin/careAnswerView?no=${c.careNo}">
								<button id="inquiry-btn">승인전</button>
						</a></td>
						</c:if>
						
						
						<td><a href="${path }/admin/CheckDelete?no=${c.careNo}">
								<button  type="submit" id="inquiry-btn">삭제</button>
						</a>
						</td>
						
					</tr>
				</c:forEach>
				
				
					
				</table>

				<div id="pageBar">
					${pageBar }
				</div>

			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>