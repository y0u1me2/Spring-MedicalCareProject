<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mainpage.css"/>
<script>



</script>
<section>
        <div class="container-fluid" >
          <!-- Control the column width, and how they should appear on different devices -->
          <div class="row">
            <div class="col-sm" style="background-color:#DAF1DE; height:500px; padding-left: 250px;padding-top: 120px;">
               <div class="inform">
                <strong>건강이</strong>
                <span>편해지다</span>
                <div id="line"></div>
                <p id="intro">간편한 병원예약/접수부터&nbsp; 다양한 건강정보 까지</p>
                </div>
                
                <div id="block">d</div>
                <div id="present">
                    <div class="presentInform ">
                        <div id="possible">접수/예약 가능한 병원<br>
                        <h2 id ="totalHospital" style="margin-left: 30px;"></h2></div>
                    </div>
                    <div class="presentInform">
                    <div id="possible">누적 접수/예약 건수
                    <h2 id="totalReservation" style="margin-left: 50px;"></h2></div>  
                    </div> 
                </div>
            </div>
            </div>
            <div class="w3-container w3-center w3-animate-bottom">
                <img id="logo2" src="${pageContext.request.contextPath }/resources/images/hospital.JPG" width="200px;">
            </div>
          </div>
        </div>

        <div class="container-fluid" style="height:700px;">
            <div data-wow-delay="1s" id="sec2" class="wow fadeInLeft" >
               
                <p data-wow-delay="0.7s" class="wow fadeInLeft">실시간 접수 · 예약<br>이래서 편리합니다.</p>
            </div>
            <div class="col-xl-9" id="left" >
                <div data-wow-delay="0.5s" id="middleinform" class="wow fadeInUp">
                    <img id="listing" src="${pageContext.request.contextPath }/resources/images/sick.png" width="50px;" >
                    <p id="finder"> 상황별 증상 찾기</p>
                    <p id="finder2">어떤 상황에서 증상이 발생했는지 파악하는것이 먼저입니다.</p>
                </div>
                <div data-wow-delay="1s" id="middleinform" class="wow fadeInUp">
                    <img id="listing" src="${pageContext.request.contextPath }/resources/images/hospital.png" width="50px;" >
                    <p id="finder">내주변 병원 찾기</p>
                    <p id="finder2">나의 위치에 증상과 관련된 병원을 찾습니다.</p>
                </div>
                <div  data-wow-delay="1.5s" id="middleinform" class="wow fadeInUp">
                    <img id="listing" src="${pageContext.request.contextPath }/resources/images/chart.png" width="50px;" >
                    <p id="finder">실시간 병원 예약/접수</p>
                    <p id="finder2">언제 어디서나 기다리지 않고 예약을 통해 진료를 받습니다.</p>
                </div>

            </div>
            <div class="imgg" >
                <img id="guide" data-wow-delay="3s" class="wow fadeIn" src="${pageContext.request.contextPath }/resources/images/doctor.jpg" width="500px;" height="450px;">
            </div>
      </div>
   
      <div class="container-fluid2" style="height:900px; padding-top: 200px;">
          <div class="right">
            <div data-wow-delay="0.5s" id="middleinform" class="wow fadeInUp" >
                <img  id="listing" src="${pageContext.request.contextPath }/resources/images/searching.png" width="50px;" >
                <p id="finder"> 실시간 건강 정보 탐색</p>
                <p id="finder2">실시간으로 건강 정보를 탐색해 보세요.</p>
            </div>
            <div data-wow-delay="1s" id="middleinform" class="wow fadeInUp" >
                <img id="listing" src="${pageContext.request.contextPath }/resources/images/pharmacy.png" width="50px;" >
                <p id="finder">내주변 약국 찾기</p>
                <p id="finder2">내 주변에 약국이 어디 있는지 확인해 보세요.</p>
            </div>
            <div data-wow-delay="1.5s" id="middleinform" class="wow fadeInUp" >
                <img id="listing" src="${pageContext.request.contextPath }/resources/images/aspirin.png" width="50px;" >
                <p id="finder">실시간 증상 진료</p>
                <p id="finder2">실시간으로 나의 증상을 빠르게 확인해보세요.</p>
            </div>
        </div>
        <div class="img2">
            <img id="family" data-wow-delay="0.5s" class="wow fadeIn" src="${pageContext.request.contextPath }/resources/images/smile.jpg" width="400px;" height="320px;">
        </div>
        <div id="intro2" class="wow fadeInRight">
            <p>간편한 건강 피드<br>이래서 편리합니다.</p>           
        </div> 
    </div> 

    <div id="container-fluid" style="height:270px;">
      
      <img id="lastlogo" src="${pageContext.request.contextPath }/resources/images/logo5.png" width="43px;" class="wow fadeInUpBig">
        <p id="last" class="wow fadeInUpBig"><strong>당신의</strong> 건강을 <br><strong>HospitalForU</strong> 와 <strong>함께하세요!</strong></p>
     <!-- <div id="line2" class="wow zoomInRight"></div> -->
      </div>
</section>
   <script>
   new WOW().init();

    //presentinform  
      $(document).ready(function(){
    $(".presentInform").animate({width: "280px"},1600);
    });
        // 단순fadein효과주기
        
        $(document).ready(function() {
            /* 1 */
                /* 2 */
                $('.inform').each( function(i){
                    var bottom_of_object = $(this).offset().top + $(this).outerHeight();
                    var bottom_of_window = $(window).scrollTop() + $(window).height();
                    
                    if( bottom_of_window > bottom_of_object/2 ){
                        $(this).animate({'opacity':'1'},2000);
                    }
                }); 
        });
        
    //병원 카운트    
        $(function(){
        	$.ajax({
        		url:'${pageContext.request.contextPath }/member/hospitalCount.do',
        		type:'POST',
        		success:function(result){
        			var num=result.hospitalCount;
        			var regExp=/\B(?=(\d{3})+(?!\d))/g;
        			var num2=num.toString().replace(regExp,',');
        			console.log(num2);
        			$('#totalHospital').html(num2);
        		}
        	})
        });
    
	//예약 카운트
        $(function(){
        	$.ajax({
        		url:'${pageContext.request.contextPath }/reservation/reservationCount.do',
        		type:'POST',
        		success:function(result){
        			var num=result.reservationCount;
        			var regExp=/\B(?=(\d{3})+(?!\d))/g;
        			var num2=num.toString().replace(regExp,',');
        			$('#totalReservation').html(result.reservationCount);
        		}
        	})
        });
        
     /*    $(document).ready(function(){
    		 var num=$("#totalHospital").val();
    		 console.log(num);
    		 return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
       	}); */
        
       
</script>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>