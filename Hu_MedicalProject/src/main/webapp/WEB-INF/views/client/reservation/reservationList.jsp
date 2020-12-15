<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />
<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

  <style>
    * {
      margin: 0;
    }

    body {
      width: 1366px;
      height: auto;
    }

    /* 버튼클릭시 파란테두리 없애기 */
    button:focus {outline:none;}

    div#menu {
      position: relative;
      left: 450px;


    }

    /* 버튼들 */
    div#btns {
      background: rgb(247, 245, 245);
      width: 500px;
      border-radius: 30px;
      display: flex;
      position: relative;
      top: 30px;

    }

    /* 전체 진료과목 버튼 */
    button#subject {
      background: rgb(247, 245, 245);
      border: none;
      width: 300px;
      border-radius: 20px;
    }


    button#subject>img {
      position: relative;
      left: 10px;
    }

    button#subject:hover {
      background: rgb(200, 200, 202);
      outline: none;
    }

    /* 가운데 | */
    p#bar {
      color: rgb(226, 226, 219);
      font-size: 20px;
      position: relative;
      top: 5px;
    }

    /* 위치 찾기 버튼 */
    button#location {
      background: rgb(247, 245, 245);
      border: none;
      width: 280px;
      border-radius: 20px;
    }

    button#location>img {
      position: relative;
      left: 10px;
    }

    button#location:hover {
      background: rgb(200, 200, 202);
      outline: none;
    }

    /* #tag들 */
    div#tag {
      position: relative;
      top: 50px;
    }

    div#tag>button {
      border: none;
      background-color: white;
    }

    /* 공지사항 div */
    div#notice {
      background: rgb(247, 245, 245);
    }

    
    /* 전체병원보기 버튼 */
    button#lookup {
     background-color:#DAF1DE;
      border-radius: 20px;
      border: none;
      position: relative;
      width: 200px;
      height: 50px;
      left: 550px;
      top: 50px;

    }

    /* 약국 tag들 */
    div#tag2 {
      position: relative;
      top: 100px;
      left: 500px;

    }

    div#tag2>button {
      border: none;
      background-color: white;
    }

    /* 약국정보들 */
    div#content2 {
      display: flex;

    }

    div#pharmacy_content {
      position: relative;
      top: 150px;
      width: 450px;
      border-radius: 15px;
      border: solid 1px rgb(82, 81, 81);
      margin-right: 20px;


    }


    /* 약국버튼들 */
    div#pharm {
      position: relative;
      left: 100px;

    }

    /* 전화 & 찾아가기 버튼 */
    button#pharm-btn {
      height: 40px;
      width: 100px;
      border: solid 1px rgb(147, 147, 194);
      background: white;
      border-radius: 10px;
      font-size: 15px;
      color: rgb(134, 134, 133);
      margin-right: 5px;
    }



    button#pharm-btn:hover {
      background: rgb(251, 251, 249);
      outline: none;
    }

    /* 날씨정보들 */
    div#weather-content {
      position: relative;
      top: 200px;
    }


    /* 날씨정보 텍스트 */
    div#weather-text {
      color: rgb(206, 204, 204);
    }
    
    div.circle{
    	width:80px;
    	height:80px;
    	border-radius:50%;
    	background:#DAF1DE;
    	font-size:12px;
    	text-align:center;/* 가로정렬 */
    	line-height:80px;/* 세로정렬 */
   		position:relative;
   		left:200px;
   		top:50px;

   
    }
    
     div.circle a{
     	text-decoration:none;
     }
     
     button#chat{
		position:relative;
   		left:50px;
   		bottom:30px;
}
     
    
 
    footer {
	position: relative;
	top: 300px;
}

/* ============================리스트 넘기기 ============================= */



/* 병원정보들 */
    div#hospital_content {
      position: relative;
      top: 50px;
      width: 100%;
   
  }

