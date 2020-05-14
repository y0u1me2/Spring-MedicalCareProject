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

</style>
<section>
<div id="section-container">
	    <div class="container-fluid"  >
	        <div class="row">
	            <div class="col-xl-1 ">
	            </div>
	            <div class="col-xl-10 " style="padding-left:450px;margin-top:50px;font-size: 30px;">
	            비밀번호 변경
	        </div>
	        <div class="col-xl-1 ">
	        </div>
	    	</div>
	    	<div class="container" style="text-align:center;">
				
		<form name="boardFrm" action="${path}/pswChange?email=${email}" method="post" onsubmit="return validate()">
	      
	             <div class="mb-3">
	                 <label for="title">변경할 비밀번호 입력</label>
	                 <input type="password" class="member_pass" name="pswchange" id="pswchange" placeholder="비밀번호 입력해 주세요" required>
	             </div>
	 			 <p id="pwCheckFF" style="color: #FF6600; margin: 0;">
	             <div class="mb-3">
	                 <label for="noticeWriter">비밀번호 확인</label>
	                 <input type="password" class="member_passChk" name="pswCheck" id="pswCheck" placeholder="비밀번호 다시한번 더 입력해 주세요" required >
	             </div>
	
	         <div class="btns">
	             <button type="submit" id="pswsubmit" >등록</button>
	         </div>
	         </form>
		</div>
		</div>
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
	 }else if(!pswCheck.test($("#pswchange").val())){
		alert("비밀번호는 6자 이상 영문자, 숫자, 특수문자를 포함해야 합니다.");
		 $("#pswchange").focus();
		 return false;
	}
	
	if($("#pswchange").val()==""){
		// alert("비밀번호 확인을 입력하세요");
		 $("#pswchange").focus();
		 return false;
	 }
}
</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>