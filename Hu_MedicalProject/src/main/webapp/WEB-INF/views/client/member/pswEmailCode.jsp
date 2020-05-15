<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp">
<jsp:param value="" name="title"/>
</jsp:include>
<style>
input[type=text]#pswcode{
	height: 40px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
.findPswBtn{
  color: black;
  padding: 10px 10px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width:200px;
  height:40px;
}
</style>
<section>
<!-- 인증번호 확인 창 -->
<div id="containerPswCode">
  <form class="modal-content animate" action="${path}/injeungNumChk.do" method="post" style="width:50%;">
    <br><br><br>
   <div class="pswCode" style="margin:0 auto;">
   <h2 class="text-center">인증번호 확인</h2>
      <input type="text" placeholder="인증번호 작성" id="pswcode" name="pswcode" autocomplete="off" required><br>
      <input type="hidden" value="${dice }" id="injeungNum" name="injeungNum">
      <input type="hidden" value="${memberEmail }" id="memberEmail" name="memberEmail">
       <div style="text-align:center;">
      <button class="findPswBtn" type="submit" style="background-color:#DAF1DE">인증번호 전송</button>
      </div>
   </div>
  <div><br><br></div>
     
  </form>
</div>
</section>
<script>
/* function numberChk(){
	if($('#injeungNum') != $('#pswcode')){
		alert("인증번호를 다시한번 확인해 주세요!");
		 $("#pswcode").focus();
		 return false;
	}else{
		location.href="${path}/injeungNumChk.do";
	}
} */
</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>