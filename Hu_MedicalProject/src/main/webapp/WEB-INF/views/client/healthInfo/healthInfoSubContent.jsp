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
		padding: 10px;
	}
	.healthInfo-content-pic>img {
		width: 100%;
    	/* display: inline-block; */
    	border: 5px solid #FFF;
 		display: block;
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
	
	.content {
  margin: auto;
  padding: 20px;
  width: 600px;
}

.slider {
  margin: 30px auto 50px;
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}


/* ===================================== */
/* Slider */
.slick-slider
{
    position: relative;

    display: block;
    box-sizing: border-box;

    -webkit-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;

    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list
{
    position: relative;

    display: block;
    overflow: hidden;

    margin: 0;
    padding: 0;
}
.slick-list:focus
{
    outline: none;
}
.slick-list.dragging
{
    cursor: pointer;
    cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.slick-track
{
    position: relative;
    top: 0;
    left: 0;

    display: block;
}
.slick-track:before,
.slick-track:after
{
    display: table;

    content: '';
}
.slick-track:after
{
    clear: both;
}
.slick-loading .slick-track
{
    visibility: hidden;
}

.slick-slide
{
    display: none;
    float: left;

    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide
{
    float: right;
}
.slick-slide img
{
    display: block;
}
.slick-slide.slick-loading img
{
    display: none;
}
.slick-slide.dragging img
{
    pointer-events: none;
}
.slick-initialized .slick-slide
{
    display: block;
}
.slick-loading .slick-slide
{
    visibility: hidden;
}
.slick-vertical .slick-slide
{
    display: block;

    height: auto;

    border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
    display: none;
}

/* ================================================ */

/* Slider */
/* .slick-loading .slick-list
{
    background: #fff url('./ajax-loader.gif') center center no-repeat;
}
 */
/* Icons */
/* @font-face
{
    font-family: 'slick';
    font-weight: normal;
    font-style: normal;

    src: url('./fonts/slick.eot');
    src: url('./fonts/slick.eot?#iefix') format('embedded-opentype'), url('./fonts/slick.woff') format('woff'), url('./fonts/slick.ttf') format('truetype'), url('./fonts/slick.svg#slick') format('svg');
} */
/* Arrows */
.slick-prev,
.slick-next
{
    font-size: 0;
    line-height: 0;

    position: absolute;
    top: 50%;

    display: block;

    width: 20px;
    height: 20px;
    padding: 0;
    -webkit-transform: translate(0, -50%);
    -ms-transform: translate(0, -50%);
    transform: translate(0, -50%);

    cursor: pointer;

    border: none;
    outline: none;
    background: #f0f0f0;
}
.slick-prev:hover,
.slick-prev:focus,
.slick-next:hover,
.slick-next:focus
{
    color: #DAF1DE;
    outline: none;
    background: #DAF1DE;
}
.slick-prev:hover:before,
.slick-prev:focus:before,
.slick-next:hover:before,
.slick-next:focus:before
{
    opacity: 1;
}
.slick-prev.slick-disabled:before,
.slick-next.slick-disabled:before
{
    opacity: .25;
}

.slick-prev:before,
.slick-next:before
{
    font-family: 'slick';
    font-size: 20px;
    line-height: 1;

    opacity: .75;
    color: black;

    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.slick-prev
{
    left: -25px;
}
[dir='rtl'] .slick-prev
{
    right: -25px;
    left: auto;
}
.slick-prev:before
{
    content: '<';
}
[dir='rtl'] .slick-prev:before
{
    content: '>';
}

.slick-next
{
    right: -25px;
}
[dir='rtl'] .slick-next
{
    right: auto;
    left: -25px;
}
.slick-next:before
{
    content: '>';
}
[dir='rtl'] .slick-next:before
{
    content: '<';
}

/* Dots */
.slick-dotted.slick-slider
{
    margin-bottom: 30px;
}

.slick-dots
{
    position: absolute;
    bottom: -25px;

    display: block;

    width: 100%;
    padding: 0;
    margin: 0;

    list-style: none;

    text-align: center;
}
.slick-dots li
{
    position: relative;

    display: inline-block;

    width: 20px;
    height: 20px;
    margin: 0 5px;
    padding: 0;

    cursor: pointer;
}
.slick-dots li button
{
    font-size: 0;
    line-height: 0;

    display: block;

    width: 20px;
    height: 20px;
    padding: 5px;

    cursor: pointer;

    color: transparent;
    border: 0;
    outline: none;
    background: transparent;
}
.slick-dots li button:hover,
.slick-dots li button:focus
{
    outline: none;
}
.slick-dots li button:hover:before,
.slick-dots li button:focus:before
{
    opacity: 1;
}
.slick-dots li button:before
{
    font-family: 'slick';
    font-size: 6px;
    line-height: 20px;

    position: absolute;
    top: 0;
    left: 0;

    width: 20px;
    height: 20px;

    content: '•';
    text-align: center;

    opacity: .25;
    color: black;

    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.slick-dots li.slick-active button:before
{
    opacity: .75;
    color: black;
}
</style>

<section id="healthInfo-content">
	<div class="healthInfo-content-header">
		<div class='bottom-InfoContent-Info-main'>${hi.healthInfoTitle }</div>
		<div class='bottom-InfoContent-Info-sub'><p>${hi.healthInfoSubTitle }</p></div>
		<input type='hidden' id='disesaseNo' value='${hi.disesaseNo }'/>
	</div>
	<div class="healthInfo-content-body">
		<div class="healthInfo-content-table">
			<div class="healthInfo-content-table-left">
					<div class="healthInfo-content-comfirmer">
						<div class="confirmer-pic">
							<!-- 검수자 이미지 있을때 없을때 분기 -->							
						</div>
						<div class="confirmer-info">
							<h3>전문가 검수</h3>
							<p><c:out value="${confirmer.CONFIRMERWORK } "/><c:out value="${confirmer.CONFIRMERNAME } "/><c:out value="${confirmer.CONFIRMERJOB }"/>
								<small><c:out value="${confirmer.CONFIRMERINFO }"/></small>
							</p>
						</div>					
					</div>
				<div class="content">
					<div class="healthInfo-content-pics">
						<div class="slider">
							<c:forEach var="healthInfoContentPic" items="${contentList }" >
								<figure class="healthInfo-content-pic">
									<img src="${pathImages}${healthInfoContentPic.HEALTHINFOCONTENTPIC }"><br/>
								</figure>
							</c:forEach>
						</div>
					</div>
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
function miniInfoPicClick(healthInfoNo, disesaseNo) {
	location.href="${path}/healthInfo/subFrequentInfoPic?healthInfoNo="+healthInfoNo+"&disesaseNo="+disesaseNo;
}


	$.ajax({
		url:"${path}/healthInfo/healthInfoMiniMode.do",
		data:{"healthInfoStep":"STEP_1"},
		success:function(data) {
			$('#infoStep').val("STEP_1");
			for(var i=0;i<data.list.length;i++) {
				if($('#disesaseNo').val()==data.list[i].disesaseNo) {
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
												+"<input type='hidden' class='healthInfoNo' value='"+data.list[i].healthInfoNo+"'/>"											
												+"<input type='hidden' class='disesaseNo' value='"+data.list[i].disesaseNo+"'/>"
											+"</figure>"
										+"</a>");						
				}
			}
			alinkClick();
			$('.healthInfo-miniMode').click(function() {
				miniInfoPicClick($(this).children('figure.healthInfo-miniFigure').children('input.healthInfoNo').val()
								, $(this).children('figure.healthInfo-miniFigure').children('input.disesaseNo').val());
			})
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
					if($('#disesaseNo').val()==data.list[i].disesaseNo) {
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
													+"<input type='hidden' class='healthInfoNo' value='"+data.list[i].healthInfoNo+"'/>"											
													+"<input type='hidden' class='disesaseNo' value='"+data.list[i].disesaseNo+"'/>"
												+"</figure>"
											+"</a>");	
						$('.healthInfo-miniMode').click(function() {
							miniInfoPicClick($(this).children('input.healthInfoNo').val(), $(this).children('input.disesaseNo').val());
						})						
					}
				}
				alinkClick();
				$('.healthInfo-miniMode').click(function() {
					miniInfoPicClick($(this).children('figure.healthInfo-miniFigure').children('input.healthInfoNo').val()
									, $(this).children('figure.healthInfo-miniFigure').children('input.disesaseNo').val());
				})
			}
		})
	}



	$(document).ready(function() {
		  var $slider = $('.slider');
		  /* var $progressBar = $('.progress');
		  var $progressBarLabel = $( '.slider__label' ); */
		  
		  $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide) {   
		    var calc = ( (nextSlide) / (slick.slideCount-1) ) * 100;
		    //var calc = ( (nextSlide) / (14-1) ) * 100;
		    
		   /*  $progressBar
		      .css('background-size', calc + '% 100%')
		      .attr('aria-valuenow', calc );
		    
		    $progressBarLabel.text( calc + '% completed' ); */
		  });
		  
		  $slider.slick({
		    slidesToShow: 1,
		    slidesToScroll: 1,
		    speed: 400
		  });  
		});

	
</script>

<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />