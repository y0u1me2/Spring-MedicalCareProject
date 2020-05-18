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
input[type=text],input[type=password] {
	border:none;
	border-radius: 0;
	border-bottom: 1px solid #dfe0e2;
	width:100%;
	padding: 10px;
}

input[type=text]:focus, input[type=password]:focus {
	outline: none;
	box-shadow:none;
}

body{
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
}

form a:link, form a:visited, form a:hover { 
	color: black; 
	text-decoration: underline;
}

</style>
<div class="container-fluid bg-light border">
	<div class="container bg-white my-5 pb-5" style="width: 40%;">
	
		<div class="container" style="width:90%;">
			<div class="d-flex justify-content-center" style="border-bottom: 1px solid #dfe0e2;">
				<img class="my-5" src="${path }/resources/images/logo.png" height="50"/>
			</div>
			
			<h4 class="py-4">일반 회원의 회원가입 페이지 입니다.</h4>
			
			
			<form name="personEnrollFrm" id="personEnrollFrm" action="${path}/member/personEnrollEnd.do" method="post" onsubmit="return validate()" >
				<div class="mb-5">
					<p><b>일반 회원 기본 정보</b></p>
					 <div class="form-group">
					  <input type="text" placeholder="이메일 ( @를 포함한 이메일 입력 )" id="email" name="email" style="width:330px;" required>
					<button type="button" id="emailOK" name="emailOK" onclick="emailOk();">중복체크</button>
					 </div>
					<div class="form-group">
					   <input type="text" placeholder="이름 ( 실명 ) 입력" name="joinName" id="joinName" required>
					 </div>
					 <div class="form-group">
					   <input type="password" placeholder="비밀번호 ( 6자 이상 영문자, 숫자, 특수문자를 포함 )" id="password" name="password" required>
	   				   <p id="pwCheckFF" style="color: #FF6600; margin: 0;">
					 </div>
					 <div class="form-group">
					   <input type="password" placeholder="비밀번호 확인"  id="psw-repeat" name="psw-repeat" required>
					 </div>
					<div class="form-group">
					  <input type="text" placeholder="전화 번호 ( -를 제외하고 입력 )" name="joinPhone" id="joinPhone" required>
					 </div>
				</div>	
				
			  <div class="form-group form-check">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" name="remember" id="agree" required/><a href="javascript:void(0);" onclick="openModal1();">서비스 이용약관</a> 및 <a href="javascript:void(0);" onclick="openModal2();">개인정보 취급방침</a>에 동의합니다.
			      <div class="invalid-feedback">Check this checkbox to continue.</div>
			    </label>
			  </div>
			  <button type="submit" id="btn1" class="btn btn-success btn-block">회원가입</button>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modal1">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content w-100">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">서비스 이용약관</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="closeModal();">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<jsp:include page="/WEB-INF/views/client/member/이용약관.jsp"/>
        </div>
      </div>
    </div>
</div>


<div class="modal fade" id="modal2">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content w-100">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">개인정보 취급방침</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="closeModal();">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<jsp:include page="/WEB-INF/views/client/member/개인정보.jsp"/>
        </div>
      </div>
    </div>
</div>
<script>

$(document).ready(function(){
	$("#password").keyup(function(){
		$("#pwCheckFF").text("");
	});
	$('#psw-repeat').keyup(function(){
		if($('#password').val()!=$('#psw-repeat').val()){
			$('#pwCheckFF').text(''); 
			$('#pwCheckFF').html("패스워드 확인이 불일치 합니다"); 
		}else{
			$('#pwCheckFF').text(''); 
			$('#pwCheckFF').html("<font color='#70AD47'>패스워드가 일치 합니다.</font>"); 
			} 
		});
});
function validate(){
	
	var pswCheck= /^(?=.*[A-Za-z])(?=.*[^a-zA-Z0-9])(?=.*[$@$!%*#?&])(?=.*[0-9]).{6,}$/; 
	var nameCheck=/^[가-힣]|[a-zA-Z]+$/; 
	var phoneCheck = /^\d{3}\d{3,4}\d{4}$/;
	var emailCheck=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	//빈칸 검사
	if($("#email").val()==""){ 
		// alert("이메일을 입력하세요");         
		 $("#email").focus();   
		 return false;
	 }else if(!emailCheck.test($("#email").val())){
		//유효성 검사
		alert("이메일 형식이 맞지 않습니다.");
		$("#email").focus();
		 return false;
    }
	
	if($("#joinName").val()==""){
		// alert("이름을 입력하세요");
		 $("#joinName").focus();
		 return false;	 
	 }else if(!nameCheck.test($("#joinName").val())){
		//유효성 검사
		alert("이름을 알맞게 작성해주세요.");
		$("#joinName").focus();
		 return false;
	}
	
	if($("#password").val()==""){
		// alert("비밀번호를 입력하세요");
		 $("#password").focus();
		 return false;
	 }else if(!pswCheck.test($("#password").val())){
		alert("비밀번호는 6자 이상 영문자, 숫자, 특수문자를 포함해야 합니다.");
		 $("#password").focus();
		 return false;
	}
	
	if($("#psw-repeat").val()==""){
		// alert("비밀번호 확인을 입력하세요");
		 $("#psw-repeat").focus();
		 return false;
	 }
	
	if($("#joinPhone").val()==""){
		// alert("전화번호를 입력하세요");
		 $("#joinPhone").focus();
		 return false; 
	}else if(phoneCheck.test($("#phone").val())==false){
		alert("핸드폰 번호를 알맞게 작성해주세요");
		$("#joinPhone").focus();
		 return false;
	}
	
	//비밀번호 확인 체크
	if($('#password').val()!=$('#psw-repeat').val()){
		// alert("비밀번호 확인이 일치하지 않습니다.");
		$('#psw-repeat').focus();
		return false;
	}
	$("#personEnrollFrm").submit();
}
function emailOk(){
	var email = $('#email').val();
	console.log(email);
	
	$.ajax({
		url:"${path }/emailOk",
		data:{"email":email},
		success:function(data){
			console.log("이거디"+data.member);
			
			if(data.member != 1){
				alert("존재하는 이메일 입니다. 다른 이메일을 사용하세요!");
				email.focus();
			}else{
				alert("사용가능한 이메일 입니다.");
			}
			
		}
	})
} 
function openModal1(){
	$("#modal1").modal();
	$('html').css({'overflow': 'hidden'});
}

function openModal2(){
	$("#modal2").modal();
	$('html, body').css({'overflow': 'hidden'});
}

function closeModal(){
	$('html, body').css({'overflow': 'auto'});
}
function checkAgree(){
	var agree = $("#agree");
	agree.siblings(".invalid-feedback").hide();
	
	if(agree.is(":checked")==false){
		agree.siblings(".invalid-feedback").show();
		return false;
	}
}
</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>