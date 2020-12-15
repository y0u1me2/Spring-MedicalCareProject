<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<style>
input[type=password]#pswchange,input[type=password]#pswCheck{
	height: 40px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
.pswsubmit{
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
<div id="containerPswChange">
  <form class="modal-content animate" action="${path}/hpPswChange" method="post" style="width:50%;" onsubmit="return validate()">
    <br><br><br>
   <div class="pswChange" style="margin:0 auto;">
   <h2 class="text-center">비밀번호 변경</h2>
       <input type="password" class="member_pass" name="pswchange" id="pswchange" placeholder="비밀번호 입력해 주세요" required><br>
       <input type="password" class="member_passChk" name="pswCheck" id="pswCheck" placeholder="비밀번호 다시한번 더 입력해 주세요" required >
      <p id="pwCheckFF" style="color: #FF6600; margin: 0;"> </p><br><br>
      <div style="text-align:center;">
      <button class="pswsubmit" type="submit" style="background-color:#DAF1DE">비밀번호 변경 완료</button>
      </div>
       <input type="hidden" value="${hospitalEmail }" id="hospitalEmail" name="hospitalEmail">
      
   </div>
  <div><br><br></div>
     
  </form>
</div>

</section>
<script>
$(document).ready(function(){
	$("#pswchange").keyup(function(){
		$("#pwCheckFF").text("");
	});
	$('#pswCheck').keyup(function(){
		if($('#pswchange').val()!=$('#pswCheck').val()){
			$('#pwCheckFF').text(''); 
			$('#pwCheckFF').html("패스워드 확인이 불일치 합니다"); 
		}else{
			$('#pwCheckFF').text(''); 
			$('#pwCheckFF').html("<font color='#70AD47'>패스워드가 일치 합니다.</font>"); 
			} 
		});
});
function validate(){
	var pswCk= /^(?=.*[A-Za-z])(?=.*[^a-zA-Z0-9])(?=.*[$@$!%*#?&])(?=.*[0-9]).{6,}$/; 
	
	if($("#pswchange").val()==""){
		// alert("비밀번호를 입력하세요");
		 $("#pswchange").focus();
		 return false;
	 }else if(!pswCk.test($("#pswchange").val())){
		alert("비밀번호는 6자 이상 영문자, 숫자, 특수문자를 포함해야 합니다.");
		 $("#pswchange").focus();
		 return false;
	}
	
	if($("#pswCheck").val()==""){
		// alert("비밀번호 확인을 입력하세요");
		 $("#pswCheck").focus();
		 return false;
	 }
}
</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>