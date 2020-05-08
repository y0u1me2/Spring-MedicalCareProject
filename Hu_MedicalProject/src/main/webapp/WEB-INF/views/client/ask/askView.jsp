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
   <div class="container-fluid" style="padding-top:60px;">
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
         <c:choose>
         <c:when test = "${empty reply}">
       <form action="${path}/reply/insertReply.do?replyRefNo=${a.askNo}" method="post">
       <input type="hidden" name="replyRefNo" value="${a.askNo }">
         <div style="padding-top:10px;">
         	<textarea style="margin-bottom:20px;" placeholder="문의에 대한 답을 입력하세요" name="replyContent" class="form-control" rows="4" id="replyContent" ></textarea>
         	<button id="replyBtn" class="btn btn-outline-success my-2 my-sm-0" style="margin-left:783px; ">답변등록</button>
         </div> 
       </form>
      </c:when>
      <c:when test = "${not empty reply }">
          <div style="height: 130px;">
           	<img src="${path }/resources/images/logo6.png"  style="width:70px; float:left; padding-right:20px;">
			  <div style="margin-top:30px;">${reply.replyContent }</div>
          </div>
          <div style="float:right; margin-top:50px;">
	           <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-right: 2px;" id="replyUpdateBtn" onclick="replyUpdate();">답변수정</button>
	           <button class="btn btn-outline-success my-2 my-sm-0" onclick="replyDelete();" >답변 삭제</button>
	      </div>
  	</c:when>
  	</c:choose>
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
//답변
function replyDelete(){
	if(confirm("답변삭제하시겠습니까?")){
	location.replace('${path}/reply/deleteReply.do?no=${reply.replyRefNo}');
	}
}
 

$(function(){
	$("#replyUpdateBtn").on("click",function(){
		location.replace('${path}/reply/updateReply.do?no=${reply.replyRefNo}');
	})
});

</script>
      
        
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>