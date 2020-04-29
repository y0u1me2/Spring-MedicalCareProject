<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp">

<style>

    div#corona-container{
        position: relative;
        top:200px;
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

    button#cancel-btn:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 

    /* 문진완료 버튼 */
    button#complete-btn{
        background: rgb(247, 245, 245);
      border: none;
      height:50px;
      width: 150px;
      border-radius: 7px;
    }

    button#complete-btn:hover{
        background: rgb(200, 200, 202);
      outline: none;
    }




</style> 


    <div class="container-fluid">
        
        <div class="row">
            <div class="col-sm-12">

                <div id="corona-container">

                    <img src="images/warning.png" width="50px;" />

                    <h1>코로나바이러스 감염증-19 문진</h1>
                    </br></br></br>
                
                    <h3>원내 감염 방지를 위해 협조해주셔서 감사합니다.</h3>
                    </br>
                    
                    <p>중국 방문 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>                 

                    <input type="radio" name="yes" id="yes" value="" />
                    <label for="yes">예</label>

                    <input type="radio" name="no" id="no" value="" />
                    <label for="no">아니오</label>

                    <p>확진자 접촉 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>

                    <input type="radio" name="yes" id="yes" value="" />
                    <label for="yes">예</label>

                    <input type="radio" name="no" id="no" value="" />
                    <label for="no">아니오</label>

                    <p>코로나19 발생 국가/지역 방문 후 14일 이내에 발열 또는 호흡기 증상이 있나요?</p>

                    <input type="radio" name="yes" id="yes" value="" />
                    <label for="yes">예</label>

                    <input type="radio" name="no" id="no" value="" />
                    <label for="no">아니오</label>


                    <div id="corona-btn" >
                        <button id="cancel-btn">접수취소</button>
                        <button id="complete-btn">문진완료</button>
                    </div>

             </div>
            </div>
        </div>
    </div>

    
 <jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>  