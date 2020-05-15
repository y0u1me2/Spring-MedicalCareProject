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
<script src="http://code.jquery.com/jquery-1.7.js"	type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

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
	.healthInfo-search>div,
	.healthInfo-search>div>form {
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
		width: 70%;
		margin: 5% auto 10px auto;
		text-align: center;
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
				<div class="healthInfo-top">어떤 건강정보를 찾으시나요?</div>
				<div class="healthInfo-count">
					아프닥에는 전문의 검수를 거친 <span style="color: red;"><c:out
							value="${totalCount }" /></span>개의 컨텐츠가 있습니다.
				</div>
				<div class="healthInfo-search">
					<div class="ui-widget">
						<form id="searchForm" name="searchForm" action="${path}/healthInfo/searchHealthInfo" onsubmit="return searchProgress();">
							<button type="submit" class="search-button">
								<i class="icon-2x icon-search"></i>
							</button>
							<input type="text" placeholder="찾으시는 건강정보를 입력하세요"
								class="searchInput-healthInfo" id="searchInput-healthInfo" name="searchKeyword"/>
						</form>
					</div>
				</div>
				<div class="tagSearch-container">
					<div class="tagSearch">
						<span class=tagSerach-link></span> <span class="tagSearch-btn">
							<span id="viewBefore">&nbsp;<&nbsp;</span> <span id="viewAfter">&nbsp;>&nbsp;</span>
						</span>
					</div>
				</div>
				<div class="healthInfo-button-div"></div>
				<div class="bottom" style="margin-bottom: 50px;">
					<div class="bottom-quote d-flex justify-content-around">
						<div class="small p-2">미리알고 대비하세요</div>
					</div>
					<div class="bottom-quote d-flex justify-content-around">
						<div class="big p-2">요즘 많이 찾는 건강정보</div>
					</div>
					<div class="bottom-content"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function() {
		//건강정보 호버 색 변화
		function healthInfoMouseEvent() {
			$('.healthInfo').mouseenter(function() {
				$(this).addClass('healthInfo-selected');
			})
			$('.healthInfo').mouseleave(function() {
				$(this).removeClass('healthInfo-selected');
			})
		}

		//#태그 화살표 호버 색 변화
		$('.tagSearch>span>span').mouseenter(function() {
			$(this).addClass('healthInfo-selected').css("cursor", "pointer");
		})
		$('.tagSearch>span>span').mouseleave(function() {
			$(this).removeClass('healthInfo-selected');
		})
		//많이찾는 건강정보 스타일 변화
		function frequentInfoMouseEvent() {
			$('.bottom-InfoContent').mouseenter(function() {
				$(this).addClass('InfoContent-selected');
			})
			$('.bottom-InfoContent').mouseleave(function() {
				$(this).removeClass('InfoContent-selected');
			})
		}
		//#태그 겁색 좌우 검색어 페이징
		$.ajax({
			url : "${path}/healthInfo/healthTagInfo",
			success : function(data) {
			for (var i = 0; i < data.list.length; i++) {
				$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"
											+ data.list[i].DISESASETITLE
											+"<input type='hidden' class='disesaseNo' value='"+data.list[i].DISESASENO+"'/>"
											+ "</a>");
				$('a.tagSearch-keyword').click(function() {
					frequentInfoPicClick($(this).children('input.disesaseNo').val());
				})
			}
			var cPage = Number(data.cPage);
			var totalPage = Number(data.totalPage);

			$('#viewBefore').click(function() {
				cPage--;
				if (cPage <= 0) {
					$.ajax({
						url : "${path}/healthInfo/healthTagInfo",
						data : {cPage : totalPage},
						success : function(before1) {
							$('.tagSearch-keyword').remove();
							for (var i = 0; i < before1.list.length; i++) {
								$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"
																+ before1.list[i].DISESASETITLE
																+"<input type='hidden' class='disesaseNo' value='"+after1.list[i].DISESASENO+"'/>"
																+ "</a>");
								$('a.tagSearch-keyword').click(function() {
									frequentInfoPicClick($(this).children('input.disesaseNo').val());
								})
							}
							cPage = totalPage;
						}
					})
				} else {
					$.ajax({
						url : "${path}/healthInfo/healthTagInfo",
						data : {cPage : cPage},
						success : function(before2) {
							$('.tagSearch-keyword').remove();
							for (var i = 0; i < before2.list.length; i++) {
								$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"
																+ before2.list[i].DISESASETITLE
																+"<input type='hidden' class='disesaseNo' value='"+before2.list[i].DISESASENO+"'/>"
																+ "</a>");
								$('a.tagSearch-keyword').click(function() {
									frequentInfoPicClick($(this).children('input.disesaseNo').val());
								})
							}
						}
					})
				}
			})
			$('#viewAfter').click(function() {
				cPage++;
				if (cPage > totalPage) {
					$.ajax({
						url : "${path}/healthInfo/healthTagInfo",
						success : function(after1) {
							$('.tagSearch-keyword').remove();
							for (var i = 0; i < after1.list.length; i++) {
								$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"
																+ after1.list[i].DISESASETITLE
																+"<input type='hidden' class='disesaseNo' value='"+after1.list[i].DISESASENO+"'/>"
																+ "</a>");
								$('a.tagSearch-keyword').click(function() {
									frequentInfoPicClick($(this).children('input.disesaseNo').val());
								})
							}
							cPage = 1;
						}
					})
				} else {
					$.ajax({
						url : "${path}/healthInfo/healthTagInfo",
						data : {cPage : cPage},
						success : function(after2) {
							$('.tagSearch-keyword').remove();
							for (var i = 0; i < after2.list.length; i++) {
								$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"
																+ after2.list[i].DISESASETITLE
																+"<input type='hidden' class='disesaseNo' value='"+after2.list[i].DISESASENO+"'/>"
																+ "</a>");
								
								$('a.tagSearch-keyword').click(function() {
									frequentInfoPicClick($(this).children('input.disesaseNo').val());
								})
							}
						}
					})
				}
			})
		}
	})//#태그 겁색 좌우 검색어 페이징 끝

		//과목분류 버튼 처리
		/* $.ajax({
			url : "${path}/healthInfo/healthBtnInfo",
			success : function(data) {
				for (var i = 0; i < data.list.length; i++) {
					$('div.healthInfo-button-div').append(
							"<button class='healthInfo'>"
									+ data.list[i].MEDICALNAME + "</button>");
					healthInfoMouseEvent();
				}
			}
		})//과목분류 버튼 처리 끝 */

		//자주찾는 건강정보+${path}+data.list[i].DISESASEFILE
		$.ajax({
			url : "${path}/healthInfo/frequentInfo",
			success : function(data) {
				$('div.bottom-content').append("<div class='picContentBox'></div>");
				//========================================================여기 나중에 다시 수정할것
				for (var i = 0; i < data.list.length; i++) {
					$('.picContentBox').append("<div class='bottom-InfoContent p-6'></div>");
					var divTag = $('div.bottom-InfoContent.p-6');
					$(divTag[i]).html("<img src='${pathImages}"+data.list[i].DISESASEFILE+"'>");
					$(divTag[i]).append("<div class='bottom-InfoContent-Info'><div class='bottom-InfoContent-Info-main'>"
												+ data.list[i].DISESASETITLE
												+ "</div><div class='bottom-InfoContent-Info-sub'><p>"
												+ data.list[i].DISESASESUBTITLE
												+ "</p></div></div></div>");
					$(divTag[i]).append("<input type='hidden' class='disesaseNo' value='"+data.list[i].DISESASENO+"'/>");
					$(divTag[i]).click(function() {
						frequentInfoPicClick($(this).children('input.disesaseNo').val());
					})
				}
				frequentInfoMouseEvent();
			}
		});

		//자주찾는 건강정보 사진버튼 function화
		function frequentInfoPicClick(param) {
			location.href = "${path}/healthInfo/frequentInfoPic?disesaseNo="
					+ param;
		}
	})

	$('#searchInput-healthInfo').autocomplete({
		source: "${path}/healthInfo/searchInformation",
		minLength: 1
	});
	
	//검색 이벤트
	
	function searchProgress() {
		if($('#searchInput-healthInfo').val()=="") {
			return false;
		}else {
			return true;
		}
	}
</script>




<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />