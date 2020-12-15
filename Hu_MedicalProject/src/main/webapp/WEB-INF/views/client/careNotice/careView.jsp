
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />

<style>

/* 섹션 */
section.back {
	width: 80%;
	position: relative;
	top: 100px;
	left: 10%;
	margin-bottom: 20px;
}

/* 제목 */
div.bottom {
	position: relative;
	padding: 15px 20px;
	border-bottom: 1px solid #d5d5d5;
}

hr {
	color: black;
	width: 100%;
}

/* 제목 텍스트 */
div.bottom>h2 {
	padding: 10px 0 0 30px;
	font-weight: lighter;
}

/* 작성일 */
p#time {
	float: right;
	color: #9e9d9d;
	position: relative;
	bottom: 20px;
}

/* 댓글 조회수 */
ul.info li:first-child {
	margin-left: 0;
	padding-left: 0;
}

ul.info li {
	position: relative;
	display: inline-block;
	margin-left: 10px;
	padding-left: 10px;
	color: #444;
}


ul.info:after {
	content: "";
	display: block;
	visibility: hidden;
	clear: both;
}


/* 목록버튼 */
button.btn_Wihte {
	font-size: 12px;
	color: rgb(0, 0, 0);
	line-height: 32px;
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
}

/* 내용박스 */
 .content {
	position: relative;
	padding: 20px 20px 30px 20px;
	text-align: left;
	height: auto;
	width: 1000px;
	height: 400px;
} 

/* 내용박스 내용 */
/* .context {
	width: 80%;
	height: auto;
	line-height: 180%;
	padding: 10px 0 0 30px;
	word-break: break-all;
}
 */
 
 
 
 
/* 댓글 및 대댓글 */

/* 댓글등록 버튼 */
button#btn-insert {
	width: 80px;
	height: 70px;
	border: solid 1px rgb(209, 209, 228);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-left: 10px;
	margin-bottom: 10px;
}

/* a태그 스타일 */
a {
	text-decoration: none;
	color: rgb(90, 90, 90);
}

a:hover {
	text-decoration: none;
	color: rgb(90, 90, 90);
}

/* 댓글 존 */
#comment-container {
	padding: 20px 0 0 12px;
	width: 100%;
	height: 100px;
}

.comment-content {
	width: 90%;
	height: 70px;
	text-align: left;
	padding-top: 5px;
}

.cm-writer {
	font-weight: bolder;
	font-size: 15px;
}

/* 댓글창 스타일 */
#nc_container {
	margin-top: 20px;
	width: 100%;
	height: auto;
	background-color: #f7f7f7;
}

#nc_tbl {
	width: 100%;
	border-collapse: collapse;
}

#nc_tbl tr{
	/* border: 1px solid #e2e0e0; */
}

#nc_tbl tr.level1 td {
	padding: 15px 5px 5px 50px;
	height:100px;
	float:left;	
}

.level2 td{
	padding: 15px 5px 5px 100px;
	height:100px;
	float:left;	
}

.level3 td{
	padding: 15px 5px 5px 150px;
	height:100px;
	float:left;	
}

/* 답글 tr */
tr.reply td{
	padding: 25px 5px 5px 50px;
	height:100px;
	float:left;	
}


/* 답글 버튼  */
img#replyimg{
	position:relative;
	bottom:5px;
}

/* 댓글 수정삭제 버튼 */
button.btn-reply {
	border: none;
	background: none;
	font-size: 12px;
}

div#btn-reply-container{
	position: relative;
	left:800px;
	bottom:45px;
}

div#btn-reply-container3{
	position: relative;
	left:450px;
	top:25px;

}

.btn-insert2{
	width: 80px;
	height: 53px;
	border: solid 1px rgb(209, 209, 228);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-left: 10px;
	margin-bottom: 10px;
}

footer {
	position: relative;
	top: 300px;
}

/* 글 수정 삭제  버튼 */
div.buttons {
	position: relative;
	float: right;
	bottom: 50px;
}

button#update-btn1 {
	height: 40px;
	width: 50px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

button#update-btn1:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

button#delete {
	height: 40px;
	width: 50px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

button#update-btn1:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

button.file-btn {
	height: 50px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	position: relative;
	top: 250px;
	right: 80px;
}

button.file-btn p {
	position: relative;
}
</style>


<section class="back">

	<div class="back-div bottom">
		<h2>${c.careTitle }</h2>

		<div class="buttons">	
				<c:if   test="${loginMember.name eq c.careWriter }">
				<button id="update-btn1" onclick="updateCare();">수정</button>
				</c:if>

				<button id="update-btn1" onclick="gotoList();">목록</button>
		</div>

		<hr>
		<p>
			<img src="${path }/resources/images/logo5.png" width="20px;" />&nbsp;
			<c:out value="${c.careWriter }" />
		</p>
		<p id="time">
			<fmt:formatDate value="${c.careDate }" type="date"
				pattern="yyyy/MM/dd" />
		</p>

	</div>



<div class="content">
		<p class="context">
			<c:out value="${c.careContent }" />

				<c:if   test="${loginMember.name eq c.careWriter }">
					<c:forEach items="${files}" var="f" varStatus="vs">
						<p>
							요양보호사 자격증
							<c:out value="${vs.count } - ${f.originalFilename }" />
						</p>
		
						</c:forEach>	
				</c:if>
			</p>

	</div>


<!--================== 댓글======================= -->

 
	<ul class="info">
		<li class="writer"><img src="${path }/resources/images/reply2.png" width="20px;" />&nbsp;댓글&nbsp;<c:out value="${cnt }" /></li>
		<li class="readcount">조회수&nbsp;<c:out value="${c.careReadCount }"/></li>			
		
	</ul>

<!--댓글 목록 출력하기  -->
<div id="listReply"></div>



<!--======================= 댓글등록하기====================================== -->
	
	 <div id="comment-container">
		<form action="${path}/care/commentEnd?no=${c.careNo}" method="post"
			id="commentFrm" onsubmit="return nosubmit();">

			<input type="text" name="commentContent" placeholder="여러분의 소중한 댓글을 입력해주세요."
			class="comment-content" id="comment-con" /> 			
			
			<input type="hidden" name="careNo" value="${c.careNo }"/>
			<input type="hidden" name="memberNo" value='${loginMember ne null?loginMember.memberNo:""}'> 
			<input type="hidden" name="commentLevel" value="1" /> 
			<input type="hidden" name="commentNo" value="0" />
			<input type="hidden" name="commentWriter" value='${loginMember ne null?loginMember.name:""}' />

			<button type="submit" id="btn-insert">등록</button>

		</form>
	</div>




</section>



<script>
	//비로그인시 댓글등록버튼 비활성화
	if(${loginMember eq null}){
		$("#btn-insert").attr("disabled",true);
	}else{
		$("#btn-insert").attr("disabled",false);
	}
	
	//비로그인시 로그인 알림창
	$(function(){
		$("input[name=commentContent]").click(function(){
			if(${loginMember eq null}){
				alert("로그인후 이용하세요!")
			}
		})
	});
	
	//댓글 목록 출력
	
	var care = $("input[name=careNo]").val();
	
	 $(function(){
		$.ajax({
			type: "get", //get방식으로 댓글 전달
			url:"${path}/care/commentList",
			data:{"no":care},
			success:function(result){//성공하면 출력하기
				$("#listReply").html(result);
			
			}
		})
	}) 
	

	//서밋 x
	function nosubmit(){
		if($(".comment-content").val().length==0){
			return false;
		}else{
			return true;
		}
	}	
	
	//글 수정하기
		function updateCare(){
			location.replace('${path}/care/updateView?no=${c.careNo}');
		}
			
	//목록으로이동
	function gotoList(){
		location.replace('${path}/care/careNotice');
	}
	

	
</script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />
