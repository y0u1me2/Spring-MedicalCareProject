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
/* 버튼클릭시 파란테두리 없애기 */
    button:focus {outline:none;}
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
	min-width: 250px;
}

/* Right column (page content) */
.right {
	flex: 65%;
	padding: 15px;
	margin-left: 30px;
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

span.error {
	display:none;
	color:red;
	float:right;
}

span.ok {
	display:none;
	color:green;
	float:right;
}
input.error {
	 outline: 1px solid red;
}

.personalInfo-update {
	display:block;
}
.myPage-reservation {
	display:none;
}



/* 모달 */

.modal-back {
        display: none;
        z-index: 4;
        width: 100%;
        height: 100%;
        top: 0;
        position: fixed;
        /* border: 1px solid black; */
        background-color: rgba(0, 0, 0, 0.5);
    }

    /* 팝업 크기 */
    .modal-dupliMember,
    .modal-deleteMember {
        /* border: 1px solid black; */
        width: 400px;
        max-height: 650px;
        padding: 40px;
        background-color: #fefefe;
        margin: 10% auto 15% auto;
        /* margin: center; */
        position: relative;
    }
    /* 닫기버튼(X) */
    .close-btn {
        position: absolute;
        top: 0;
        right: 0;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .close-btn>.close {
        position: relative;
        font-size: 20px;
        cursor: pointer;
    }

    .close:hover {
        color: red;
    }


  /* Add Zoom Animation 
    팝업시 줌 애니메이션*/
.animate {
	animation: animatezoom 0.6s;
}

@keyframes animatezoom {
	from {
		transform: scale(0)
	}
	to {
		transform: scale(1)
	}
}

.main-deleteMember,
.bottom-deleteMember {
	text-align: center;
}


/* 예약현황 리스트 */
.reservList {
	width: 100%;
	margin-top: 30px;
}
.table-head {
	border-bottom: 4px solid black;
}
.table-list {
	border-bottom: 4px solid rgba(0,0,0,0.3);
}
.table-head>th,
.table-list>td {
	padding: 20px 10px;
}
.hospName {
	min-width: 210px;
}
.hospAddr {
	min-width: 430px;
}
.department,
.hospTel,
.reservDate {
	min-width: 150px;
}
</style>

<section id="content-myPage">
	<div class="row justify-content-md-center">
		<div class="left col-2">
			<h2>마이페이지</h2>
			<ul id="myMenu">
				<li><a id="personalInfo-updateA" name="personalInfo-update" class="aSelected" href="#">개인정보수정</a></li>
				<li><a id="myPage-reservationA" name="myPage-reservation" href="#">예약 현황</a></li>
				<li><a id="modal-backA" name="modal-back" href="#">회원 탈퇴</a></li>
			</ul>
		</div>
	<!-- ==================================개인정보 수정========================================================= -->
		<div class="right col-8 personalInfo-update">
			<div class="container-fluid-enroll">
				<form name="personInfoFrm" id="personInfoFrm"
					action="${path}/myPage/memberUpdate.do" method="post"
					onsubmit="return memberUpdateVali();">
					<div class="row">
						<div class="col-xl-8">
							<h1 align="center">개인정보수정</h1>
						</div>
					</div>

					<div class="row">
						
						<div class="col-xl-4">
							<input type="hidden" value="${loginMember.memberNo }" id="memberNo" name="memberNo"/>
						</div>
					</div>
					<br>
					<br>
					<div class="row">
						<div class="col-xl-8">
							<label for="email"><b>이메일</b></label><br> <input type="text"
								value="${loginMember.email }" id="email" name="email" readonly>
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8">
							<label for="name"><b>이름</b></label> <input type="text"
								placeholder="${loginMember.name }" name="name" id="name">
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8">
							<label for="psw"><b>비밀번호</b></label>
							<input type="password"	placeholder="Enter Password" id="password" name="password">
							<!-- <p id="pwCheckFF" style="color: #FF6600; margin: 0;"> -->
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8">
							<label for="psw-repeat"><b>비밀번호 확인</b>	</label>
							<input type="password" placeholder="Repeat Password" id="psw-repeat" name="psw-repeat">
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8">
							<label for="phone"><b>핸드폰 번호</b></label> <input type="text"
								placeholder="${loginMember.phone }" name="phone" id="phone">
						</div>
					</div>

					<div class="row">
						<div class="col-xl-8">
							<button type="submit" class="signupbtn">수정</button>
							<button type="button" class="cancelbtn">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- ===============개인정보수정 끝==================== -->
		<!-- ===============예약현황==================== -->
		<div class="right col-8 myPage-reservation">
			<div class="row">
				<div class="col-xl">
					<h1 align="center">예약 현황</h1>
				</div>
			</div>
			<div class="row" id="reservList">
				<div class="col-xl">
					<!-- <table class="reservList">
						<tr class="table-head">
							<th class="hospName">병원이름</th>
							<th class="hospAddr">주소</th>
							<th class="department">진료과목</th>
							<th class="hospTel">전화번호</th>
							<th class="reservDate">예약일시</th>
						</tr>
					</table> -->
				</div>
			</div>

		</div>
		<!-- ===============예약현황 끝==================== -->
		<!-- ===============회원탈퇴==================== -->
		<!-- ===============회원탈퇴 경고 모달창==================== -->
		<div class="modal-back" id="deleteMember">
			<!-- 이용약관 팝업-->
			<form id="deleteForm">
			<div class="modal-deleteMember animate">
				<div class="main-deleteMember">
					<div class="row">
						<div class="col">
							<h3 align="center">정말로 탈퇴하시겠습니까?</h3>
							</br>
						</div>
					</div>					
					<div class="row">						
						<div class="col">
							<p>탈퇴 시 회원님의 모든 정보가 
							</br>삭제되고 이후 복수할 수 없습니다.
								</br></br>그래도 탈퇴하시겠습니까?
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label style="float:left" for="email"><b>비밀번호</b></label>
							<input type="password" id="confirmPassword" name="confirmPassword">
						</div>
					</div>
					<div class="row">
						<div class="col">
							
						</div>
					</div>
					<div class="bottom-deleteMember row">
						<div class="col">
							<button type="button" class="signupbtn" id="confirm">확인</button>
							<button type="button" class="closeModal signupbtn">취소</button>
						</div>
					</div>
				</div>
				<div class="close-btn">
					<span class="close closeModal" title="Close Modal">&times;</span>
				</div>
			</div>
			</form>
		</div>	
	</div>
</section>
<script>
var updateMyInfo = $('div.col-xl-8>input');
var email=$('#email').val();
var password=$('#password').val();

	$('#myMenu>li>a').click(function() {
		$(this).addClass('aSelected');
		$(this).parent().siblings().children().removeClass('aSelected');
		if($(this).attr('name')=='personalInfo-update') {
			$('.myPage-deleteMember').css('display', 'none');
			$('.myPage-reservation').css('display', 'none');
			$('.personalInfo-update').css('display', 'block');
			$('#reservList>div').html('');
		}
		if($(this).attr('name')=='myPage-reservation') {
			$('#personInfoFrm')[0].reset();
			$('.myPage-deleteMember').css('display', 'none');
			$('.personalInfo-update').css('display', 'none');
			$('.myPage-reservation').css('display', 'block');
			$.ajax({
				url:"${path}/myPage/reservationStatus",
				data:{'no':$('#memberNo').val()},
				success:function(data) {
					console.log(data);
					var tableHead='<table class="reservList">'
										+'<tr class="table-head">'
											+'<th class="hospName">병원이름</th>'
											+'<th class="hospAddr">주소</th>'
											+'<th class="department">진료과목</th>'
											+'<th class="hospTel">전화번호</th>'
											+'<th class="reservDate">예약일시</th>'
										+'</tr>'
									+'</table>';
					$('#reservList>div').append(tableHead);
					for(let i=0;i<data.list.length;i++) {
						var tableList="<tr class='table-list'>";
						tableList+="<td class='hospName'>"+data.list[i].HOSPNAME+"</td>";
						tableList+="<td class='hospAddr'>"+data.list[i].HOSPADDR+"</td>";
						tableList+="<td class='department'>"+data.list[i].HOSPDEPARTMENT+"</td>";
						tableList+="<td class='hospTel'>"+data.list[i].HOSPTEL+"</td>";
						tableList+="<td class='reservDate'>"+data.list[i].RESERVDATE+"</td>";
						tableList+="</tr>";
						$('table.reservList>tbody').append(tableList);
					}
				}			
			})
		}
		if($(this).attr('name')=='modal-back') {
			$('#personInfoFrm')[0].reset();
			$('#deleteMember').css('display', 'block');
			$('#confirm').click(function() {
				if($('#confirmPassword').val()=='') {
					$('#confirmPassword').removeClass('error');
					$('#confirmPassword').siblings('span').remove();
					$('#confirmPassword').addClass('error');//error 클래스 추가하고
					$('#confirmPassword').before($('<span>').html('비밀번호를 입력하세요.').addClass('error').css('display','block'));
				}else {
					$.ajax({
						url:"${path}/myPage/passwordCheck",
						type:"post",
						data:{'password':$('#confirmPassword').val(),'email':email},
						success:function(data) {
							if(data.duplication) {
								location.replace("${path}/member/logout.do");
							}else {
								$('#confirmPassword').removeClass('error');
								$('#confirmPassword').siblings('span').remove();
								$('#confirmPassword').addClass('error');//error 클래스 추가하고
								$('#confirmPassword').before($('<span>').html('비밀번호가 일치하지 않습니다.').addClass('error').css('display','block'));
							}
						}
					})
				}
			})
			$('.closeModal').click(function() {
				closeModal();				
				$('#myMenu>li>a').removeClass('aSelected');
				if($('.myPage-reservation').css('display')=='block') {
					$('#myPage-reservationA').addClass('aSelected');
				}
				if($('.personalInfo-update').css('display')=='block') {
					$('#personalInfo-updateA').addClass('aSelected');
				}
			})
		}
	})
	
	function closeModal() {
		$('#confirmPassword').removeClass('error');
		$('#confirmPassword').siblings('span').remove();
		$('.modal-back').css("display","none");
		$('#deleteForm')[0].reset();
	}
	
	
	
	//유효성 및 회원정보 수정
	
	
	for(let i=0; i<updateMyInfo.length; i++) {
		$(updateMyInfo[i]).blur(function() {
			if($(this).attr('name')=='password') {
				if($(this).val()!="") {
					var pwRule1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;//비밀번호 유효성 1
				    var pwRule2 = /(\w)\1\1\1/;//비밀번호 유효성2
				    var pwck1 = pwRule1.test($(this).val());//비밀번호 유효성 검사1
                    var pwck2 = pwRule2.test($(this).val());//비밀번호 유효성 검사2
                    var pwck3_1 = ($(this).val()).search(/[0-9]/g) < 0;//비밀번호 유효성 검사3_1
                    var pwck3_2 = ($(this).val()).search(/[a-z]/g) < 0;//비밀번호 유효성 검사3_2
                    var pwck3 = pwck3_1 || pwck3_2;//비밀번호 유효성 검사3
                    if (pwck2) {
                        $(this).removeClass('error');
                        $(this).siblings('span').remove();
                        $(this).addClass('error');//error 클래스 추가하고
                        $(this).before($('<span>').html('같은 문자를 4번 이상 사용하실 수 없습니다.').addClass('error').css('display','block'));//span태그 추가해서 유효하지 않다고 표시
                    }
                    if (pwck3) {
                        $(this).removeClass('error');
                        $(this).siblings('span').remove();
                        $(this).addClass('error');//error 클래스 추가하고
                        $(this).before($('<span>').html('숫자와 영문자를 혼용하여야 합니다.').addClass('error').css('display','block'));//span태그 추가해서 유효하지 않다고 표시
                    }
                    if (!pwck1) {//비밀번호 유효성 검사결과 이상상하면
                        $(this).removeClass('error');
                        $(this).siblings('span').remove();
                        $(this).addClass('error');//error 클래스 추가하고
                        $(this).before($('<span>').html('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.').addClass('error').css('display','block'));//span태그 추가해서 유효하지 않다고 표시
                    }
                    if (pwck1 && (!pwck2) && (!pwck3)) {
						//중복검사
						$.ajax({
							url:"${path}/myPage/passwordCheck",
							type:"post",
							data:{'password':$('#password').val(),'email':email},
							success:function(data) {
									console.log(data.duplication);
									$('#password').removeClass('error');
									$('#password').removeClass('ok');
									$('#password').siblings('span').remove();
								if(data.duplication) {
					                    $('#password').addClass('error');//error 클래스 추가하고
										$('#password').before('<span class="error">');
										$('#password').siblings('span.error').css('display','block').text("기존의 비밀번호로 변경할 수 없습니다.");		
								}else {
										$('#password').before('<span class="ok">');
										$('#password').siblings('span').css('display','block').text("변경가능한 비밀번호 입니다.");								}
								}
						});                    	
                    }										
				}
			}
			if($(event.target).attr('name')=='psw-repeat') {
				if($('#password').val()!="" && $('#psw-repeat').val()!="") {
					$(this).siblings('span').remove();
					if($('#password').val()!=$('#psw-repeat').val()) {
							$('#psw-repeat').before('<span class="error">');
							$('#password').addClass('error');
							$('#psw-repeat').addClass('error');
							$(this).siblings('span').css('display','block').text("비밀번호가 일치하지 않습니다.");
					}else {
							$('#psw-repeat').before('<span class="ok">');
							$('#password').removeClass('error');
							$('#psw-repeat').removeClass('error');
							$(this).siblings('span').css('display','block').text("비밀번호가 일치합니다.");
					}
				}
			}
		})
	}
	
	
	
	function memberUpdateVali() {
		if($('#password').attr('class')=='error' || $('#psw-repeat').attr('class')=='error') {
			return false;
		}else {
			if($('#password').val()==$('#psw-repeat').val()) {
				return true;				
			}else {
				return false;
			}
		}		
	}
</script>




<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />