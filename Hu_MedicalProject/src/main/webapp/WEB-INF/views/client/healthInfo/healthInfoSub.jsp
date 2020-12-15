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
	#content-healthInfo-sub {
		width:1366px;
		padding: 0 270px;
		margin: 60px auto;
	}
	/* .container-healthInfo-sub {
		margin: 0 auto;
		padding: 0 170px;
	} */
	.bottom-content {
		width: 70%;
		margin: 5% auto 10px auto;
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
	.picContentBox {
		/* display: inline-flex; */
		width: 100%;
	}
	
</style>

<section id="content-healthInfo-sub">
<div class="container-healthInfo-sub">
			<div class="STEP_1">
				<c:set var="flag" value="true"/>
				<c:forEach items="${list}" var="title">
					<c:if test="${title.healthInfoStep eq 'STEP_1' and flag eq 'true'}">
						<h4>${title.healthInfoStep}</h4>					
						<h1>${title.healthInfoStepTitle}</h1>
						<c:set var="flag" value="false"/>						
					</c:if>
				</c:forEach>
				<div class='picContentBox'>
					<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_1' }">
								<div class='bottom-InfoContent p-6'>
									<img style='width:250px; height:188px;' src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
										<div class='bottom-InfoContent-Info-sub'><p>${HI.healthInfoSubTitle }</p></div>
										<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
										<input type='hidden' class='disesaseNo' value='${HI.disesaseNo }'/>
									</div>
								</div>
						</c:if>					
					</c:forEach>				
				</div>						
			</div>		
			<div class="STEP_2">
				<c:set var="flag" value="true"/>
				<c:forEach items="${list}" var="title">
					<c:if test="${title.healthInfoStep eq 'STEP_2' and flag eq 'true'}">
						<h4>${title.healthInfoStep}</h4>					
						<h1>${title.healthInfoStepTitle}</h1>
						<c:set var="flag" value="false"/>						
					</c:if>
				</c:forEach>
				<div class='picContentBox'>
					<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_2' }">
								<div class='bottom-InfoContent p-6'>
									<img style='width:250px; height:188px;' src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
										<div class='bottom-InfoContent-Info-sub'><p>${HI.healthInfoSubTitle }</p></div>
										<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
										<input type='hidden' class='disesaseNo' value='${HI.disesaseNo }'/>
									</div>
								</div>
						</c:if>					
					</c:forEach>
				</div>						
			</div>
			<div class="STEP_3">
				<c:set var="flag" value="true"/>
				<c:forEach items="${list}" var="title">
					<c:if test="${title.healthInfoStep eq 'STEP_3' and flag eq 'true'}">
						<h4>${title.healthInfoStep}</h4>					
						<h1>${title.healthInfoStepTitle}</h1>
						<c:set var="flag" value="false"/>						
				</c:if>
				</c:forEach>
			<div class='picContentBox'>
				<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_3' }">
							<div class='bottom-InfoContent p-6'>
								<img style='width:250px; height:188px;' src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
									<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
									<div class='bottom-InfoContent-Info-sub'><p>${HI.healthInfoSubTitle }</p></div>
									<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
									<input type='hidden' class='disesaseNo' value='${HI.disesaseNo }'/>
								</div>
							</div>
						</c:if>					
					</c:forEach>
				</div>						
			</div>
		</div>	
</section>

<script>
//많이찾는 건강정보 스타일 변화
$('.bottom-InfoContent').mouseenter(function() {
	$(this).addClass('InfoContent-selected');
	$(this).click(function() {
		console.log($(this).children('div.bottom-InfoContent-Info').children('input.healthInfoNo').val());
		frequentInfoPicClick($(this).children('div.bottom-InfoContent-Info').children('input.healthInfoNo').val(),
							$(this).children('div.bottom-InfoContent-Info').children('input.disesaseNo').val());	
	});
})
$('.bottom-InfoContent').mouseleave(function() {
	$(this).removeClass('InfoContent-selected');
})

//자주찾는 건강정보 사진버튼 function화
function frequentInfoPicClick(healthInfoNo, disesaseNo) {
	location.href="${path}/healthInfo/subFrequentInfoPic?healthInfoNo="+healthInfoNo+"&disesaseNo="+disesaseNo;
}
</script>



<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />