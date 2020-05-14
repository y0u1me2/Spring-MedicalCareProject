<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="pathImages" value="${pageContext.request.contextPath}/resources/images" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet"/>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
<style>
	#healthInfo-content {
		width:1366px;
		padding:0;
		margin:auto;
	}
	.healthInfo-content-header {
    	align-items: center;
    	letter-spacing: 1px;
    	padding: 80px 0px 40px;
	}
	.bottom-InfoContent-Info-main {
		margin-bottom: 8px;
    	font-size: 40px;
    	font-weight: bolder;
    	line-height: 1.5;
   		color: rgb(44, 55, 68);		
	}
	.bottom-InfoContent-Info-sub p {
		font-size: 18px;
   		color: rgb(128, 135, 143);
   		text-overflow: ellipsis;
    	white-space: nowrap;
    	overflow: hidden;
	}
	.healthInfo-content-body {
		padding: 40px 0 100px;
	}
	.healthInfo-content-table {
		display: flex;
		justify-content: space-between;
	    margin-top: -7px;
	}
	/* 좌측 콘텐츠 */
	.healthInfo-content-table-left {
		margin-right: 10px;
		flex-grow: 1;
	}
	/* 좌측 검수자 파트 */
	.healthInfo-content-comfirmer {
		padding: 30px 0px 30px 24px;
		margin-bottom: -1px;
		border: 1px solid;
		color: rgb(128, 135, 143, 0.5);
		display: flex;
	}
	.confirmer-pic {
		width: 80px;
	    height: 80px;
	    border-radius: 42px;
	    overflow: hidden;
    }
	.confirmer-info {
		margin-left: 16px;
	}
	.confirmer-info>h3 {
		margin-bottom: 16px;
	    font-size: 18px;
	    font-weight: bold;
	    letter-spacing: 1px;
	    line-height: 1;
   		color: rgb(44, 55, 68);
	}
	.confirmer-info>p {
		font-size: 16px;
		line-height: 1;
    	color: rgb(44, 55, 68);
	}
	.confirmer-info>p>small {
		display: block;
	    margin-top: 12px;
	    font-size: 14px;
	    color: rgb(128, 135, 143);
	}
	/* 좌측 콘텐츠 사진들 */	
	.healthInfo-content-pics {
		border: 1px solid;
		color: rgb(128, 135, 143, 0.5);
		
	}
	.healthInfo-content-pic {
		width: 490px;
		background: rgb(51, 51, 51);
	}
	.healthInfo-content-pic>img {
		width: 100%;
    	display: inline-block;
	}
	/* 우측 스텝 콘텐츠 */
	.healthInfo-content-table-right {
		width: 325px;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(229, 229, 229);
	    border-image: initial;
	}
	.healthInfo-step-contents {
		display: flex;
	    min-height: 90px;
	    border-bottom: 1px solid rgb(229, 229, 229);
	}
	.healthInfo-step-contents h5 {
		flex-grow: 1;
	    font-size: 14px;
	    color: rgb(44, 55, 68);
	    padding: 23px 0px 20px 16px;
	}
	.healthInfo-step-contents h5 strong {
		display: block;
	    margin-top: 6px;
	    font-weight: bold;
	}
	.healthInfo-step-title-right {
		flex-shrink: 1;
	    text-align: right;
	    font-size: 12px;
	    color: rgb(128, 135, 143);
	    padding: 23px 16px 20px 0px;
	    margin: 10px 0;
	}
	.healthInfo-step-button-div {
		min-width: 85px;
	    margin-top: 8px;
	}
	.healthInfo-step-btn {
		position: relative;
	    width: 32px;
	    height: 32px;
		border-width: 1px;
	    border-style: solid;
	    border-color: rgba(44, 55, 68, 0.1);
	    border-image: initial;
	    transition: background-color 0.2s ease 0s;
	}
	.healthInfo-step-btn-selected {
  		background-color:#DAF1DE;
	}
	
	.healthInfo-step-contents-bottom {
		max-height: 704px;
	    overflow-y: auto;
	    padding: 0px 16px;
	}
	.healthInfo-miniMode {
		padding: 16px 0px;
    	border-width: 0px 0px 1px;
    	display: block;
	    border-style: solid;
	    border-color: rgb(229, 229, 229);
	    border-image: initial;
	}
	.healthInfo-miniMode-selected {
		cursor: pointer;
	}
	.healthInfo-miniFigure {
		display: inline-flex;
		margin: 0;
	}
	.miniFigure-div {
		margin-right: 16px;
	}
	.miniFigure-div-img {
		width: 80px;
    	height: 60px;
    	display: block;
	}
	.healthInfo-miniFigureCaption {
		overflow: hidden;
		white-space: nowrap;		
	    text-overflow: ellipsis; 
	}
	.healthInfo-miniFigureCaption>h6 {
		margin-bottom: 0.2em;
	    font-size: 14px;
	    letter-spacing: 2px;
	    display: block;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    font-weight: bold;
	    line-height: 1.4;
	    overflow: hidden;
	}
	.healthInfo-miniFigureCaption>p {
		font-size: 12px;
		width: 175px;
	    margin-bottom: 0.45em;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    line-height: 1.71;
	    letter-spacing: 0.5px;
	    color: rgb(128, 135, 143);
	    overflow: hidden;   
	}
	
</style>

<section id="healthInfo-content">
	<div class="healthInfo-content-header">
		<div class='bottom-InfoContent-Info-main'>${hi.healthInfoTitle }</div>
		<div class='bottom-InfoContent-Info-sub'><p>${hi.healthInfoSubTitle }</p></div>
	</div>
	<div class="healthInfo-content-body">
		<div class="healthInfo-content-table">
			<div class="healthInfo-content-table-left">
				<div class="healthInfo-content-comfirmer">
					<div class="confirmer-pic">
						<!-- 검수자 이미지 있을때 없을때 분기 -->
						<c:if test="${fn:length(list) != 0 }"></c:if>
					</div>
					<div class="confirmer-info">
						<h3>전문가 검수</h3>
						<p>연세아이웰소아청소년과의원 기교륭 원장
							<small>신촌 세브란스 병원 소아청소년과 전공의 / 대한 소와과학회 평생회원</small>
						</p>
					</div>
				</div>
				<div class="healthInfo-content-pics">
				<c:forEach var="healthInfoContentPic" items="${hi.healthInfoContentPic }" >
					<figure class="healthInfo-content-pic">
						<img src="${pathImages}${healthInfoContentPic }"><br/>
					</figure>
				</c:forEach>				
				</div>
			</div>
			<div class="healthInfo-content-table-right">
				<div class="healthInfo-step-contents">
					<h5>
						<!-- <strong></strong> -->
					</h5>
					<input type="hidden" id="infoStep"/>
					<div class="healthInfo-step-title-right">
						1/3
						<div class="healthInfo-step-button-div">
							<button class="healthInfo-step-btn" name="btn-left"><</button>
							<button class="healthInfo-step-btn" name="btn-right">></button>
						</div>
					</div>
				</div>
				<div class="healthInfo-step-contents-bottom">
					<div class="miniMode">
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
//스텝 변경 화살표
$('.healthInfo-step-btn').mouseenter(function() {
	$(this).addClass('healthInfo-step-btn-selected');
})
$('.healthInfo-step-btn').mouseleave(function() {
	$(this).removeClass('healthInfo-step-btn-selected');
})
function alinkClick() {
	//하단 콘텐츠 a링크
	$('.healthInfo-miniMode').mouseenter(function() {
		$(this).addClass('healthInfo-miniMode-selected');
	})
	$('.healthInfo-miniMode').mouseleave(function() {
		$(this).removeClass('healthInfo-miniMode-selected');
	})	
}


	$.ajax({
		url:"${path}/healthInfo/healthInfoMiniMode.do",
		data:{"healthInfoStep":"STEP_1"},
		success:function(data) {
			$('#infoStep').val("STEP_1");
			for(var i=0;i<data.list.length;i++) {
				$('div.healthInfo-step-contents>h5').html(data.list[i].healthInfoStep+"<strong>"+data.list[i].healthInfoStepTitle+"</strong>");
				//$('div.healthInfo-step-contents>h5>strong').append('');
				$('.miniMode').append("<a class='healthInfo-miniMode'>"
											+"<figure class='healthInfo-miniFigure'>"
											+"<div class='miniFigure-div'>"
												+"<img src='${pathImages}"+data.list[i].healthInfoMainPic+"' class='miniFigure-div-img'>"
											+"</div>"
											+"<div class='healthInfo-miniFigureCaption'>"
												+"<h6>"+data.list[i].healthInfoTitle+"</h6>"
												+"<p>"+data.list[i].healthInfoSubTitle+"</p>"
											+"</div>"
										+"</figure>"
									+"</a>");	
			}
			alinkClick();
			//화살표 클릭
			var i=1;
			$('.healthInfo-step-btn').click(function() {
				if($(this).attr('name')=='btn-left') {
					i-=1;
					if(i<1) {
						$('#infoStep').val("STEP_3");
						i=3;
						miniModeAjax($('#infoStep').val());
					}else {
						console.log("1보다 큼");
						$('#infoStep').val("STEP_"+i);
						miniModeAjax($('#infoStep').val());
					}
				}else {
					i+=1;
					if(i>3) {
						$('#infoStep').val("STEP_1");
						i=1;
						miniModeAjax($('#infoStep').val());
					}else {
						$('#infoStep').val("STEP_"+i);
						miniModeAjax($('#infoStep').val());
					} 				
				}
			})
		}
	});
	
	function miniModeAjax(infoStep) {
		$.ajax({
			url:"${path}/healthInfo/healthInfoMiniMode.do",
			data:{"healthInfoStep":infoStep},
			success:function(data) {
				$('div.healthInfo-step-contents>h5').html("");
				$('.miniMode').html("");
				for(var i=0;i<data.list.length;i++) {
					$('div.healthInfo-step-contents>h5').html(data.list[i].healthInfoStep+"<strong>"+data.list[i].healthInfoStepTitle+"</strong>");
					//$('div.healthInfo-step-contents>h5>strong').append('');
					$('.miniMode').append("<a class='healthInfo-miniMode'>"
												+"<figure class='healthInfo-miniFigure'>"
												+"<div class='miniFigure-div'>"
													+"<img src='${pathImages}"+data.list[i].healthInfoMainPic+"' class='miniFigure-div-img'>"
												+"</div>"
												+"<div class='healthInfo-miniFigureCaption'>"
													+"<h6>"+data.list[i].healthInfoTitle+"</h6>"
													+"<p>"+data.list[i].healthInfoSubTitle+"</p>"
												+"</div>"
											+"</figure>"
										+"</a>");	
				}
				alinkClick();				
			}
		})
	}






</script>



<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />