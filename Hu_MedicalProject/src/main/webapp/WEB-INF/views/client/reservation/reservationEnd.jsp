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

                <div id="choice">

                    <p>진료대상<strong>[필수]</strong></p>
                    
                    <p>※ 실제 진료 받을 분으로 선택해주세요.</p>
                    
                    <div id="patient">
                        <div class="card">
                            <img src="${path }/resources/images/profile.png" alt="진료대상" width="100px;">
                            
                            <div class="container">
                                <p>환자이름</p>
                            </div>                      
                        </div>

                        <div class="family">
                            <img src="${path }/resources/images/family.png" id="plus" alt="플러스" width="60px;">

                            <div class="container">
                                <p>가족추가</p>
                            </div>  
                        </div>
                    </div>

                <div class="select">
                    <p>진료실<strong>[필수]</strong></p>
                    <select>
                        <option>진료실 선택</option>
                    </select>

                    <p>진료항목<strong>[필수]</strong></p>
                    <select>
                        <option>진료항목 선택</option>
                    </select>

                    <div id="words">
                    <p>원장님께 하고 싶은 말[선택]</p>
                    <input type="text" placeholder="&nbsp;&nbsp; ex) 어제부터 열이나요." >
                    </div>

                </div>

                </div>

                    <div id="notice">
                        <p>
                            ※ 병원에 도착하시면 데스크에 도착 여부를 알려주세요.</br>
                            ※ 접수 후 진료 차례에 병원을 방문하지 않으면 접수가 취소됩니다.</br>
                            ※ 대기자수는 실제 대기자수와 차이가 있을 수 있습니다.</br>
                        </p>
                    </div>
                    
                    <button id="reception-btn" onclick="location.replace('${path}/rv/reservationTime')">
                    	접수하기</button>
                    </div>
                </div>
            </div>
        </div>

 <jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>  