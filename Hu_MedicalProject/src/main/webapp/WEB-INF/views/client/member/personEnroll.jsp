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
 .container-fluid-enroll {
     box-sizing: border-box;
     margin: 0 auto;
    
 }
 
 /* Full-width input fields */
 input[type=text], input[type=password] {
   width: 100%;
   height: 40px;
   padding: 10px;
   margin: 5px 0 22px 0;
   display: inline-block;
   background: #f1f1f1;
   border: 1px solid #ccc;
   border-radius: 4px;
   resize: vertical;
 }
 
 /* Add a background color when the inputs get focus */
 input[type=text]:focus, input[type=password]:focus {
   background-color: #ddd;
   outline: none;
 }
 
 button:hover {
   opacity:1;
   background-color: rgba(92, 216, 175, 0.466);
 }
 
 /* Extra styles for the cancel button */
 .cancelbtn {
   padding: 14px 20px;
   background-color: #DAF1DE;
 }
 .cancelbtn, .signupbtn {
   float: left;
   width: 50%;
   background-color: #DAF1DE;
   color: black;
   padding: 14px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   opacity: 0.9;
   border-radius: 4px;
 }
 /* Float cancel and signup buttons and add an equal width */
 .cancelbtn, .signupbtn {
   float: left;
   width: 50%;
 }
 
 /* Add padding to container elements */
 .container {
   padding: 16px;
 }
 
 
 /* Style the horizontal ruler */
 hr {
   border: 1px solid #f1f1f1;
   margin-bottom: 25px;
 }

 /* Clear floats */
 .clearfix::after {
   content: "";
   clear: both;
   display: table;
 }
 
 /* Change styles for cancel button and signup button on extra small screens */
 @media screen and (max-width: 300px) {
   .cancelbtn, .signupbtn {
      width: 100%;
   }
 }
 </style>
<div class="container-fluid-enroll">
	<form name="personEnrollFrm" id="personEnrollFrm" action="${path}/member/personEnrollEnd.do" method="post" onsubmit="return validate()" >
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6"> <h1 align="center">일반 회원가입</h1></div>
	  <div class="col"></div>
	</div>
	
	<div class="row">
	  <div class="col-xl-4"></div>
	  <div class="col-xl-4">
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="${path}/member/personEnroll.do">일반 회원</a> 
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="${path}/member/hospitalEnroll.do">병원 관계자 회원</a>
	  </div>
	  <div class="col-xl-4"></div>
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <label for="email"><b>이메일</b></label>
	    <input type="text" placeholder="@를 포함한 이메일 입력" id="email" name="email" required></p>
	  </div>
	  <div class="col"></div>
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <label for="name"><b>이름</b></label>
	    <input type="text" placeholder="Name" name="name" id="name" required>
	  </div>
	  <div class="col"></div>            
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <label for="psw"><b>비밀번호</b></label>
	     <input type="password" placeholder="Enter Password" id="password" name="password" required>
	      <p id="pwCheckFF" style="color: #FF6600; margin: 0;">
	 </div>
	  <div class="col"></div> 
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <label for="psw-repeat"><b>비밀번호 확인</b></p></label>
	    <input type="password" placeholder="Repeat Password"  id="psw-repeat" name="psw-repeat" required>
	  </div>
	  <div class="col"></div> 
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <label for="phone"><b>핸드폰 번호</b></label>
	    <input type="text" placeholder="-를 제외하고 입력" name="phone" id="phone" required>
	 </div>
	  <div class="col"></div>
	</div>
	
	<div class="row"> 
	  <div class="col"></div>
	  <div class="col-xl-6">
	    <button type="button" class="cancelbtn">취소</button>
	    <button type="submit" class="signupbtn">회원가입</button>
	   </div>
	  <div class="col"></div>
	</div>
	</form>
</div>
<script>
/* var regExp=/^[a-z][a-z\d]{3,11}/;
function validate(){
	if($("#${password}").val() != $("#${psw-repeat}").val()) {
		alert("비밀번호가 일치 하지 않습니다.");
		$("#${password}").focus();
		return false;
	}
} */
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
/* 	var id = $("#eamil").val();
	var name = $("#name").val();
	var psw = $("#password").val();
	var pswChk = $("#psw-repeat").val();
	var call = $("#phone").val(); */
	
	var pswCheck= /^(?=.*[A-Za-z])(?=.*[^a-zA-Z0-9])(?=.*[$@$!%*#?&])(?=.*[0-9]).{6,}$/; 
	var nameCheck=/^[가-힣]|[a-zA-Z]+$/; 
	var phoneCheck = /^\d{3}\d{3,4}\d{4}$/;

	//빈칸 검사
	if($("#eamil").val()==""){ 
		// alert("이메일을 입력하세요");         
		 $("#eamil").focus();   
		 return false;
	 }
	
	if($("#name").val()==""){
		// alert("이름을 입력하세요");
		 $("#name").focus();
		 return false;	 
	 }else if(!nameCheck.test($("#name").val())){
		//유효성 검사
		alert("이름을 알맞게 작성해주세요.");
		$("#name").focus();
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
	
	if($("#phone").val()==""){
		// alert("전화번호를 입력하세요");
		 $("#phone").focus();
		 return false; 
	}else if(phoneCheck.test($("#phone").val())==false){
		alert("핸드폰 번호를 알맞게 작성해주세요");
		$("#phone").focus();
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
</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>