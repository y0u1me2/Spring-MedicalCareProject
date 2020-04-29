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
    <title>header</title>
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
        <a class="nav-link" href="#" >병원예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">건강정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">의약품 검색</a>
      </li>  
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">돌보미 찾기</a>
            <a class="dropdown-item" href="${path }/ask/ask.do">문의 게시판</a>
        </div>
    </li>
      <li class="nav-item" style="margin-left:230px;">
        <a class="nav-link" href="#">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">회원가입</a>
      </li>
    </ul>
  </nav>
 <script>
  new WOW().init();
</script>