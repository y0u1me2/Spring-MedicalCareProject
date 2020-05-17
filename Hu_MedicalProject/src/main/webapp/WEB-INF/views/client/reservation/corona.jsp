<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp"/>

<style>

    div#corona-container{
        position: relative;
        top:120px;
       text-align: center;
    }

    /* 버튼들 */
    div#corona-btn{
        position: relative;
        top:30px;
    }

    /* 접수취소 버튼 */
    button#cancel-btn{
        height: 50px;
        width: 100px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 7px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
    }


    /* 문진완료 버튼 */
    button#complete-btn{
        background: rgb(247, 245, 245);
      border: none;
      height:50px;
      width: 150px;
      border-radius: 7px;
    }


footer {
	position: relative;
	top: 300px;
}

/* 접수전 팝업창 */
    .modal-back {
        display: none;
        z-index: 4;
        width: 100%;
        height: 100%;
        top: 0;
        position: fixed;
        /* border: 1px solid black; */
        background-color: rgba(0, 0, 0, 0.5);
    }

    /* 팝업 크기 */
    .modal-login {
        width: 500px;
        height:1100px;
        max-height: 700px;
        padding: 40px;
        background-color: #fefefe;
        margin: 2% auto 15% auto;
        position: relative;
        top:200px;
    }
    
    /* Add Zoom Animation 
    팝업시 줌 애니메이션*/
    .animate {
        animation: animatezoom 0.6s
    }


    @keyframes animatezoom {
        from {
            transform: scale(0)
        }

        to {
            transform: scale(1)
        }
    }
    
     /* 확인 버튼 */
    .big-gray-btn {
        padding: 0 20px;
        line-height: 48px;
        width: 100%;
        font-size: 13px;
        text-align: center;
        font-weight: bold;
        background-color: #DAF1DE;
        border: 1px solid #DAF1DE;
        color: rgb(255, 255, 255);
        cursor: pointer;
        position:relative;
        top:130px;
    }


    /* 확인 버튼 호버시 */
    .big-gray-btn:hover {
        background-color: #646464;
        border: 1px solid #646464;
        cursor: pointer;
    }
    
     /* 닫기버튼(X) */
    .close-btn {
        position: absolute;
        top: 0;
        right: 0;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .close-btn>.close {
        position: relative;
        font-size: 20px;
        cursor: pointer;
    }

    .close:hover {
        color: red;
    }
    
    /* 경고 이미지  */
    img#warning{
    	position:relative;
    	left:200px;
    }
    
    /* 팝업 텍스트 */
	div.poptext{
		position:relative;
		top:40px;
	}
	
	div.poptext>h3{
		position:relative;
		left:40px;
	}
	
	div#textP{
		position:relative;
		top:30px;
	}
	
	
	div#textP>p>strong{
		color:red;
	}



</style> 


    <div class="container-fluid">
        
        <div class="row">
            <div class="col-sm-12">

                <div id="corona-container">

                    <img src="${path }/resources/images/warning.png" width="50px;" />

                    <h1>코로나바이러스 감염증-19 문진</h1>
                    </br></br></br>
                
                    <h3>원내 감염 방지를 위해 협조해주셔서 감사합니다.</h3>
                    </br>
                    
                    <p>중국 방문 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>                 

                    <input type="radio" class="yes" id="yes1" name="radio1" value="" />
                    <label for="yes1">예</label>

                    <input type="radio" class="no" id="no1" name="radio1" value="" />
                    <label for="no1">아니오</label>

                    <p>확진자 접촉 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>

                    <input type="radio" class="yes" id="yes2" name="radio2" value="" />
                    <label for="yes2">예</label>

                    <input type="radio" class="no" id="no2" name="radio2" value="" />
                    <label for="no2">아니오</label>

                    <p>코로나19 발생 국가/지역 방문 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>

                    <input type="radio" class="yes" id="yes3" name="radio3" value="" />
                    <label for="yes3">예</label>

                    <input type="radio"  class="no" id="no3" name="radio3" value="" />
                    <label for="no3">아니오</label>


                    <div id="corona-btn" >
                        <button id="cancel-btn"
                        onclick="location.replace('${path}/rv/reservationList');">접수취소</button>
                        <button id="complete-btn" type="button">문진완료</button>
                    </div>
	
			<c:forEach items="${list }" var="r">
			
			<input type="hidden" name="hospNo" value="${r['HOSPNO']}"/>
			
			</c:forEach>


             </div>
            </div>
        </div>
    </div>
    
      <div class="modal-back" id="login">
			<div class="modal-login animate">
				<img src="${path }/resources/images/logo5.png" width="50px;" id="warning" />
					
					<div class="poptext">
						<h3>선별진료소 검진 권장 안내 안내</h3>
						<hr>
						
						<div id="textP">
						
							<h4><strong>코로나 바이러스감염증-19 증상</strong></h4>
							<p>- 최근 중국 및 유행국가 방문 및 확진자 직접/동선 접촉후 <br/>&nbsp;&nbsp;
								발열 또는 호흡기 증상이 나타나는 경우, <strong>코로나바이러스  <br/>&nbsp;&nbsp;
								감염증-19 감염이 의심</strong>될 수 있습니다.</p>
								
							<h4><strong>선별진료소란?</strong></h4>	
							<p>- 감염증 의심환자가 응급실 또는 의료기관 출입<br/>&nbsp;&nbsp; 
							  	전에 진료를 받도록 하는 공간입니다.</p>
							  	
							<h4><strong>증상이 의심될 땐 전화상담</strong></h4>	 			  	
							<p>- 질병관리본부 콜센터 : <strong>1399로 전화하세요</strong></p>
												
						</div>
					</div>		
					
				<button type="button" class="big-gray-btn" 
				onclick="location.replace('${path}/rv/reservationView')">계속 접수하기</button>
				
				<button type="button" class="big-gray-btn" 
				onclick="location.replace('${path}/rv/corona')">취소</button>
										
				<div class="close-btn">
					<span onclick="popupOff();" class="close" title="Close Modal">&times;</span>
				</div>
				
			</div>
		</div>

    <script>
   $(document).ready(function(){
    	$('#complete-btn').attr('disabled', true);
		  	
   });
   
   
  //아니오 3개 클릭됐을 때 문진완료버튼 활성화
	  $("input.no").click(function(){
  
		   var count=0;
	    	$.each($("input.no"),function(i,item){
	    		
	    		//radio가 3개체크됐는지 확인하기
	    		if(item.checked==true){
	    			count++; 			  			
	    		}  		
	    		    		
	    		if(count==3) {  		
	    			
	    			$('#complete-btn').attr('disabled', false);
	    			
			    	btn = document.getElementById("complete-btn");
			    	
			    	btn.addEventListener("click", function() {
			    		
			    		var hospNo = $('input[name=hospNo]').val();
			    		location.replace('${path}/rv/reservationView?no='+hospNo);
			    	});
	    			
	    		}   			
	    	
    		});

	    })	  
 	
   //예가 1개이상 클릭 됐을 때 경고 팝업창 띄우기
    $("input.yes").click(function(){
	   
	   var yesCount=0;
	   $.each($("input.yes"),function(i,item){
		   
			 if(item.checked==true){
				 yesCount++;
			  }
		  		if(yesCount>=1){
		  			
		  			$('#complete-btn').attr('disabled',false);
		     			
		  			btn = document.getElementById("complete-btn");
			    	
			    	btn.addEventListener("click", function() {
	  		 	 				 $(".modal-back").show();
	  		 	 				 
	  		   					});	
		    	}	    		
	  		});  	  
   		})
   
    function popupOff(){
  	  $(".modal-back").hide();
    }

 
    
    </script>
    
 <jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>  