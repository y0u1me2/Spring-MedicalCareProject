<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/admin.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
 <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="${pageContext.request.contextPath }/resources/css/blue.css" id="theme" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/tether.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/waves.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/sidebarmenu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/sticky-kit.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.flot.tooltip.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/flot-data.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jQuery.style.switcher.js"></script>

</head>


<body class="fix-header fix-sidebar card-no-border">
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <div id="main-wrapper">
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/admin/admin.do">
                        <b>
                            <img src="${pageContext.request.contextPath }/resources/images/adminLogo.png" width="170px" alt="homepage" class="dark-logo" style="margin-top:20px;"/>
                            
                        </b>
                    </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="navbar-nav mr-auto mt-md-0 ">
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item hidden-sm-down">
                          
                        </li>
                    </ul>
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${pageContext.request.contextPath }/resources/images/admin.png" width="20px;" alt="user" class="profile-pic m-r-5" />Admin</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" style="margin-bottom: 50px;">
                       
                        <li>
                            <a href="" class="waves-effect" style="margin-top:50px; text-align: center;"><h4 style="font-size:22px; font-family:'Song Myung',cursive;">일반 회원 관리</h4></a>
                        </li>
                        <li>
                            <a href="icon-fontawesome.html" class="waves-effect" style="margin-top:20px; text-align: center;"><h4 style="font-size:22px;font-family:'Song Myung',cursive;">병원 회원 관리</h4></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/careNotice.do" class="waves-effect" style="margin-top:20px; text-align: center;"><h4 style="font-size:22px;font-family:'Song Myung',cursive;">돌보미 등록 관리</h4></a>
                        </li>
                    </ul>
                   
                </nav>
            </div>
        </aside>