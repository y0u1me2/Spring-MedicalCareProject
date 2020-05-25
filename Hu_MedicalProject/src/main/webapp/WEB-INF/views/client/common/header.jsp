<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
    <script src="https://wowjs.uk/dist/wow.min.js"></script>
     <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    <meta name="google-signin-client_id" content="415129597970-epgotkdffasbd0r2mqq4shuirovnqsqp.apps.googleusercontent.com">

<!-- 파비콘 -->
   <link rel ="icon" type="image/png"
        href="/resources/images/logo5.png"/>
    <title>Hospital for You</title>
    
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
</head>
<body>
<c:if test="${loginMember eq null and loginHpMember eq null  }">
 	 <nav class="navbar navbar-expand" style="background-color:#DAF1DE;padding-left:100px;">
</c:if>
 <c:if test="${loginMember != null or loginHpMember !=null  }">
 	 <nav class="navbar navbar-expand" style="background-color:#DAF1DE;padding-left:10px;">
</c:if>
    <!-- Brand/logo -->
    <img src="${pageContext.request.contextPath }/resources/images/logo5.png" style="width:50px; padding-right:8px;">
    <a class="navbar-brand" href="${pageContext.request.contextPath }" style="color:black;">HU</a>
    <!-- Links -->
    <ul class="navbar-nav">
     <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		  회사소개
		</a>
		<div class="dropdown-menu">
		  <a class="dropdown-item" href="${path }/about">About HU</a>
		  <a class="dropdown-item" href="${path }/service">서비스 소개</a>
		  <a class="dropdown-item" href="${path }/notice/noticeList">공지사항</a>
		</div>
	</li>
        <%-- <li class="nav-item">
          </li> --%>
      <li class="nav-item">
        <a class="nav-link" href="${path }/rv/reservationList" >병원접수</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/healthInfo/healthInfoMain">건강정보</a>
      </li>
      
      <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		  병원/약국 찾기
		</a>
		<div class="dropdown-menu">
		  <a class="dropdown-item" href="${path }/map/hospitalMap">병원 찾기</a>
		  <a class="dropdown-item" href="${path }/map/pharmacyMap">약국 찾기</a>
		</div>
	</li>
      
     
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">의약품 검색</a>

      </li>  
       -->
      

       <c:if test="${loginMember != null or loginHpMember !=null  }">
<%--        <c:if test="${loginMember ne null }"> --%>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
	        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="${path }/care/careNotice">돌보미 찾기</a>
	            <a class="dropdown-item" href="${path }/ask/ask.do">문의 게시판</a>
	        </div>
	      </li>
    </c:if>
     <c:if test="${loginMember.email== 'admin' }">
      <li class="nav-item">
        <a class="nav-link" href="${path }/admin/admin.do">관리자전용</a>
      </li>
      </c:if>
    
    <c:choose>
         <c:when test = "${empty loginMember and empty loginHpMember}">
          <!--  <li class="nav-item" style="margin-left:250px;">
             <button  style="width:auto;">로그인</button>
          </li> -->
          <li class="nav-item" style="margin-left:250px;">
            <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('loginChoice').style.display='block'">로그인</button>
            <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('joinChoice').style.display='block'" style="width:auto;">회원가입</button>
          </li>
         </c:when>
         <c:when test = "${not empty loginMember }">
			<li class="nav-item" style="margin-left:100px;">
				<a href="${path }/myPage/myPageMain" style="align:right;" ><c:out value="${loginMember.name }"></c:out> 님</a>
				<button type="button" class="btn btn-outline-dark" onclick="signOut()">로그아웃</button>
				   <button class="btn btn-outline-dark" type="button"
						onclick="accessChatting('${loginMember.email}');">관리자  실시간 문의</button>
	        </li>
         </c:when>
         <c:when test = "${not empty loginHpMember }">
			<li class="nav-item" style="margin-left:100px;">
				<a href="#" style="align:right;"><c:out value="${loginHpMember.id }"></c:out> 님</a>
				<button type="button" class="btn btn-outline-dark" onclick="location.replace('${path}/member/hospitalLogout.do')">로그아웃</button>
				 <button class="btn btn-outline-dark" type="button"
						onclick="hpAdminAccessChatting('${loginHpMember.id}');">관리자  실시간 문의</button>  
	        </li>
         </c:when>
         <c:otherwise>
         </c:otherwise>
      </c:choose>
    </ul>
 </nav>
<!-- 로그인 선택 모달 -->
<div id="loginChoice" class="modal" >
  <form class="modal-content animate" method="post" style="width:50%;">
  
      <div class="imgcontainer" style="height:10px">
        <span onclick="document.getElementById('loginChoice').style.display='none'" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
        <!-- <br>
          <h2 align="center">[회원가입]</h2>
          <hr> -->
      </div>
      <br>
      <div id="loginChoice1" > 
            &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-success" onclick="personLogin();" id="personLoginsBtn" style="width: 200px;height: 200px;">
	            <img src="${path }/resources/images/person.png" width="100px">
	            <br>
	            일반 회원 로그인
            </button>
            &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-info" onclick="hospitalLogin();" id="hospitalLoginBtn" style="width: 200px;height: 200px;">
            <img src="${path }/resources/images/doctor.png" width="100px"><br>
                   병원 관계자 로그인
            </button>
     </div>
  <div><br><br></div>
     
  </form>
</div>
<!-- 회원가입 선택 모달 -->
<div id="joinChoice" class="modal">
  <form class="modal-content animate" method="post" style="width:50%;">
  
      <div class="imgcontainer" style="height:10px">
        <span onclick="document.getElementById('joinChoice').style.display='none'" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
        <!-- <br>
          <h2 align="center">[회원가입]</h2>
          <hr> -->
      </div>
      <br>
      <div id="JoinChoice1" > 
            &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-success" onclick="personEnroll();" id="personjoinBtn" style="width: 200px;height: 200px;">
	            <img src="${path }/resources/images/person.png" width="100px">
	            <br>
	            일반 회원 가입
            </button>
            &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-info" onclick="hospitalEnroll();" id="hospitaljoinBtn" style="width: 200px;height: 200px;">
            <img src="${path }/resources/images/doctor.png" width="100px"><br>
                   병원 관계자 회원 가입
            </button>
     </div>
  <div><br><br></div>
     
  </form>
</div>

 <!-- 일반 로그인 -->
<div id="id01" class="modalLogin" style="display: none; z-index:2; " >
  
  <form class="modal-content animate" id="loginForm" name="loginForm" action="${path }/member/memberLogin.do" method="post" style="width:30%;">
   
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="loginClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      <br><br><br>
     <img src="${path }/resources/images/logo.png" id="loginLogo" style="width:70%;height:50%;">
     
    </div>

    <div class="containerlogin">
      <input type="text" placeholder="E-mail" id="uemail" name="email" autocomplete="off" required>
      <input type="password" placeholder="Password" id="psw" name="password" required>
      <label>
        <input type="checkbox" id="store" name="saveId">이메일 저장
      </label>

      <button onclick="loginCheck();" class="login-button" type="submit" style="background-color:#DAF1DE;">일반 Login</button>   
      <br>
        <div style="text-align:center;">간편한 SNS로그인</div>
            <br>
         <!--   <div class="g-signin2" data-onsuccess="onSignIn" ></div> -->
           <div id="my-signin2"></div>
    </div>
    <div class="containerlogin" style="background-color:white; margin:0 auto;">
    	<button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findEmail').style.display='block'">아이디 찾기</button>
        &nbsp;/&nbsp;
         <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findPsw').style.display='block'">비밀번호 찾기</button>
    </div>
    
  </form>
</div>
 <!-- 관계자 로그인 -->
<div id="id02" class="modalLogin" style="display: none; z-index:2;">
  
  <form class="modal-content animate" id="HPloginForm" name="HPloginForm" action="${path }/member/hospitalLogin.do" method="post" style="width:30%;">
   
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="loginClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      <br><br><br>
     <img src="${path }/resources/images/logo.png" id="loginLogo" style="width:70%;height:50%;">
    
    </div>

    <div class="containerlogin">
	      <input type="text" placeholder="아이디" id="hospitalId" name="id" autocomplete="off" required>
	      <input type="password" placeholder="비밀번호" id="hospitalPsw" name="password" required>
	      <label>
	        <input type="checkbox" id="store1" name="saveId">아이디 저장
	      </label>
	
	      <button onclick="loginCheck();" class="login-button" type="submit" style="background-color:#DAF1DE;">병원 회원 Login</button>   
	
	     <div class="containerlogin" style="background-color:white; text-align:center;">
	    	<button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findHPEmail').style.display='block'">아이디 찾기</button>
	        &nbsp;/&nbsp;
	         <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findHPPsw').style.display='block'">비밀번호 찾기</button>
	    </div>    
	</div>
	</form>
</div>
<!-- -------------------------------------------------일반회원 정보 찾기--------------------------------------------------- -->
<!-- 비밀번호 찾기 -->
<div id="findPsw" class="modal" >
  <form class="modal-content animate" name="findPswForm" style="width:50%;">
  <!-- action="${path}/searchPwd.do" method="post" -->
      <div class="imgcontainer" style="height:10px">
        <span onclick="document.getElementById('findPsw').style.display='none'" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      </div>
      <br>
   <div class="containerNewPSW" style="margin:0 auto;">
   <h2 class="text-center">비밀번호 찾기</h2>
      <input type="text" placeholder="E-mail" id="memberEmail" name="memberEmail" autocomplete="off" required>
      <input type="hidden" class="idChecked" name="idChk" value="0">
      <button type="button" class="emailChk" onclick="searchEmail();" style="background-color:#DAF1DE">이메일 확인</button><br>
      <div style="text-align:center;">
      <button class="findPswBtn" id="findPswBtn" type="button" onclick="findPWsendEmail();" style="background-color:#DAF1DE">인증번호 전송</button>
  	</div>
   </div>
  <div><br><br></div>
     
  </form>
  
</div>

<!-- 아이디 찾기 -->
<div id="findEmail" class="modal" >
  <form class="modal-content animate" method="post" style="width:50%;">
      <div class="imgcontainer" style="height:10px">
        <span onclick="emptyFindEmail()" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      </div>
      <br>
   <div class="containerFindEmail" style="margin:0 auto;">
   <h2 class="text-center">아이디 찾기</h2>
      <input type="text" placeholder="이름 입력" name="name" id="name" required><br>
      <input type="text" placeholder="핸드폰 번호 입력 (-는 제외)" name="phone" id="phone" required><br>
      <div style="text-align:center;">
      <button onclick="findEmail();" class="findEmailBtn" id="findEmailBtn" type="button" style="background-color:#DAF1DE">아이디 찾기</button>
  	</div>
  	<span id="emailList" style="text-align:center;"></span>
  	
  </div>
  <div><br><br></div>
  </form>
</div>
<!-- -----------------------------------------------병원 관계자 정보 찾기 ------------------------------------------------ -->

<!-- 병원 관계자 비밀번호 찾기 -->
<div id="findHPPsw" class="modal" >
  <form class="modal-content animate" name="findHPPswForm" style="width:50%;">
  <!-- action="${path}/searchPwd.do" method="post" -->
      <div class="imgcontainer" style="height:10px">
        <span onclick="document.getElementById('findHPPsw').style.display='none'" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      </div>
      <br>
   <div class="containerNewHPPSW" style="margin:0 auto;">
   <h2 class="text-center">비밀번호 찾기</h2>
      <input type="text" placeholder="E-mail" id="hospitalEmail" name="hospitalEmail" autocomplete="off" required>
      <input type="hidden" class="hpIdChecked" name="hpIdChk" value="0">
      <button type="button" class="hpEmailChk" onclick="searchHPEmail();" style="background-color:#DAF1DE">이메일 확인</button><br>
      <div style="text-align:center;">
      <button class="findHPPswBtn" id="findHPPswBtn" type="button" onclick="findHPPswSendEmail();" style="background-color:#DAF1DE">인증번호 전송</button>
  	</div>
   </div>
  <div><br><br></div>
     
  </form>
  
</div>

<!-- 병원 관계자 아이디 찾기 -->
<div id="findHPEmail" class="modal" >
  <form class="modal-content animate" method="post" style="width:50%;">
      <div class="imgcontainer" style="height:10px">
        <span onclick="emptyFindID()" class="joinClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      </div>
      <br>
   <div class="containerFindHPEmail" style="margin:0 auto;">
   <h2 class="text-center">아이디 찾기</h2>
      <input type="text" placeholder="이름 입력" name="hpName" id="hpName" required><br>
      <input type="text" placeholder="핸드폰 번호 입력 (-는 제외)" name="hpPhone" id="hpPhone" required><br>
      <div style="text-align:center;">
      <button onclick="findHPEmail();" class="findHPEmailBtn" id="findHPEmailBtn" type="button" style="background-color:#DAF1DE">아이디 찾기</button>
  	</div>
  	<span id="hpEmailList" style="text-align:center;"></span>
  	
  </div>
  <div><br><br></div>
  </form>
</div>
 <script>
  new WOW().init();
 
function personEnroll(){
	location.href="${path}/member/personEnroll.do";
}
function hospitalEnroll(){
	location.href="${path}/member/hospitalEnroll.do";
}

window.onload = function() { 
	var loginChoice = $("#loginChoice");
	var personLogin = document.getElementById('personLoginsBtn'); 
	var hospitalLogin = document.getElementById('hospitalLoginBtn'); 
	
	personLogin.onclick=function() {
		loginChoice.hide();
		document.getElementById('id01').style.display='block';
	}
		
	hospitalLogin.onclick = function() { 
		
		loginChoice.hide();
		document.getElementById('id02').style.display='block';
	};

}

function hospitalLogin(){
	location.href="${path}/member/hospitalEnroll.do";
}
//////////////////////////////////////////////일반 회원 정보 찾기////////////////////////////////////////////////////////////
//일반 회원 비밀번호 찾기 -> 회원 중 해당 이메일이 있나 확인
function searchEmail(){
	var email = $('#memberEmail').val();
	console.log(email);
	
	$.ajax({
		url:"${path }/searchEmail",
		data:{"email":email},
		success:function(data){
			console.log("이거디"+data.member);
			
			if(data.member != 1){
				alert("이메일이 존재합니다. 비밀번호 변경 버튼을 누르면 이메일이 전송됩니다.");
				document.findPswForm.idChk.value=1;
			}else{
				alert("이메일이 존재하지 않습니다. 회원가입 후 이용하세요!");
				//location.reload();
			}
			
		}
	})
} 
function findPWsendEmail(){
	 if (document.findPswForm.idChk.value==0)
	 {
		alert("이메일을 확인 하세요");
		//console.log("dididi");
	     /* $("#memberEmail").focus();    */
	    return false;
	 }else{
		 var email = $('#memberEmail').val();
		location.href="${path }/findPass.do?memberEmail="+email;
	 }
}

//일반 회원 아이디 찾기
function findEmail(){
	var userName = $('#name').val();
	var call = $('#phone').val();
	var phoneCheck = /^\d{3}\d{3,4}\d{4}$/;
	var nameCheck=/^[가-힣]|[a-zA-Z]+$/; 
	
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
	
	if($("#phone").val()==""){
		// alert("전화번호를 입력하세요");
		 $("#phone").focus();
		 return false; 
	}else if(phoneCheck.test($("#phone").val())==false){
		alert("핸드폰 번호를 알맞게 작성해주세요");
		$("#phone").focus();
		 return false;
	}
	/* console.log(userName);	
	console.log(call); */
	
	$.ajax({
		type: 'POST',  
		url:'${path }/findUserEmail.do',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		data:{"userName":userName,"call":call},
		success:function(data){
			console.log("왔어?" + data.userMail);
			if(data.userMail != 1){
				$("#emailList").append("<h4>"+"등록된 이메일"+"<br>"+data.userMail+"</h4>");
				document.getElementById("findEmailBtn").disabled = true;
			}else{
				alert("회원 등록이 되어있지않습니다. 회원가입 후 이용하세요!");
				document.getElementById("findEmailBtn").disabled = false;
			}
			
			
		}
		
	})
}

//일반 회원 아이디 찾기 후 비워주고, 모달 닫기
function emptyFindEmail(){
	$('#name').val('');
	$('#phone').val('');
	$('#emailList').text('');
	document.getElementById('findEmail').style.display='none';
	
}

//////////////////////////////////////////////관계자 회원 정보 찾기////////////////////////////////////////////////////////////

//관계자 회원 아이디 찾기
function findHPEmail(){
	var hospitalName = $('#hpName').val();
	var hospitalCall = $('#hpPhone').val();
	
	var phoneCheck = /^\d{3}\d{3,4}\d{4}$/;
	var nameCheck=/^[가-힣]|[a-zA-Z]+$/; 
	
	if($("#hpName").val()==""){
		// alert("이름을 입력하세요");
		 $("#hpName").focus();
		 return false;	 
	 }else if(!nameCheck.test($("#hpName").val())){
		//유효성 검사
		alert("이름을 알맞게 작성해주세요.");
		$("#hpName").focus();
		 return false;
	}
	
	if($("#hpPhone").val()==""){
		// alert("전화번호를 입력하세요");
		 $("#hpPhone").focus();
		 return false; 
	}else if(phoneCheck.test($("#hpPhone").val())==false){
		alert("핸드폰 번호를 알맞게 작성해주세요");
		$("#hpPhone").focus();
		 return false;
	}
	/* console.log(userName);	
	console.log(call); */
	
	$.ajax({
		type: 'POST',  
		url:'${path }/findUserHPEmail.do',
		data:{"hospitalName":hospitalName,"hospitalCall":hospitalCall},
		success:function(data){
			console.log("왔어?" + data.userMail);
			if(data.userMail != 1){
				$("#hpEmailList").append("<h4>"+"등록된 이메일"+"<br>"+data.userMail+"</h4>");
				document.getElementById("findHPEmailBtn").disabled = true;
			}else{
				alert("회원 등록이 되어있지않습니다. 회원가입 후 이용하세요!");
				document.getElementById("findHPEmailBtn").disabled = false;
			}
			
			
		}
		
	})
}

//관계자 회원 아이디 찾기 빈칸 검사, 모달 닫기
function emptyFindID(){
	$('#hpName').val('');
	$('#hpPhone').val('');
	$('#hpEmailList').text('');
	document.getElementById('findHPEmail').style.display='none';
	
}
///////////관계자 비밀번호 찾기
function searchHPEmail(){
	var email = $('#hospitalEmail').val();
	console.log(email);
	
	$.ajax({
		url:"${path }/searchHPEmail.do",
		data:{"HPemail":email},
		success:function(data){
			console.log("이거디"+data.member);
			
			if(data.member != 1){
				alert("이메일이 존재합니다. 비밀번호 변경 버튼을 누르면 이메일이 전송됩니다.");
				document.findHPPswForm.hpIdChk.value=1;
			}else{
				alert("이메일이 존재하지 않습니다. 회원가입 후 이용하세요!");
				//location.reload();
			}
			
		}
	})
} 
function findHPPswSendEmail(){
	 if (document.findHPPswForm.hpIdChk.value==0)
	 {
		alert("이메일을 확인 하세요");
		//console.log("dididi");
	     /* $("#memberEmail").focus();    */
	    return false;
	 }else{
		 var email = $('#hospitalEmail').val();
		location.href="${path }/findHPPass.do?hospitalEmail="+email;
	 }
}

// 일반 회원 아이디 저장////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#uemail").val(key); 
     
    if($("#uemail").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#store").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#store").change(function(){ // 체크박스에 변화가 있다면,
        if($("#store").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#uemail").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#uemail").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#store").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#uemail").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});

//관계자 회원 아이디 저장////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var hospitalKey = getCookie("hospitalKey");
    $("#hospitalId").val(hospitalKey); 
     
    if($("#hospitalId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#store1").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#store1").change(function(){ // 체크박스에 변화가 있다면,
        if($("#store1").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("hospitalKey", $("#hospitalId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("hospitalKey");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#hospitalId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#store1").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("hospitalKey", $("#hospitalId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

//아이디 저장 끝/////////////////////////////////////////////////////////////////////////////////////////////

//google 로그인
	 var loginC=0; 

function renderButton() {
  gapi.signin2.render('my-signin2', {
    'scope': 'profile email',
    'width': 350,
    'height': 50,
    'longtitle': true,
    'onsuccess': onSuccess,
    'onfailure': onFailure
  });
}
function onSuccess(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  $.ajax({
			type: 'POST',  
			url:'${path }/googleIdChk.do',
			data:{"googleEmail":profile.getEmail(),"googleName":profile.getName(),"googlePW":profile.getId(),"loginCount":loginC},
			success:function(data){
				console.log(data);
				if(data.num == 0){
					alert("로그인 완료. 마이페이지를 통해 비밀번호를 추가해주세요!");
					gapi.auth2.getAuthInstance().disconnect();
					location.reload();	
				}else{
					alert("로그인 완료.");
					gapi.auth2.getAuthInstance().disconnect();
					location.reload();	
				}
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		       },
		     complete : function(data) {
		                 //  실패했어도 완료가 되었을 때 처리
		        }
			
		})
	  
}
function onFailure(error) {
console.log(error);
}
/* function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  $.ajax({
			type: 'POST',  
			url:'${path }/googleIdChk.do',
			data:{"googleEmail":profile.getEmail(),"googleName":profile.getName(),"googlePW":profile.getId(),"loginCount":loginC},
			success:function(data){
				console.log(data);
				if(data.num == 0){
					alert("로그인 완료. 마이페이지를 통해 비밀번호를 추가해주세요!");
					gapi.auth2.getAuthInstance().disconnect();
					location.reload();	
				}else{
					alert("로그인 완료.");
					gapi.auth2.getAuthInstance().disconnect();
					location.reload();	
				}
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		       },
		     complete : function(data) {
		                 //  실패했어도 완료가 되었을 때 처리
		        }
			
		})
	  
} */

function signOut() {
	//console.log(gapi.auth2);
   // var auth2 = gapi.auth2.getAuthInstance();
    location.href="${path}/member/logout.do";
    auth2.signOut().then(function () {
      //console.log('User signed out.');
    });
   // auth2.disconnect();
}
/* function logoutChk(){
	location.href="${path}/member/logout.do";
} */
//---------------------------------------채팅 시작!--------------------------------------------
		//by혜진, 관리자-일반회원 채팅 메서드 userId=일반회원EMAIL
		function accessChatting(room1){
			if(${loginMember.email ne "admin" } ){
				requestChatting();
			}
			open("${path}/chattingView?room="+room1,"_blank","width=500,height=490");
		}
		
		//by혜진, 관리자-병원회원 채팅 메서드 userId=병원회원ID
	 	function hpAdminAccessChatting(room1){//room1=병원회원
			
			if(${not empty loginHpMember}){
				hpAdminrequestChatting();
			}
			open("${path}/chattingView?room="+room1,"_blank","width=500,height=490");
		}
		
	 	//by혜진, 병원-일반회원 채팅 메서드(room=일반회원,room2=병원회원) 
		 function hpAccessChatting(room,room2){
			if(${not empty loginMember}){
				hpRequestChatting(room2,roomId);
				open("${path}/hpChattingView?room="+room2+"&roomId="+roomId,"_blank","width=500,height=490");
			}else{
				open("${path}/hpChattingView?room="+room+"&roomId="+room2,"_blank","width=500,height=490");
				location.reload();
			}
		}

</script>
	
	<c:if test="${not empty loginMember or not empty loginHpMember }">
		<script>
			let roomId;
			let alram=new WebSocket("wss://rclass.iptime.org${path}/alram");
			//let alram=new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/alram");
			
			alram.onopen=function(msg){
				
				if(${not empty loginMember}){
					alram.send(JSON.stringify(new AlramMessage("client","접속","${loginMember.email}","")));
				}
				
				else if(${not empty loginHpMember}){
					alram.send(JSON.stringify(new AlramMessage("client","접속","${loginHpMember.id}","")));
				}
				
			}
			
			alram.onmessage=function(msg){
				const data=JSON.parse(msg.data);
				console.log("??"+data.msg);
				switch(data.type){
					case "client" : roomId=data.msg;break;
					//관리자문의(일반)
					case "newchat" : openChatting(data);break;
					//관리자문의(병원)
					case "hpAdminChat" : hpAdminOpenChatting(data);break;
					//병원
					case "hospitalChat" : hpOpenChatting(data);break;
				}
			}
//--------------------------------------관리자 알림---------------------------------------------------			
			//by혜진, 관리자 알림 메서드
			function openChatting(data){
				if(confirm(data.sender+"님 1:1문의가 들어왔습니다 \n 응답하시겠습니까?")){
					accessChatting(data.sender);//관리자도(병원도) 창을 띄워줘야하므로!
				}
			}
			//by혜진, 관리자 알림 메서드
			function hpAdminOpenChatting(data){
				if(confirm(data.sender+"님 1:1문의가 들어왔습니다 \n 응답하시겠습니까?")){
					console.log("snrn?"+data);
					hpAdminAccessChatting(data.sender,data.msg);//관리자도(병원도) 창을 띄워줘야하므로!
				}
			}
			//by혜진, 병원 알림 메서드
			function hpOpenChatting(data){
				if(confirm(data.sender+"님 1:1문의가 들어왔습니다 \n 응답하시겠습니까?")){
					hpAccessChatting(data.sender,data.msg);//관리자도(병원도) 창을 띄워줘야하므로!
				}
			}
//------------------------요청 보내기-------------------------------------------------------------------			
			
			//by혜진, 일반회원->관리자 문의 메서드
			function requestChatting(){
				alram.send(JSON.stringify(new AlramMessage("newchat","문의합니다.","${loginMember.email}","admin")));//
			}
			
			//by혜진, 일반회원->관리자 문의 메서드
			function hpAdminrequestChatting(){
				alram.send(JSON.stringify(new AlramMessage("hpAdminChat","문의","${loginHpMember.id}","admin")));//
			}
			//by혜진, 일반회원->관리자 문의 메서드
			 function hpRequestChatting(room2,roomId){
				 console.log("병원 :"+room2,roomId);
				alram.send(JSON.stringify(new AlramMessage("hospitalChat",roomId,"${loginMember.email}",room2)));
			} 
//------------------------객체------------------------------------------------------------------------
			function AlramMessage(type,msg,sender,receiver){
				this.type=type;
				this.msg=msg;
				this.sender=sender;
				this.receiver=receiver;			
			}
		</script>
	</c:if>