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
    <a class="navbar-brand" href="${pageContext.request.contextPath }" style="color:black;">똑똑닥</a>
    <!-- Links -->
    <ul class="navbar-nav" style="padding-left: 30px;">
        <li class="nav-item">
            <a class="nav-link" href="#">공지사항</a>
          </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/rv/reservationList" >병원예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="healthInfo/healthInfoMain">건강정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">의약품 검색</a>
      </li>  
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="${path }/care/careNotice">돌보미 찾기</a>
            <a class="dropdown-item" href="${path }/ask/ask.do">문의 게시판</a>
        </div>
    </li>
    <c:choose>
         <c:when test = "${empty loginMember }">
           <li class="nav-item" style="margin-left:250px;">
            <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
          </li>
          <li class="nav-item">
             <button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button>
          </li>
         </c:when>
         <c:when test = "${not empty loginMember }">
            <span>
            	<a href="#"><c:out value="${loginMember.name }"></c:out></a>님, 안녕하세요!
	       </span>
			<li class="nav-item" style="margin-left:250px;">
	             <button onclick="signOut();">Sign out</button>
	        </li>
         </c:when>
         <c:otherwise>
         </c:otherwise>
      </c:choose>
     <%--  <c:if test="${empty loginMember }">
		 <li class="nav-item" style="margin-left:250px;">
            <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
          </li>
          <li class="nav-item">
             <button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button>
          </li>
	</c:if>
	<c:if test="${not empty loginMember }">
		<span>
            <a href="#"><c:out value="${loginMember.name }"></c:out></a>님, 안녕하세요!
       </span>
		<li class="nav-item" style="margin-left:250px;">
             <button onclick="signOut();">Sign out</button>
        </li>
	</c:if> --%>
    </ul>
  </nav>
 <!-- 로그인 -->
<div id="id01" class="modalLogin" style="display: none;">
  
  <form class="modal-content animate" action="${path }/member/memberLogin.do" method="post" style="width:30%;">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="loginClose" title="Close Modal">&times;&nbsp;&nbsp;</span>
      <br><br><br>
     <img src="${path }/resources/images/logo.png" id="loginLogo" style="width:100px;height:100px;">
      <!-- <h1>로고</h1> -->
    </div>

    <div class="containerlogin">
      <input type="text" placeholder="E-mail" id="uname" name="email" autocomplete="off" required>
      <input type="password" placeholder="Password" id="psw" name="password" required>
      <label>
        <input type="checkbox" id="store" name="saveId">이메일 저장
      </label>
      
      <button onclick="loginCheck();" class="login-button" type="submit" style="background-color:#DAF1DE">Login</button>

        <p>----------------또 다른 계정으로 로그인--------------</p>
            
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
        <a href="#">아이디 찾기</a> &nbsp;/&nbsp;
        <a href="#">비밀번호 찾기</a>
    </div>
    
  </form>
</div>

<div id="id02" class="modal" >
  <form class="modal-content animate" method="post" style="width:50%;">
      <div class="imgcontainer" style="height:10px">
        <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;&nbsp;&nbsp;</span>
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
 <script>
  new WOW().init();
 
function personEnroll(){
	location.href="${path}/member/personEnroll.do"
}
function hospitalEnroll(){
	location.href="${path}/member/hospitalEnroll.do"
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

</script>