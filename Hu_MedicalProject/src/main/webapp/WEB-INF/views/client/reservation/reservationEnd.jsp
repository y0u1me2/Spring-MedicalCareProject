<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />
    <style>

    div#reception-container{
        position: relative;
        top:200px;
        left:300px;
        text-align: left;
    }
    
    /* 사전문진 확인/수정 버튼 */
    button#paperweight-btn {
      background: rgb(247, 245, 245);
      border: none;
      height:60px;
      width: 500px;
      border-radius: 7px;
      display: flex;
    }

    /* 경고 이미지 */
    button#paperweight-btn>img {
      position: relative;
      left: 10px;
    }

    button#paperweight-btn:hover {
      background: rgb(200, 200, 202);
      outline: none;
    }
    
    button#paperweight-btn>p:nth-child(2){
        font-weight: bolder;
        position: relative;
        left:20px;
        top:5px;
    }

    /* 확인/수정하기 */
    button#paperweight-btn>p:nth-child(3){
        color:rgb(104, 102, 102);
        position: relative;
        left:40px;
        top:5px;
    }

    button#paperweight-btn>p:nth-child(4){
        color:rgb(104, 102, 102);
        position: relative;
        left:100px;
        top:5px;
    }

    div#choice{
        position: relative;
        top:50px;
    }

     /* [필수] */
     p>strong{
         color: red;
     }

     /*  */
     option{
        border: none;
     }

     /* 원장님께 하고 싶은 말 */
     div#words{
        position: relative;
        top:20px;
     }

     /* 어제부터 열이나요 */
     div#words>input{
        width: 300px;
        height: 50px;
        border: 1px solid rgb(204, 203, 203);

     }

     /* 공지사항 */
     div#notice{
         position: relative;
         top:120px;
     }


/* 프로필 */
div.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width:100px;
  height:130px;

}
.container {
  padding: 2px 16px;
}

/* 가족추가  */
div#patient{
    display: flex;
}

div.family{
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width:100px;
  height:130px;
  position: relative;
    left:20px;
    
}

/* 플러스 이미지 */
img#plus{
    padding-left: 40px;
    padding-top: 40px;
  
}

div.select{
    position: relative;
    top:20px;
}

 /* 접수하기 버튼 */
 button#reception-btn{
         height: 40px;
         width: 200px;
         background: #313030;
         border-radius: 7px;
         margin-left: auto;
         margin-right: auto;
         border: 0;
         font-size: 15px;
         color: rgb(233, 233, 229);
         position: relative;
         left: 120px;
         top: 150px;
     }
     button#reception-btn:hover{
         background: black;
         outline: none;
     }

footer {
	position: relative;
	top: 400px;
}

