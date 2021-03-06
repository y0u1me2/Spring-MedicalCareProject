<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="pathImages"
	value="${pageContext.request.contextPath}/resources/images" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css"
	rel="stylesheet" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet" />

<!-- 검색 자동완성 -->
<script src="http://code.jquery.com/jquery-1.7.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<style>
#content-healthInfo {
	width: 1366px;
	margin: 0 auto;
}

.healthInfo {
	width: 80px;
	height: 40px;
	font-size: 13px;
	box-sizing: content-box;
	color: black;
	border: 1px solid rgba(44, 55, 68, 0.1);
	margin: 5px 2px;
	background-color: #FBFCFD;
}

.healthInfo-button-div {
	width: 690px;
	margin: 5% auto;
}

.healthInfo-selected {
	background-color: #DAF1DE;
}

.healthInfo-top {
	margin: 60px 0 26px;
	text-align: center;
	font-size: 42px;
}

.healthInfo-count {
	margin: 0 0 44px;
	text-align: center;
	font-size: 16px;
}

.healthInfo-search {
	width: 60%;
	height: 60px;
	padding: 1px;
	margin: 0 auto;
	border: 1px solid;
	border-radius: 30px;
}

.healthInfo-search>div, .healthInfo-search>div>form {
	width: 100%;
	height: 100%;
	display: inline-flex;
}

.searchInput-healthInfo {
	box-sizing: border-box !important;
	width: 90%;
	height: 100% !important;
	margin: 0 10px 0 0 !important;
	border: none !important;
}

.search-button {
	height: 100%;
	background-color: transparent;
	border: none;
}

.search-button:focus {
	outline: none;
}

.tagSearch-container {
	width: 100%;
}

.tagSearch {
	margin: 3% auto;
	width: 50%;
	display: flex;
	justify-content: space-between;
}

.tagSearch-keyword {
	margin-right: 7px;
	font-size: 13px;
}

.tagSearch>span.tagSearch-btn span {
	font-size: 13px;
	border: 0.5px solid;
}

.bottom-quote>.small {
	color: gray;
}

.bottom-quote>.big {
	font-size: 26px;
	font-weight: bolder;
}

.bottom-content {
	width: 61%;
	margin: 5% auto 10px auto;
}

.picContentBox {
	/* display: inline-flex; */
	width: 100%;
}

.bottom-InfoContent {
	padding: 0 !important;
	margin: 10px;
	width: 250px;
	display: inline-block;
	text-align: left;
}

.bottom-InfoContent-Info {
	padding: 20px 10px 10px 10px;
}

.bottom-InfoContent-Info-main {
	font-weight: bolder;
	font-size: 16px;
}

.bottom-InfoContent-Info-sub {
	margin-top: 10px;
	color: gray;
	width: 200px;
}

.bottom-InfoContent-Info-sub p {
	font-size: 12px;
	color: rgb(128, 135, 143);
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.InfoContent-selected {
	cursor: pointer;
	box-shadow: 4px 4px 3px #888888;
}
</style>

<section id="content-healthInfo">
	<div class="container-fluid">
		<div class="row"></div>
		<div class="row middle">
			<div class="col">
				<div class="healthInfo-search">
					<div class="ui-widget">
						<form id="searchForm" name="searchForm"
							action="${path}/healthInfo/searchHealthInfo"
							onsubmit="return searchProgress();">
							<button type="submit" class="search-button">
								<i class="icon-2x icon-search"></i>
							</button>
							<input type="text" placeholder="찾으시는 건강정보를 입력하세요"
								class="searchInput-healthInfo" id="searchInput-healthInfo"
								name="searchKeyword" />
						</form>
					</div>
				</div>

				<div class="bottom" style="margin-bottom: 50px;">
					<div class="bottom-content">
						<div class='picContentBox'>
							<c:forEach items="${healthInfoList }" var="healthInfoList">
								<div class="bottom-InfoContent p-6">
									<img style='width:250px; height:188px;' src='${pathImages}${healthInfoList.HEALTHINFOMAINPIC }'>
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>
											${healthInfoList.HEALTHINFOTITLE }
										</div>
										<div class='bottom-InfoContent-Info-sub'>
											<p>${healthInfoList.HEALTHINFOSUBTITLE }</p>
										</div>
										<input type='hidden' class='healthInfoNo' value='${healthInfoList.HEALTHINFONO }'/>
										<input type='hidden' class='disesaseNo' value='${healthInfoList.DISESASENO }'/>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function() {

		//많이찾는 건강정보 스타일 변화
		$('.bottom-InfoContent').mouseenter(function() {
			$(this).addClass('InfoContent-selected');
			$(this).click(function() {
				frequentInfoPicClick($(this).children('div.bottom-InfoContent-Info').children('input.healthInfoNo').val(),
										$(this).children('div.bottom-InfoContent-Info').children('input.disesaseNo').val());
			})
		})
		$('.bottom-InfoContent').mouseleave(function() {
			$(this).removeClass('InfoContent-selected');
		})

		//자주찾는 건강정보 사진버튼 function화
		function frequentInfoPicClick(healthInfoNo, disesaseNo) {
			location.href="${path}/healthInfo/subFrequentInfoPic?healthInfoNo="+healthInfoNo+"&disesaseNo="+disesaseNo;
		}
		
		/* //자주찾는 건강정보 사진버튼 function화
		function frequentInfoPicClick(param) {
			location.href = "${path}/healthInfo/frequentInfoPic?disesaseNo="
					+ param;
		} */
		
		$('#searchInput-healthInfo').autocomplete({
			source : "${path}/healthInfo/searchInformation",
			minLength : 1
		});
	
		//검색 이벤트	
		function searchProgress() {
			if ($('#searchInput-healthInfo').val() == "") {
				return false;
			} else {
				return true;
			}
		}
		
	})

</script>




<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />