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
input[type] {
	border:none;
	border-radius: 0;
	border-bottom: 1px solid #dfe0e2;
}

input[type]:focus, input[type=password]:focus {
	outline: none;
	box-shadow:none;
}

body{
	font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
}

</style>
<div class="container-fluid bg-light border">
	<div class="container bg-white my-5 border" style="width: 40%;">
	
		<div class="container border my-5" style="width:90%;">
			<div class="d-flex justify-content-center" style="border-bottom: 1px solid #dfe0e2;">
				<img class="my-5" src="${path }/resources/images/logo.png" height="50"/>
			</div>
			
			<h4 class="py-4">가입 정보 입력 후 가입 승인 요청을 해주세요.</h4>
			
			
			<form action="/action_page.php" id="form1" class="needs-validation" novalidate onsubmit="return validate();">
				<div class="border mb-5">
					<p><b>기본 정보</b></p>
					 <div class="form-group">
					   <input type="text" class="form-control" id="id" placeholder="아이디 (영문+숫자, 4~20자)" name="id" required autocomplete="off">
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
					 <div class="form-group">
					   <input type="password" class="form-control" id="pw" placeholder="비밀번호 (영문+숫자+특수문자 각 1자리 이상 포함, 총 6~18자)" name="pw" required>
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
					 <div class="form-group">
					   <input type="password" class="form-control" id="pw_repeat" placeholder="비밀번호 확인" required>
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
				</div>
			  
			
				<div class="border mb-5">
					<p><b>병원 정보</b></p>
					 <div class="form-group">
					   <input type="text" class="form-control" id="hospital_name" placeholder="병원명을 입력하세요" name="hospital_name" required autocomplete="off">
					 	<div class="invalid-feedback"></div>
					 </div>
					 <div class="form-group">
					   <input type="password" class="form-control" id="hospital_number" placeholder="요양기관 번호 (숫자, 8자)" name="hospital_number" required autocomplete="off">
					 	<div class="invalid-feedback"></div>
					 </div>
				</div>
			  
				<div class="border mb-5">
					<p><b>담당자 정보</b></p>
					<div class="form-group">
					  <input type="text" class="form-control" id="manager_name" placeholder="병원 담당자 이름" name="manager_name" required autocomplete="off">
						<div class="invalid-feedback"></div>
					</div>
					<div class="form-group">
					  <input type="email" class="form-control" id="email" placeholder="수신 가능한 이메일" name="email" required autocomplete="off">
					</div>
					<div class="form-group">
					  <input type="tel" class="form-control" id="phone" placeholder="휴대폰 번호 입력" name="phone" required autocomplete="off">
					</div>
				</div>
				
			  <div class="form-group form-check">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" name="remember" required>서비스 이용약관 및 개인정보 취급방침에 동의합니다.
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">Check this checkbox to continue.</div>
			    </label>
			  </div>
			  <button type="submit" id="btn1" class="btn btn-success btn-block">가입 승인 요청</button>
			</form>
		</div>
	</div>
</div>




<!-- <script>
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script> -->

<script>

	/* $(function(){
		
		var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
		
		
		$("#form1").on("change keyup", (function(){
			$("#btn1").removeAttr("disabled");
			$("#btn1").removeClass("btn-secondary");
			$("#btn1").addClass("btn-success");
		});
	}); */

	
</script>


<script>
$(function(){
	//이벤트 연결(아이디 유효성 검사)
	$("#id").blur(function(){
		checkId();
	});
	
	//비밀번호 유효성 검사
	$("#pw").blur(function(){
		checkPw();
	});
	
	//비밀번호 일치 확인
	$("#pw_repeat").blur(function(){
		checkPw2();
	});
	
	//입력했는지 확인
	$("#hospital_name").blur(function(){
		checkHospitalName();
	});
	
	//요양기관번호 유효성 검사
	$("#hospital_number").blur(function(){
		checkHospitalNumber();
	});
	
	$("#manager_name").blur(function(){
		checkManagerName();
	});
})

//아이디 유효성 검사
function checkId(){
	var id = $("#id");
	var id_reg =/^(?=\S*[a-zA-Z])(?=\S*[0-9]).{4,20}$/;
	id.next().hide();
	id.next().next().hide();
	
	if(id.val()==''){
		id.next().next().html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(id.val().search(/\s/) != -1){//아이디에 공백이 포함되어 있는 경우
		id.next().next().html('<p>아이디에 공백이 포함될 수 없습니다.</p>').show();
		return false;
	}
	if(!id_reg.test(id.val())){//아이디 생성 조건 만족하지 않는 경우
		id.next().next().html('<p>아이디 생성 조건을 만족하지 않습니다.</p>').show();
		return false;
	}else{//사용가능한 아이디(유효성 검사는 통과)
		//디비에 중복 아이디 있는지 확인
		$.ajax({
			url: "",
			data: {'id' : id},
			success: function(result){
				if(result){//디비에 중복되는 아이디가 없어서 사용가능한 아이디인 경우
					id.next().html('<p>사용가능한 아이디입니다.</p>').show();
				}else{
					id.next().next().html('<p>사용할 수 없는 아이디입니다.<br>중복된 아이디가 이미 존재합니다.</p>').show();
				}
			}
		});
		
		
	}
	
}

//비밀번호 유효성 검사
function checkPw(){
	var pw = $("#pw");
	var pw_reg =/^(?=\S*[a-zA-Z])(?=\S*[0-9])(?=\S*[`~!@#$%^&*|]).{6,18}$/;
	pw.next().hide();
	pw.next().next().hide();
	
	if(pw.val()==''){
		pw.next().next().html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(pw.val().search(/\s/) != -1){//비밀번호에 공백이 포함되어 있는 경우
		pw.next().next().html('<p>비밀번호에 공란이 포함될 수 없습니다.</p>').show();
		return false;
	}
	if(!pw_reg.test(pw.val())){//비밀번호 생성 조건 만족하지 않는 경우
		pw.next().next().html('<p>비밀번호 생성조건을 만족하지 않습니다.</p>').show();
		return false;
	}else{//사용할 수 있는 비밀번호인 경우
		pw.next().html('<p>사용할 수 있는 비밀번호입니다.</p>').show();
	}
}

//비밀번호 일치 여부 검사
function checkPw2(){
	var pw = $("#pw");
	var pw2 = $("#pw_repeat");
	pw2.next().hide();
	pw2.next().next().hide();
	
	if(checkPw()!=false){
		if(pw.val()==pw2.val()){
			pw2.next().html('<p>비밀번호가 일치합니다.</p>').show();
		}else{
			pw2.next().next().html('<p>비밀번호가 일치하지 않습니다.</p>').show();
			return false;
		}
	}else{
		pw2.next().next().html('<p>비밀번호를 먼저 입력해주세요.</p>').show();
		return false;
	}
	
}

function checkHospitalName(){
	var hospitalName = $("#hospital_name");
	hospitalName.next().hide();
	
	if(hospitalName.val().trim()==''){
		hospitalName.next().html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
}

function checkHospitalNumber(){
	var hospitalNumber = $("#hospital_number");
	var hp_num_reg =/^[0-9]{8}$/;
	hospitalNumber.next().hide();
	
	if(hospitalNumber.val().trim()==''){
		hospitalNumber.next().html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(!hp_num_reg.test(hospitalNumber.val())){
		hospitalNumber.next().html('<p>요양기관 번호를 잘못 입력하였습니다.</p>').show();
		return false;
	}
}

function checkManagerName(){
	var managerName = $("#manager_name");
	managerName.next().hide();
	
	if(managerName.val().trim()==''){
		managerName.next().html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
}

function checkEmail(){
	var email = $("#email");
	managerName.next().hide();
}


function validate(){
	
	
	
	//병원명 입력 여부 확인
	//요양기관 번호 입력 여부 확인
	//담당자 이름 입력 여부
	
	//**이메일 주소 유효성 검사
	//**휴대폰 번호 유효성 검사
	
	
}

</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>