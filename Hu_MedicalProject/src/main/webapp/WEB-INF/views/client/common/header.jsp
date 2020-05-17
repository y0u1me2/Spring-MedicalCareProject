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

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="415129597970-epgotkdffasbd0r2mqq4shuirovnqsqp.apps.googleusercontent.com">
   
<!-- 파비콘 -->
   <link rel ="icon" type="image/png"
        href="/resources/images/logo5.png"/>
    <title>Hospital for You</title>
    
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
</head>
<body>
  <nav class="navbar navbar-expand" style="background-color:#DAF1DE;padding-left:150px;">
    <!-- Brand/logo -->
    <img src="${pageContext.request.contextPath }/resources/images/logo5.png" style="width:50px; padding-right:8px;">
    <a class="navbar-brand" href="${pageContext.request.contextPath }" style="color:black;">HU</a>
    <!-- Links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="${path }/notice/noticeList">공지사항</a>
          </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/rv/reservationList" >병원접수</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/healthInfo/healthInfoMain">건강정보</a>
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
	            <a class="dropdown-item" href="${path }/test/test.do">test</a>
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
				<button type="button" class="btn btn-outline-dark" onclick="logoutChk();">로그아웃</button>
				   <button class="btn btn-outline-dark" type="button"
						onclick="accessChatting('${loginMember.email}');">관리자  실시간 문의</button>
	        </li>
         </c:when>
         
         <c:when test = "${not empty loginHpMember }">
			<li class="nav-item" style="margin-left:100px;">
				<a href="#" style="align:right;"><c:out value="${loginHpMember.hospitalName }"></c:out> 님</a>
				<button type="button" class="btn btn-outline-dark" onclick="location.replace('${path}/member/hospitalLogout.do')">로그아웃</button>
				   <%-- <button class="btn btn-outline-dark" type="button"
						onclick="accessChatting('${loginMember.email}');">관리자  실시간 문의</button> --%>  
						
	        </li>
         </c:when>
         <c:otherwise>
         </c:otherwise>
      </c:choose>
    </ul>
 </nav>
<!-- 로그인 선택 모달 -->
<div id="loginChoice" class="modal" style="z-index:1;">
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
<div id="joinChoice" class="modal" >
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
      
        <div style="text-align:center;">간편한 SNS로그인</div>
            
            <!--  <button type="button" id="otherbtn"><img src="${path }/resources/images/google.png" alt=""></button>&nbsp;&nbsp;-->
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
            <a href="#" onclick="signOut();">Sign out</a>
            <!-- 자동로그인 처리하기 -->
           <%--<button type="button" id="otherbtn"><img src="${path }/resources/images/kakao.png" alt=""></button>&nbsp;&nbsp;
             <button type="button" id="otherbtn"><img src="${path }/resources/images/naver.png" alt=""></button>&nbsp;&nbsp;
             <button type="button" id="otherbtn"><img src="${path }/resources/images/daum.png" alt=""></button>
       --%>
    </div>
    <div class="containerlogin" style="background-color:white; margin:0 auto;">
    	<button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findEmail').style.display='block'">아이디 찾기</button>
        &nbsp;/&nbsp;
         <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findPsw').style.display='block'">비밀번호 찾기</button>
    </div>
    
  </form>
</div>
 <!-- 관계자 로그인 -->
<div id="id02" class="modalLogin" style="display: none; ">
  
  <form class="modal-content animate" id="loginForm" name="loginForm" action="${path }/member/hospitalLogin.do" method="post" style="width:30%;">
   
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="loginClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      <br><br><br>
     <img src="${path }/resources/images/logo.png" id="loginLogo" style="width:70%;height:50%;">
    
    </div>

    <div class="containerlogin">
	      <input type="text" placeholder="아이디" id="hospitalId" name="id" autocomplete="off" required>
	      <input type="password" placeholder="비밀번호" id="hospitalPsw" name="password" required>
	      <label>
	        <input type="checkbox" id="store" name="saveId">아이디 저장
	      </label>
	
	      <button onclick="loginCheck();" class="login-button" type="submit" style="background-color:#DAF1DE;">병원 회원 Login</button>   
	
	     <div class="containerlogin" style="background-color:white; text-align:center;">
	    	<button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findEmail').style.display='block'">아이디 찾기</button>
	        &nbsp;/&nbsp;
	         <button type="button" class="btn btn-outline-dark" onclick="document.getElementById('findPsw').style.display='block'">비밀번호 찾기</button>
	    </div>    
	</div>
	</form>
</div>

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
      <button class="findPswBtn" id="findPswBtn" type="button" onclick="sendEmail();" style="background-color:#DAF1DE">인증번호 전송</button>
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
   <h2 class="text-center">이메일 찾기</h2>
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
function sendEmail(){
	 if (document.findPswForm.idChk.value==0)
	 {
		alert("이메일을 확인 하세요");
		console.log("dididi");
	     /* $("#memberEmail").focus();    */
	    return false;
	 }else{
		 var email = $('#memberEmail').val();
		location.href="${path }/findPass.do?memberEmail="+email;
	 }
}

function pswCode(){
	location.href="${path}/pass_injeung.do";
}
//아이디 찾기
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
function emptyFindEmail(){
	$('#name').val('');
	$('#phone').val('');
	$('#emailList').text('');
	document.getElementById('findEmail').style.display='none';
	
}
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
    auth2.disconnect();
}
function logoutChk(){
	location.href="${path}/member/logout.do";
}

//---------------------------------------채팅 시작!--------------------------------------------
		//admin
		function accessChatting(room1){//병원회원-일반회원일때 매개변수 2개 받기
			//room은 로그인된 userId가 매개변수로 들어간다.
			if(${loginMember.email ne "admin"  } ){
				//로그인된 회원이 병원회원이라면 requestChatting()실행!(input hidden에 넣어서 email값 받아오기)
				//로그인된 아이디가 admin이 아니면 requestChatting()메서드 실행!
				requestChatting();
			}
			open("${path}/chattingView?room="+room1,"_blank","width=500,height=490");
		}
		
		//병원
		 function hpAccessChatting(room1,room2){
		//room1은일반회원(요청한회원) room2는 병원회원(요청받은회원) 
			if(${not empty loginMember}){
				hpRequestChatting(room2);
			}
			open("${path}/chattingView?room1=${loginMember.email}&room2="+room2,"_blank","width=500,height=490");
		}
//채팅 알람띄워주기
function accessChatting(room){//병원회원-일반회원일때 매개변수 2개 받기
	//room은 로그인된 userId가 매개변수로 들어간다.
	if(${loginMember.email ne "admin"}){
		//로그인된 회원이 병원회원이라면 requestChatting()실행!(input hidden에 넣어서 email값 받아오기)
		
		//로그인된 아이디가 admin이 아니면 requestChatting()메서드 실행!
		requestChatting();
	}
	open("${path}/chattingView?room="+room,"_blank","width=500,height=490");
}
</script>
	<c:if test="${not empty loginMember or not empty loginHpMember }">
	<!--로그인이 되었을때 문의하기!  -->
		<script>
			//채팅알람받는 웹소켓 구성하기
			let alram=new WebSocket("ws://localhost:9090${path}/alram");
			
			alram.onopen=function(msg){
				console.log("msg :"+msg);
				
				if(${not empty loginMember}){
				alram.send(JSON.stringify(new AlramMessage("client","접속","${loginMember.email}","")));//공란병원회원
				}
				
				else if(${not empty loginHpMember}){
					alram.send(JSON.stringify(new AlramMessage("client","접속","${loginHpMember.id}","")));//공란병원회원
				}
			}
			
			alram.onmessage=function(msg){
				const data=JSON.parse(msg.data);
				console.log(data);
				switch(data.type){
					//admin
					case "newchat" : openChatting(data);break;
					
					//병원
					case "hospitalChat" : hpOpenChatting(data);break;
				}
			}
//--------------------------------------관리자 알림-------------------------------------------------			
			//admin
			function openChatting(data){
				if(confirm(data.sender+"님 1:1문의가 들어왔습니다 \n 응답하시겠습니까?")){
					accessChatting(data.sender);//관리자도(병원도) 창을 띄워줘야하므로!
				}
			}
			
			//병원
			function hpOpenChatting(data){
				if(confirm(data.sender+"님 1:1문의가 들어왔습니다 \n 응답하시겠습니까?")){
					hpAccessChatting(data.sender);//관리자도(병원도) 창을 띄워줘야하므로!
				}
			}
//------------------------요청 보내기-------------------------------------------------------------------			
			//admin
			function requestChatting(){
				alram.send(JSON.stringify(new AlramMessage("newchat","문의합니다.","${loginMember.email}","admin")));//
			//일반회원이 admin에게 채팅보냄
			}
			//병원
			 function hpRequestChatting(room2){
				 console.log("병원 :"+room2);
				alram.send(JSON.stringify(new AlramMessage("hospitalChat","병원문의","${loginMember.email}",room2)));
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
