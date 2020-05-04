	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
	<input type="hidden" name="askNo" value="${a.askNo }">
   <div class="container-fluid" style="padding-top: 100px;">
        <div class="row">
          <div class="col-xl-2">
          </div>
          <div class=" col-xl-8 " style="height: 500px; margin-bottom: 100px;">
           <h2>${a.askTitle }</h2>
           <div style="float: right;">
	           <button class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 2px;" onclick="askUpdate();">수정</button>
	           
	           <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-right: 2px;" onclick="askDelete();">삭제</button>
	           <button class="btn btn-outline-success my-2 my-sm-0" onclick="askList();" >목록</button>
           </div>
           <p style="padding-top: 0px; color:lightgray;">${a.askDate }</p>
           
           <hr>
           <div style="height: 200px; ">
            ${a.askContent }
           </div>
          <hr>
          <div style="height: 130px; ">
           	<img src="${path }/resources/images/logo6.png"  style="width:70px; float:left; padding-right:20px;">
			  <div style="margin-top:30px;">에듀온학습에 불편드려 죄송합니다.최근 윈도우 사용 중 생기는 오류로 인해 자세한 해결 방법을 아래 링크를 통해 확인 해 보시고,
			그래도 동일한 오류가 지속 될 경우 학습지원팀으로 연락 주시면 안내 도와드리도록 하겠습니다.</div>
          </div>
          
          <hr>
            
           </div>
          </div>
          <div class="col-xl-2">
          </div>
          
        </div>
<script>

function askUpdate(){
	location.replace('${path }/ask/updateAsk.do?no=${a.askNo}');
}

function askList(){
	location.replace('${path }/ask/ask.do');
}

function askDelete(){
	if(confirm("삭제하시겠습니까?")){
		location.replace('${path }/ask/deleteAsk.do?no=${a.askNo}');
	}
}


</script>
      
        
	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>