/* 가족추가 팝업창 */
	.modal-family{
	 display: none;
        z-index: 4;
        width: 100%;
        height: 100%;
        top: 0;
        position: fixed;
        /* border: 1px solid black; */
        background-color: rgba(0, 0, 0, 0.5);
	}

	.modal-f{
	width: 500px;
        height:500px;
        max-height: 650px;
        padding: 40px;
        background-color: #fefefe;
        margin: 2% auto 15% auto;
        position: relative;
        top:200px;
	}

 /* 팝업 텍스트 */
	div.poptext2{
		position:relative;
		top:40px;
	}
	
	div.poptext2>h3{
		position:relative;
		left:160px;
	}
	
	div#textP2{
		position:relative;
		top:30px;
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
        height:500px;
        max-height: 650px;
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
		left:70px;
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

                <div id="reception-container">

                    <button id="paperweight-btn" 
                    onclick="location.replace('${path}/rv/coronaUpdate')">
                        <img src="${path }/resources/images/warning.png" width="30px;" />
                        <p>원내 감염 방지를 위한 사전문진</p>
                        <p>확인/수정하기</p>
                        <p>></p>
                    </button>


		<form action="${path}/rv/reservationList">
                <div id="choice">

                    <p>진료대상<strong>[필수]</strong></p>
                    
                    <p>※ 실제 진료 받을 분으로 선택해주세요.</p>
                    
                    <div id="patient">
                        <div class="card">
                            <img src="${path }/resources/images/profile.png" alt="진료대상" width="100px;">
                            
                            <div class="container">
                                <p>&nbsp;&nbsp;<c:out value="${loginMember.name }" /></p>
                            </div>                      
                        </div>

                        <div class="family" onclick="popupFamilyAdd();">
	                  
	                            <img src="${path }/resources/images/family.png" id="plus" alt="플러스" width="60px;">
	
	                            <div class="container">
	                                <p>가족추가</p>
	                            </div> 
	                       
                        </div>
                    </div> 
	      
	   
	                           
	                            
	                        

              <div class="select">
                <c:forEach items="${list }" var="r">
                  
                    <p>진료항목<strong>[필수]</strong></p>
                    
                    
                    <select>
                        <option>진료항목 선택</option>
                         <c:forTokens items="${r['MEDICALDEPARTMENT']}" var="e" delims=",">
                        	<option><c:out  value="${e}"/></option>
                        </c:forTokens>
                    </select>

                    <div id="words">
                    <p>원장님께 하고 싶은 말[선택]</p>
                    <input type="text" name="message" placeholder="&nbsp;&nbsp; ex) 어제부터 열이나요." >
                    </div>
				</c:forEach>
                </div>

                </div>
                    <div id="notice">
                        <p>
                            ※ 병원에 도착하시면 데스크에 도착 여부를 알려주세요.</br>
                            ※ 접수 후 진료 차례에 병원을 방문하지 않으면 접수가 취소됩니다.</br>
                            ※ 대기자수는 실제 대기자수와 차이가 있을 수 있습니다.</br>
                        </p>
                    </div>
                    
                    <button id="reception-btn" onclick="popupOn();">
                    	접수하기</button>
                    </div>
                </div>
            </div>
        </div>
        
         <!------------- 접수전 모달창 ------------->       
        <div class="modal-back" id="login">
			<div class="modal-login animate">
				<img src="${path }/resources/images/warning.png" width="30px;" id="warning" />
					
					<div class="poptext">
						<h3>Hospital for U 접수 안내</h3>
						
						<div id="textP">
							<p>- 병원에 도착하시면 데스크에 도착 여부를 알려주세요.</p>
							<p>- 접수 후 진료 차례에 병원을 방문하지 않으면 <strong>접수가<br/>&nbsp;&nbsp;취소됩니다.</strong></p>
							<p>- 대지가수는 실제 대기자수와 차이가 있을 수 있습니다.</p>
						</div>
					</div>		
					
				<button type="submit" class="big-gray-btn" >확인</button>
		</form>
				
				
				
				
				<div class="close-btn">
					<span onclick="popupOff();" class="close" title="Close Modal">&times;</span>
				</div>
				
			</div>
		</div>
		
		 <!------------- 가족추가 모달창 ------------->                      
	     <div class="modal-family">
			<div class="modal-f animate">
				<img src="${path }/resources/images/logo5.png" width="30px;" id="warning" />
					
					<div class="poptext2">
						<h3>가족추가</h3>
						
						<div id="textP2">
							<input type="text" placeholder="이름" />
							<select>
								<option>내국인</option>
								<option>외국인</option>
							</select>
							
							<br/><br/>
							<input type="text" placeholder="생년월일 (ex.19000101)" />
							
							<input type="radio" name="gender" id="gender0" value="M" checked> 
							<label for="gender0">남</label> 
						
							<input type="radio" name="gender" id="gender1" value="F"> 
							<label for="gender1">여</label>
							
							<br/>
							<p>※ 벙원에서 접수 관련 연락을 받을 휴대폰 번호를 입력하세요.</p>
							<input type="text" placeholder="01012345678"/>
							
						</div>
					</div>		
					
				<button type="button" class="big-gray-btn" 
				onclick="location.replace('')">완료</button>
				
				<div class="close-btn">
					<span onclick="popupOff2();" class="close" title="Close Modal">&times;</span>
				</div>
				
			</div>
		</div>
        
      <script>
      
      function popupOn(){
    	  $(".modal-back").show();
    	  	  
      }
      
      function popupOff(){
    	  $(".modal-back").hide();
      }
      
         
      function popupFamilyAdd(){
    	  $(".modal-family").show();
    	  	  
      }
      
      function popupOff2(){
    	  $(".modal-family").hide();
      }
      
      //가족추가 호버시 
      	$('.family').mouseenter(function() {
    	    $(this).css("cursor","pointer");
   	})
      
      
        
      </script>  
        
        
 <jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>  