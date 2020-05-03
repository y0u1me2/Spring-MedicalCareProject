<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet"/>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
<style>
	#content {
		width:1366px;
		margin:0 auto;
	}
	.healthInfo {
		width: 80px;
		height: 40px;
		font-size: 13px;
		box-sizing: content-box;
		color: black;
		border: 1px solid rgba(44, 55, 68, 0.1);
		margin: 5px auto;
		background-color:#FBFCFD;
	}
	
	.healthInfo-button-div {
		width: 690px;
		margin: 5% auto 10% auto;
	}
	
	.healthInfo-selected {
		background-color:#DAF1DE;;
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
	.healthInfo-search>div {
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
		margin: 20px auto 10px auto;
	}
	.bottom-InfoContent {
		padding: 0 !important;
		margin: 10px;		
	}
	.bottom-InfoContent-Info {
		border: 1px solid gray;
		padding: 20px 10px 10px 10px;
		overflow: hidden;
	}
	.bottom-InfoContent-Info-main {
		font-weight: bolder;
	}
	.bottom-InfoContent-Info-sub {
		margin-top: 10px;
		font-size: 10px;
		color: gray;
	}
	.InfoContent-selected {
		cursor: pointer;
  		box-shadow: 4px 4px 3px #888888;
	}
</style>

<section id="content">
	<div class="container-fluid">
		<div class="row">
		</div>
		<div class="row middle">
			<div class="col">
				<div class="healthInfo-top">
					어떤 건강정보를 찾으시나요?
				</div>
					<div class="healthInfo-count">
						아프닥에는 전문의 검수를 거친 2,506개의 컨텐츠가 있습니다.
					</div>
				<div class="healthInfo-search">
					<div>
						<button type="button" class="search-button"><i class="icon-2x icon-search"></i></button>
						<input type="text" placeholder="찾으시는 건강정보를 입력하세요" class="searchInput-healthInfo"/>
					</div>
				</div>
				<div class="tagSearch-container">
					<div class="tagSearch">
						<span class=tagSerach-link>
							<!-- <a class="tagSearch-keyword" href="#">#수족구병</a>
							<a class="tagSearch-keyword" href="#">#설사</a>
							<a class="tagSearch-keyword" href="#">#편도염</a>
							<a class="tagSearch-keyword" href="#">#구내염</a>
							<a class="tagSearch-keyword" href="#">#여드름</a>
							<a class="tagSearch-keyword" href="#">#주름</a>
							<a class="tagSearch-keyword" href="#">#두드러기</a> -->
						</span>
						<span class="tagSearch-btn">
							<span id="viewBefore">&nbsp;<&nbsp;</span>
							<span id="viewAfter">&nbsp;>&nbsp;</span>
						</span>
					</div>
				</div>
				<div class="healthInfo-button-div">					
						<button class="healthInfo">피부미용</button>
						<button class="healthInfo">성형</button>
						<button class="healthInfo">치과</button>
						<button class="healthInfo">안과</button>
						<button class="healthInfo">한의원</button>
						<button class="healthInfo">출산</button>
						<button class="healthInfo">소아질환</button>
						<button class="healthInfo">육아</button>
						<button class="healthInfo">건강정보</button>
						<button class="healthInfo">피부질환</button>
						<button class="healthInfo">산부인과</button>
						<button class="healthInfo">비뇨기과</button>
						<button class="healthInfo">성병</button>
						<button class="healthInfo">내과</button>
						<button class="healthInfo">이비인후과</button>
						<button class="healthInfo">성인병</button>
						<button class="healthInfo">정신과</button>
						<button class="healthInfo">정형외과</button>
						<button class="healthInfo">신경외과</button>
						<button class="healthInfo">외과</button>
						<button class="healthInfo">코로나진료소</button>
				</div>
				<div class="bottom">
					<div class="bottom-quote d-flex justify-content-around">
						<div class="small p-2">미리알고 대비하세요</div>
					</div>
					<div class="bottom-quote d-flex justify-content-around">
						<div class="big p-2">요즘 많이 찾는 건강정보</div>							
					</div>
					<div class="bottom-content">
						<div class="d-flex justify-content-between">
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-between">
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
							<div class="bottom-InfoContent p-6">
								<img src="http://image.sayup.co.kr/contents/56987275b866070300416c10/d64122369f8bf3d0d2a1880812cf70c7.jpg"/>
								<div class="bottom-InfoContent-Info">
									<div class="bottom-InfoContent-Info-main">
										감기
									</div>
									<div class="bottom-InfoContent-Info-sub">
										남녀노소 누구나 걸릴 수 있다!
									</div>
								</div>
							</div>
																
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="col-3" style="border:1px solid black;">
				<div id="realSearchList" style="width:450px; height:310px;">
					<h2>실검 Top10</h2>
					<ol>
					</ol>
				</div>
			</div> -->
		</div>
				
		<div class="row bottom">			
			<div class="col bg-success">1 of 2</div>
			<div class="col bg-warning">2 of 2</div>
		</div>
		<div class="d-flex justify-content-around bg-secondary mb-3">
		    <div class="p-2 bg-info">Flex item 1</div>
		</div>
		<div class="row">
			<div class="col bg-success">
			</div>
			<div class="col bg-warning">
			</div>
		</div>
	</div>
</section>
<script>

	$(function() {
		
		//건강정보 호버 색 변화
		$('.healthInfo').mouseenter(function() {
			$(this).addClass('healthInfo-selected');
		})
		$('.healthInfo').mouseleave(function() {
			$(this).removeClass('healthInfo-selected');
		})
		//#태그 화살표 호버 색 변화
		$('.tagSearch>span>span').mouseenter(function() {
			$(this).addClass('healthInfo-selected').css("cursor","pointer");
		})
		$('.tagSearch>span>span').mouseleave(function() {
			$(this).removeClass('healthInfo-selected');
		})
		//많이찾는 건강정보 스타일 변화
		$('.bottom-InfoContent').mouseenter(function() {
			$(this).addClass('InfoContent-selected');
		})
		$('.bottom-InfoContent').mouseleave(function() {
			$(this).removeClass('InfoContent-selected');
		})
		//#태그 겁색 좌우 검색어 페이징
		$.ajax({
			url:"${path}/healthInfo/healthTagInfo",
			success:function(data) {
				for(var i=0; i<data.list.length; i++) {
					$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"+data.list[i].NAME+"</a>");
				}
				
				$('#viewBefore').click(function(){
					console.log(data.cPage-1);
					if(data.cPage=='1') {
						$.ajax({
							url:"${path}/healthInfo/healthTagInfo",
							data:{cPage: data.totalPage},
							success:function(before1) {
								$('span.tagSerach-link').remove('.tagSearch-keyword');
								for(var i=0; i<before1.list.length; i++) {
									$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"+before1.list[i].NAME+"</a>");
								}
							}
						})
					}else {
						$.ajax({
							url:"${path}/healthInfo/healthTagInfo",
							data:{cPage: data.cPage-1},
							success:function(before2) {
								for(var i=0; i<before2.list.length; i++) {
									$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"+before2.list[i].NAME+"</a>");
								}
							}
						})
					}
				})
				$('#viewAfter').click(function(){
					if(data.cPage==data.totalPage) {
						$.ajax({
							url:"${path}/healthInfo/healthTagInfo",
							data:{cPage: 1},
							success:function(after1) {
								for(var i=0; i<after1.list.length; i++) {
									$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"+after1.list[i].NAME+"</a>");
								}
							}
						})
					}else {
						$.ajax({
							url:"${path}/healthInfo/healthTagInfo",
							data:{cPage: data.cPage+1},
							success:function(after2) {
								for(var i=0; i<after2.list.length; i++) {
									$('span.tagSerach-link').append("<a class='tagSearch-keyword' href='#'> #"+after2.list[i].NAME+"</a>");
								}
							}
						})
					}
				})
				
				
			}
		})		
	})
</script>



<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />