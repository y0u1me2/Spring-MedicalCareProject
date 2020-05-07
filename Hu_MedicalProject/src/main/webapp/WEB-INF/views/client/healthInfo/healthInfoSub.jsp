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
	#content {
		width:1366px;
		padding:0 25%;
	}
	.bottom-content {
		width: 70%;
		margin: 5% auto 10px auto;
	}
	.bottom-InfoContent {
		padding: 0 !important;
		margin: 10px;
		width: 30%;
	}
	.bottom-InfoContent-Info {
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
		<div class="col">
			<div class="STEP_1">
				<c:if test="${fn:length(list) != 0 }">
					<h4>STEP_1</h4>
				</c:if>
				<div class='d-flex'>
					<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_1' }">
								<div class='bottom-InfoContent p-6'>
									<img src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
										<div class='bottom-InfoContent-Info-sub'>${HI.healthInfoSubTitle }</div>
										<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
									</div>
								</div>
						</c:if>					
					</c:forEach>				
				</div>						
			</div>		
			<div class="STEP_2">
				<c:if test="${fn:length(list) != 0 }">
					<h4>STEP_2</h4>
				</c:if>
				<div class='d-flex'>
					<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_2' }">
								<div class='bottom-InfoContent p-6'>
									<img src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
										<div class='bottom-InfoContent-Info-sub'>${HI.healthInfoSubTitle }</div>
										<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
									</div>
								</div>
						</c:if>					
					</c:forEach>
				</div>						
			</div>		
			<div class="STEP_3">
				<c:if test="${fn:length(list) != 0 }">
					<h4>STEP_3</h4>
				</c:if>
				<div class='d-flex'>
					<c:forEach items="${list }" var="HI">
						<c:if test="${HI.healthInfoStep eq 'STEP_3' }">
								<div class='bottom-InfoContent p-6'>
									<img src="${pathImages}${HI.healthInfoMainPic }">
									<div class='bottom-InfoContent-Info'>
										<div class='bottom-InfoContent-Info-main'>${HI.healthInfoTitle }</div>
										<div class='bottom-InfoContent-Info-sub'>${HI.healthInfoSubTitle }</div>
										<input type='hidden' class='healthInfoNo' value='${HI.healthInfoNo }'/>
									</div>
								</div>
						</c:if>					
					</c:forEach>
				</div>						
			</div>
		</div>		
	</div>
</div>
</section>

<script>
//많이찾는 건강정보 스타일 변화
$('.bottom-InfoContent').mouseenter(function() {
	$(this).addClass('InfoContent-selected');
})
$('.bottom-InfoContent').mouseleave(function() {
	$(this).removeClass('InfoContent-selected');
})		
</script>



<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />