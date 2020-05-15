<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="pathImages"
	value="${pageContext.request.contextPath}/resources/images" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />


<style>
/* body {
  font-family: Arial, Helvetica, sans-serif;
}*/
/* * {
  box-sizing: border-box;
} */

/* Create a column layout with Flexbox */
#content-myPage {
	/* margin: 50px auto;
	align-content: center; */
	width: 100%;
}

section>div.row {
	display: flex;
	margin: 50px auto;
	width: 100%;
	min-height: 500px;
}

/* Left column (menu) */
.left {
	flex: 35%;
	padding: 15px 0;
}

.left h2 {
	padding-left: 8px;
}

/* Right column (page content) */
.right {
	flex: 65%;
	padding: 15px;
}

/* Style the navigation menu inside the left column */
#myMenu {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myMenu li a {
	padding: 12px;
	text-decoration: none;
	color: black;
	display: block
}

#myMenu li a:hover {
	background-color: rgb(218, 241, 222);
}

.aSelected {
	background-color: #DAF1DE;
}

/* ================================================ */
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
	opacity: 1;
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

<section id="content-myPage">
	<div class="row justify-content-md-center">
		<div class="left col-2">
			<h2>마이페이지</h2>
			<ul id="myMenu">
				<li><a href="#">개인정보수정</a></li>
				<li><a href="#">접수 현황</a></li>
			</ul>
		</div>

		<div class="right col-8">
			<div class="container-fluid-enroll">
				<form name="personEnrollFrm" id="personEnrollFrm"
					action="${path}/myPage/memberUpdate.do" method="post"
					onsubmit="return memberUpdateVali();">
					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<h1 align="center">개인정보수정</h1>
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						
						<div class="col-xl-4"></div>
					</div>
					<br>
					<br>
					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<label for="email"><b>이메일</b></label><br> <input type="text"
								value="${loginMember.email }" id="email" name="email" readonly>
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<label for="name"><b>이름</b></label> <input type="text"
								placeholder="${loginMember.name }" name="name" id="name">
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<label for="psw"><b>비밀번호</b></label> 
							<input type="password"	placeholder="Enter Password" id="password" name="password">
							<input type="text"	value="${loginMember.password }" id="oldPassword" name="oldPassword">
							<p id="pwCheckFF" style="color: #FF6600; margin: 0;">
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<label for="psw-repeat"><b>비밀번호 확인</b>	</label> 
							<input type="password" placeholder="Repeat Password" id="psw-repeat" name="psw-repeat">
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<label for="phone"><b>핸드폰 번호</b></label> <input type="text"
								placeholder="${loginMember.phone }" name="phone" id="phone">
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col-xl-6">
							<button type="submit" class="signupbtn">수정</button>
							<button type="button" class="cancelbtn">취소</button>
						</div>
						<div class="col"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	$('#myMenu>li>a').click(function() {
		$(this).addClass('aSelected');
		$(this).parent().siblings().children().removeClass('aSelected');
	})
	
	
	$('#password').blur(function() {
		const email=$('#email').val();
		const password=$('#password').val();
		$.ajax({
			url:"${path}/myPage/passwordCheck",
			type:"post",
			data:{'password':password,'email':email},
			success:function(data) {
				console.log("성공?");
				console.log(data);
			}
		});
	});
	
	function memberUpdateVali() {
		return false;
	}
</script>




<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />