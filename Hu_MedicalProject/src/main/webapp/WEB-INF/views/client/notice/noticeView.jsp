<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
	<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo }">
   <div class="container-fluid" style="padding-top:60px;">
        <div class="row">
          <div class="col-xl-2"></div>
          <div class=" col-xl-8 " style="height: 500px; margin-bottom: 100px;">
           <h2>${notice.noticeTitle }</h2>
           <div style="float: right;">
            <c:if test="${loginMember.email eq 'admin' }">
	           <button class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 2px;" onclick="noticeUpdate();">수정</button>
	           <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-right: 2px;" onclick="noticeDelete();">삭제</button>
	         </c:if>
	           <button class="btn btn-outline-success my-2 my-sm-0" onclick="noticeList();" >목록</button>
           </div>
           <p style="padding-top: 0px; color:lightgray;">${notice.noticeDate }</p>
           
           <hr>
           <c:forEach items="${files }" var="f" varStatus="vs">
            <button type="button" 
                    class="btn btn-outline-success btn-block"
                    onclick="fileDownLoad('${f.originalFilename}','${f.renamedFilename }');">
            	    첨부파일${vs.count } - ${f.originalFilename }
            </button>
        </c:forEach>
        <hr>
           <div id="content" style="height: 200px; ">
           <c:out value=" ${notice.noticeContent }"/>
           </div>
           
     
		
  		
          </div>
          </div>
          </div>
          
<script>

function noticeUpdate(){
	location.replace('${path }/notice/noticeUpdate?no=${notice.noticeNo }');
}

function noticeList(){
	location.replace('${path }/notice/noticeList');
}

function noticeDelete(){
	if(confirm("삭제하시겠습니까?")){
		location.replace('${path }/notice/noticeDelete?no=${notice.noticeNo }');
	}
}
function fileDownLoad(ori,rename){
	ori=encodeURIComponent(ori);
	location.href="${path}/notice/fileDownload?oName="+ori+"&rName="+rename;
}
</script>
    
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>