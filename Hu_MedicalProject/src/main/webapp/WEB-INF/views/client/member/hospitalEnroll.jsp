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
			
			<h4 class="py-4">가입 정보 입력 후 가입 승인 요청을 해주세요.</h4>
			
			
			<form action="${path}/hospitalEnrollEnd.do" method="post" id="form1" class="needs-validation" novalidate onsubmit="return validate();">
				<div class="mb-5">
					<p><b>기본 정보</b></p>
					 <div class="form-group">
					   <input type="text" class="form-control" id="id" placeholder="아이디 (영문+숫자, 4~20자)" name="id" required autocomplete="off">
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
					 <div class="form-group">
					   <input type="password" class="form-control" id="pw" placeholder="비밀번호 (영문+숫자+특수문자 각 1자리 이상 포함, 총 6~18자)" name="password" required>
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
					 <div class="form-group">
					   <input type="password" class="form-control" id="pw_repeat" placeholder="비밀번호 확인" required>
					   <div class="valid-feedback">Valid.</div>
					   <div class="invalid-feedback">Please fill out this field.</div>
					 </div>
				</div>
			  
			
				<div class="mb-5">
					<p><b>병원 정보</b></p>
					 <!-- <div class="form-group">
					 	<div class="input-group mb-3">
					   		<input list ="hospitalList" type="text" class="form-control" id="hospital_name" placeholder="가입병원을 선택하세요" name="hospitalName" required autocomplete="off">
					 		<div class="input-group-append">
								<button id="btnSearch" class="btn btn-light" type="button">검색하기</button>
							</div>
						 	<datalist id="hospitalList">
						 		<option id="1" value="병원1"></option>
						 		<option id="2" value="병원2"></option>
						 	</datalist>
						</div>
					 	<div class="invalid-feedback"></div>
					 </div> -->
					 
					 
					 <div class="form-group">
					   <input type="text" class="form-control" id="hospital_number" placeholder="요양기관 번호 (8자)" name="hospNo" required autocomplete="off">
					 	<div class="invalid-feedback"></div>
					 </div>
				</div>
			  
				<div class="mb-5">
					<p><b>담당자 정보</b></p>
					<div class="form-group">
					  <input type="text" class="form-control" id="manager_name" placeholder="병원 담당자 이름" name="managerName" required autocomplete="off">
						<div class="invalid-feedback"></div>
					</div>
					<div class="form-group">
					  <input type="email" class="form-control" id="email" placeholder="수신 가능한 이메일" name="managerEmail" required autocomplete="off">
					  <div class="invalid-feedback"></div>
					</div>
					<div class="form-group">
					  <input type="tel" class="form-control" id="phone" placeholder="휴대폰 번호 입력" name="managerPhone" required autocomplete="off">
					  <div class="invalid-feedback"></div>
					</div>
				</div>
				
			  <div class="form-group form-check">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" name="remember" id="agree" required/><a href="javascript:void(0);" onclick="openModal1();">서비스 이용약관</a> 및 <a href="javascript:void(0);" onclick="openModal2();">개인정보 취급방침</a>에 동의합니다.
			      <div class="invalid-feedback">Check this checkbox to continue.</div>
			    </label>
			  </div>
			  <button type="submit" id="btn1" class="btn btn-success btn-block">가입 승인 요청</button>
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

<!-- <script>
	$(function(){
		
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
		})
	});
</script> -->


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
	
	$("#email").blur(function(){
		checkEmail();
	});
	
	$("#phone").blur(function(){
		checkPhone();
	});
	
	$("#agree").change(function(){
		checkAgree();
	}); */
	
	
	
})

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

function getList(){
	var inputbox = $("#hospital_name");
	var name = $("#hospital_name").val();
	var datalist = $("#hospitalList");
	
	datalist.empty();
	
	$.ajax({
		url: "${path}/getHospList.do",
		type: "post",
		data: {name:name},
		dataType: 'json',
		success: function(data){
			if(data.length==0){
				alert("검색 결과가 없습니다.");	
			}else{
				for(i in data){
					var hospName = data[i].hospName;
					var hospAddr = data[i].hospAddr;
					var hospNo = data[i].hospNo;
					
					/* $("<option>").attr({"label": hospAddr, "id": hospNo}).html(hospName).appendTo(datalist).on("change", $("#hospital_number").val(hospName)); */
					var option = $("<option>").attr({"label": hospAddr, "id": hospNo}).html(hospName);
					option.appendTo(datalist);
				}
			}
			
			/* if(data.response.body.items==""){
				alert("검색 결과가 없습니다.");
			}else{
				var arr = data.response.body.items.item;
				
				for(i in arr){
					var lat = arr[i].YPos;
					var lng = arr[i].XPos;
					var hName = arr[i].yadmNm;
					var addr = arr[i].addr;
					var homepage = arr[i].hospUrl;
					var tel = arr[i].telno;
					var code = arr[i].ykiho;
					
					$("<option>").attr("label", addr).html(hName).appendTo(hospitalList);
				}
				hospitalList.focus();
				
			} */
		}
	});
}






//아이디 유효성 검사
function checkId(){
	var id = $("#id");
	var id_reg =/^(?=\S*[a-zA-Z])(?=\S*[0-9]).{4,20}$/;
	id.siblings(".invalid-feedback").hide();
	id.siblings(".valid-feedback").hide();
	
	if(id.val()==''){
		id.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(id.val().search(/\s/) != -1){//아이디에 공백이 포함되어 있는 경우
		id.siblings(".invalid-feedback").html('<p>아이디에 공백이 포함될 수 없습니다.</p>').show();
		return false;
	}
	if(!id_reg.test(id.val())){//아이디 생성 조건 만족하지 않는 경우
		id.siblings(".invalid-feedback").html('<p>아이디 생성 조건을 만족하지 않습니다.</p>').show();
		return false;
	}else{//사용가능한 아이디(유효성 검사는 통과)
		//디비에 중복 아이디 있는지 확인
		/* $.ajax({
			url: "",
			data: {'id' : id},
			success: function(result){
				if(result){//디비에 중복되는 아이디가 없어서 사용가능한 아이디인 경우
					id.next().html('<p>사용가능한 아이디입니다.</p>').show();
				}else{
					id.next().next().html('<p>사용할 수 없는 아이디입니다.<br>중복된 아이디가 이미 존재합니다.</p>').show();
				}
			}
		}); */
		
		
	}
	
}

//비밀번호 유효성 검사
function checkPw(){
	var pw = $("#pw");
	var pw_reg =/^(?=\S*[a-zA-Z])(?=\S*[0-9])(?=\S*[`~!@#$%^&*|]).{6,18}$/;
	pw.siblings(".invalid-feedback").hide();
	pw.siblings(".valid-feedback").hide();
	
	if(pw.val()==''){
		pw.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(pw.val().search(/\s/) != -1){//비밀번호에 공백이 포함되어 있는 경우
		pw.siblings(".invalid-feedback").html('<p>비밀번호에 공란이 포함될 수 없습니다.</p>').show();
		return false;
	}
	if(!pw_reg.test(pw.val())){//비밀번호 생성 조건 만족하지 않는 경우
		pw.siblings(".invalid-feedback").html('<p>비밀번호 생성조건을 만족하지 않습니다.</p>').show();
		return false;
	}else{//사용할 수 있는 비밀번호인 경우
		pw.siblings(".valid-feedback").html('<p>사용할 수 있는 비밀번호입니다.</p>').show();
	}
}

//비밀번호 일치 여부 검사
function checkPw2(){
	var pw = $("#pw");
	var pw2 = $("#pw_repeat");
	pw2.siblings(".invalid-feedback").hide();
	pw2.siblings(".valid-feedback").hide();
	
	if(checkPw()!=false){
		if(pw.val()==pw2.val()){
			pw2.siblings(".valid-feedback").html('<p>비밀번호가 일치합니다.</p>').show();
		}else{
			pw2.siblings(".invalid-feedback").html('<p>비밀번호가 일치하지 않습니다.</p>').show();
			return false;
		}
	}else{
		/* pw2.next().next().html('<p>비밀번호를 먼저 입력해주세요.</p>').show(); */
		return false;
	}
	
}

function checkHospitalName(){
	var hospitalName = $("#hospital_name");
	hospitalName.siblings(".invalid-feedback").hide();
	
	if(hospitalName.val().trim()==''){
		hospitalName.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
}

function checkHospitalNumber(){
	var hospitalNumber = $("#hospital_number");
	var hp_num_reg =/^[A-Za-z][0-9]{7}$/;
	hospitalNumber.siblings(".invalid-feedback").hide();
	
	if(hospitalNumber.val().trim()==''){
		hospitalNumber.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(!hp_num_reg.test(hospitalNumber.val())){
		hospitalNumber.siblings(".invalid-feedback").html('<p>요양기관 번호를 잘못 입력하였습니다.</p>').show();
		return false;
	}
}

function checkManagerName(){
	var managerName = $("#manager_name");
	managerName.siblings(".invalid-feedback").hide();
	
	if(managerName.val().trim()==''){
		managerName.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
}

function checkEmail(){
	var email = $("#email");
	var email_reg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	email.siblings(".invalid-feedback").hide();
	
	if(email.val().trim()==''){
		email.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(!email_reg.test(email.val())){
		email.siblings(".invalid-feedback").html('<p>이메일 주소를 잘못 입력하였습니다.</p>').show();
		return false;
	}
}

function checkPhone(){
	var phone = $("#phone");
	var phone_reg1 = /^01[0179][0-9]{7,8}$/;
	var phone_reg2 = /^01[0179]-[0-9]{3,4}-[0-9]{4}$/;
	phone.siblings(".invalid-feedback").hide();
	
	if(phone.val().trim()==''){
		phone.siblings(".invalid-feedback").html('<p>필수 입력 항목입니다.</p>').show();
		return false;
	}
	if(!phone_reg1.test(phone.val())&&!phone_reg2.test(phone.val())){
		phone.siblings(".invalid-feedback").html('<p>휴대폰 번호를 잘못 입력하였습니다.</p>').show();
		return false;
	}
}

function checkAgree(){
	var agree = $("#agree");
	agree.siblings(".invalid-feedback").hide();
	
	if(agree.is(":checked")==false){
		agree.siblings(".invalid-feedback").show();
		return false;
	}
}



function validate(){
	var result = true;
	
	if(checkId()==false) result = false;
	if(checkPw()==false) result = false;
	if(checkPw2()==false) result = false;
	if(checkHospitalNumber()==false) result = false;
	if(checkManagerName()==false) result = false;
	if(checkEmail()==false) result = false;
	if(checkPhone()==false) result = false;
	if(checkAgree()==false) result = false;
	
	return result;
	
	
	/* checkPw();
	checkPw2();
	checkHospitalName();
	checkHospitalNumber();
	checkManagerName();
	checkEmail();
	checkPhone(); */
	
	
	/* if(checkId()==false) return false;
	if(checkPw()==false) return false;
	if(checkPw2()==false) return false;
	if(checkHospitalName()==false) return false;
	if(checkHospitalNumber()==false) return false;
	if(checkManagerName()==false) return false;
	if(checkEmail()==false) return false;
	if(checkPhone()==false) return false; */
	/* if(checkId()==false || checkPw()==false || checkPw2()==false || checkHospitalName()==false || checkHospitalNumber()==false || checkManagerName()==false || checkEmail()==false || checkPhone()==false){
		return false;	
	}else{
		return true;
	} */
}

</script>
<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>