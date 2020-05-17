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
.findEmailOk{
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
  <form class="modal-content animate" action="${path}/goMain.do" method="post" style="width:50%;">
    <br><br><br>
   <div class="pswCode" style="margin:0 auto;">
   <h2 class="text-center">${name }+님의 아이디</h2>
      <span>${email }</span>
       <div style="text-align:center;">
      <button class="findEmailOk" type="submit" style="background-color:#DAF1DE">확인</button>
      </div>
   </div>
  <div><br><br></div>
     
  </form>
</div>
</section>
<script>

</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>