.content {
  margin: auto;
   padding: 20px; 
  width: 100%;
  height:700px;

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
.slick-slider{
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

.slick-list{
    position: relative;

    display: block;
    overflow: hidden;

    margin: 0;
    padding: 0;
}
.slick-list:focus{
    outline: none;
}
.slick-list.dragging{
    cursor: pointer;
    cursor: hand;
}

/* 3개 컨텐츠 위치 */
 .slick-slider .slick-track,
.slick-slider .slick-list{
    -webkit-transform: translate3d(12px, 0, 0);
       -moz-transform: translate3d(12px, 0, 0);
        -ms-transform: translate3d(12px, 0, 0);
         -o-transform: translate3d(12px, 0, 0);
            transform: translate3d(12px, 0, 0);
} 

.slick-track{
    position: relative;
    top: 0;
    left: 0;

    display: block;
}

.slick-track:before,
.slick-track:after{
    display: table;

    content: '';
}
.slick-track:after{
    clear: both;
}
.slick-loading .slick-track{
    visibility: hidden;
}

.slick-slide{
    display: none;
    float: left;

    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide{
    float: right;
}
.slick-slide img{
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


/*====================== 좌우 < > 버튼 ===========================*/
.slick-prev,
.slick-next{
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

.figure{
	width:370px !important;
	 border-radius: 15px;
     border: solid 1px rgb(82, 81, 81);
     padding: 20px;
     margin: 1em 26px;
     min-height:700px;
	
}

div.content1{
	min-height:200px;
}

#hpChat{
width:300px;
height:40px;
margin-top:100px;
margin-left:10px;
}

div.content2{
	min-height:400px;
}

div.entry{
	margin-top: 30px;
	width:100%;
	height:650px;
	background-image:url('${path }/resources/images/reserv.png');
}

h1#title{
	margin-bottm:20px;
	text-align: left;
	 color: rgb(50, 155, 155);
	font-size: 60px;
	font-weight:500;
	text-shadow:1px 1px 2px #666666;
	
}
  </style>



<div class="container-fluid">
<input type="hidden" id="loginMemberName" value="loginMember.name">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<!-- ================================================================ -->
				
			<div class="container-fluid">
				<div class="row">
					<div class="entry" >

						<h1 id="title">HU 병원 접수하기</h1>
					</div>
				</div>
			</div>
			
			<hr/>
					              
			<%-- <form action="${path }/rv/hospdept.do" onsubmit="select_fn();" method="post" id="rvFrm">
				<div class="d-flex justify-content-center mt-3">
				
				<select class="form-control mb-2 mr-sm-2" id="sel1" id="dept" style="width:15%;" required>
				  	<option value="">진료과목 선택</option>
				    <option value="01">내과</option>
				    <option value="02">신경과</option>
				    <option value="03">정신건강의학과</option>
				    <option value="04">외과</option>
				    <option value="05">정형외과</option>
				    <option value="06">신경외과</option>
				    <option value="07">흉부외과</option>
				    <option value="08">성형외과</option>
				    <option value="09">마취통증의학과</option>
				    <option value="10">산부인과</option>
				    <option value="11">소아청소년과</option>
				    <option value="12">안과</option>
				    <option value="13">이비인후과</option>
				    <option value="14">피부과</option>
				    <option value="15">비뇨기과</option>
				    <option value="49">치과</option>
				    <option value="80">한방의학과</option>
				  </select>
				  
					<!-- <div id="searchBox" class="input-group mb-3" style="width:20%;">
					  <input id="keyword" type="text" class="form-control" autocomplete="off" required>
					  <div class="input-group-append">
					    <button class="btn btn-danger">검색</button>
					  </div>
					</div> -->
				</div>
			</form>
						
		              
		         <button class="d-flex justify-content-center mt-3">#가까운_접수병원</button> --%>
		              
		              
		              <p><c:out value="${r['MEDICALDEPARTMENT'] }"/></p>
		
		              <p><c:out value="${r['HOSPTEL'] }"/></p>
		         
		           		<input type="hidden" name="hospNo" value="${r['HOSPNO']}"/>
		           		
		          

				<!-- ============================= 병원정보들 ===================================================== -->


				<div class="content">
					<div id="hospital_content">
						<div class="slider">

							<c:forEach items="${list }" var="r">
								<figure class="figure">

									<div class="content1">
										<h3>
											<c:out value="${r['HOSPNAME'] }" />
										</h3>
										<br />
										<p>
											<c:out value="${r['HOSPADDR'] }" />
										</p>

										<p>
											<c:out value="${r['HOSPDIRECTIONS'] }" />
										</p>

		
							
		
										<p>
											오늘의 진료시간
											<c:out value="${r['OFFICEHOUR1'] }" />
										</p>
	
										
								
									</div>
									<hr />
									<div class="content2">
										<p>
											<c:out value="${r['MEDICALDEPARTMENT'] }" />
										</p>

										<p>
											<c:out value="${r['HOSPTEL'] }" />
										</p>

										<div class="circle">
											<a href="#" class="goCorona">바로접수</a>

										</div>

										<input type="hidden" name="hospNo" value="${r['HOSPNO']}" />
										<br />
										 <button id="hpChat" class="btn btn-outline-dark" type="button" 
		              onclick="hpAccessChatting('${loginMember.email}','${r['ID']}');">실시간 문의</button>
									</div>
									<br>
																		
								</figure>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>


			<!-- ================================================================ -->
			<!-- 병원위치 찾기 -->
			<%--  <p>원하시는 병원이 없으면</br>
            지도에서 병원을 찾아보세요.
          </p>

          <button id="lookup"><img src="${path }/resources/images/hospital.png" width="20px" />&nbsp;&nbsp;전체 병원 보기</button>


          <div id="tag2">
            <button>#가까운_약국</button>
            <button>#문연약국</button>
            <button>#연중무휴약국</button>
          </div>


          <!-- ================================================================ -->
          <!-- 약국정보들 -->
          <div id="content2">
            <div id="pharmacy_content">
              <p>영업중</p>
              <p>연중무휴</p>
              <h3>사당365약국</h3>
              <p><img src="images/location.png" width="15px;" />70km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 영업시간 09:00~23:00</p>
              </hr>

              <div id="pharm">
                <button id="pharm-btn">전화</button>
                <button id="pharm-btn">찾아가기</button>
              </div>
            </div> --%>


		</div>
		
		




	</div>

</div>



<script>   
    //진료과목 선택
    function select_fn(){
    	("#dept").change(function(){

			$("#rvFrm").submit();
    	})
    }
    
    
    //바로접수 호버시 마우스 커서 변화
   	$('.circle').mouseenter(function() {
    	    $(this).addClass('rv-selected').css("cursor","pointer");
   	});
    $('.circle').mouseleave(function() {
    	    $(this).removeClass('rv-selected');
    });
    	
    //바로접수 클릭했을 때 비로그인시 로그인하라고 알림창 띄우기
    $(function(){ 		
    	var loc = document.getElementById("check");
    	
    		$(".circle").click(function(){
    			if(${loginMember.name eq null}){
    				alert("로그인후 이용하세요!"); 
    				loc.addEventListener("click", function() {
    		    	location.replace('${path}/rv/reservationList');
        			});	  				
    			}
    		});	
    		
    		
    			$(".circle").click(function(){
	    			if(${loginMember.name ne null}){
	    				
    					var hospNo = $(this).siblings('input').val();
	    				$(this).children(".goCorona").attr('href',"${path}/rv/corona?no="+hospNo);	
	    			}
    			});
    		});
    
  /* 리스트 넘기기 */  
   $(document).ready(function() {
        var $slider = $('.slider');
 
        
        $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide) {   
          var calc = ( (nextSlide) / (slick.slideCount-1) ) * 100;
      
         
        });
        
        $slider.slick({
          slidesToShow: 3,
          slidesToScroll: 3,
          speed:500
        });  
      }); 
    
   
  let today = new Date();   
  let day = today.getDay(); // 요일
  console.log(day);
  
    </script>


    
 <jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>     
   