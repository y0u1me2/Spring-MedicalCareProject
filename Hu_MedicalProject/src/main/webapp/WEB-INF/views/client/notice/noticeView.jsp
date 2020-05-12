<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
	<input type="hidden" name="askNo" id="askNo" value="${notice.noticeNo }">
   <div class="container-fluid" style="padding-top:60px;">
        <div class="row">
          <div class="col-xl-2">
          </div>
          <div class=" col-xl-8 " style="height: 500px; margin-bottom: 100px;">
           <h2>${notice.noticeTitle }</h2>
           <div style="float: right;">
	           <button class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 2px;" onclick="askUpdate();">수정</button>
	           <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-right: 2px;" onclick="askDelete();">삭제</button>
	           <button class="btn btn-outline-success my-2 my-sm-0" onclick="askList();" >목록</button>
           </div>
           <p style="padding-top: 0px; color:lightgray;">${notice.noticeDate }</p>
           
           <hr>
           <div id="content" style="height: 200px; ">
            ${notice.noticeContent }
           </div>
           
          <hr>

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
 
function replyUpdate() {
	var no=$("#askNo").val();
	$.ajax({
		url:'${path}/reply/selectReply.do',
		data:{"no":no},
		success:function(result){
			console.log(result.reply);
			$('#askFrm').html('<textarea id="replyContent" style="float:left; margin-bottom:60px;" class="form-control col-sm-10" rows="4">'+result.reply.replyContent+'</textarea><br/>'+
			'<button type="button" onclick="replyUpdateEnd();" class="btn btn-outline-success my-2 my-sm-0"style="margin-left:710px;float:left;" >수정완료</button>');
			$("#upDel").hide();
			
		}
	});
}
function replyUpdateEnd(){
	
	var result={'replyContent':$('#replyContent').val(),'replyRefNo':'${reply.replyRefNo}'};
	console.log(result);
	  
	$.ajax({
		url:'${path}/reply/updateReply.do',
		type:'POST',
		dataType:"json",
		data:result,
		success:function(result){
			console.log(result);
			
			if(result.result==1){
				location.reload();

			
			}
		}
	});
}
</script>
    
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>