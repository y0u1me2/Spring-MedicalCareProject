<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/admin.png">
<title>ADMIN HospitalForU</title>
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
	<style>
		body{width:1366px;}
	</style>
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
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="${pageContext.request.contextPath }" >
                                <img src="${pageContext.request.contextPath }/resources/images/logo5.png" width="20px;" alt="user" class="profile-pic m-r-5" />메인으로</a>
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
                            <a href="${pageContext.request.contextPath }/admin/memberInfo.do" class="waves-effect" style="margin-top:50px; text-align: center;"><h4 style="font-size:22px; font-family:'Song Myung',cursive;">일반 회원 관리</h4></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/hospitalList" class="waves-effect" style="margin-top:20px; text-align: center;"><h4 style="font-size:22px;font-family:'Song Myung',cursive;">병원 회원 관리</h4></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/careNotice.do" class="waves-effect" style="margin-top:20px; text-align: center;"><h4 style="font-size:22px;font-family:'Song Myung',cursive;">돌보미 등록 관리</h4></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/healthInfo.do" class="waves-effect" style="margin-top:20px; text-align: center;"><h4 style="font-size:22px;font-family:'Song Myung',cursive;">건강 정보</h4></a>
                        </li>
                    </ul>
                   
                </nav>
            </div>
        </aside>
      
      <div class="page-wrapper" style="min-height: 651px;">
      
          <script>

    //---------------------------------------채팅 시작!--------------------------------------------
    		//by혜진, 관리자-일반회원 채팅 메서드 userId=일반회원EMAIL
    		function accessChatting(room1){
    			if(${loginMember.email ne "admin" } ){
    				requestChatting();
    			}
    			open("${pageContext.request.contextPath}/chattingView?room="+room1,"_blank","width=500,height=490");
    		}
    		
    		//by혜진, 관리자-병원회원 채팅 메서드 userId=병원회원ID
    	 	function hpAdminAccessChatting(room1){//room1=병원회원
    			
    			if(${not empty loginHpMember}){
    				hpAdminrequestChatting();
    			}
    			open("${pageContext.request.contextPath}/chattingView?room="+room1,"_blank","width=500,height=490");
    		}
    		
    	 	//by혜진, 병원-일반회원 채팅 메서드(room=일반회원,room2=병원회원) 
    		 function hpAccessChatting(room,room2){
    			if(${not empty loginMember}){
    				hpRequestChatting(room2,roomId);
    				open("${pageContext.request.contextPath}/hpChattingView?room="+room2+"&roomId="+roomId,"_blank","width=500,height=490");
    			}else{
    				open("${pageContext.request.contextPath}/hpChattingView?room="+room+"&roomId="+room2,"_blank","width=500,height=490");
    				location.reload();
    			}
    		}

    </script>
    	
    	
    	<c:if test="${not empty loginMember or not empty loginHpMember }">
    		<script>
    			let roomId;
    			let alram=new WebSocket("ws://rclass.iptime.org:9999${path}/alram");
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