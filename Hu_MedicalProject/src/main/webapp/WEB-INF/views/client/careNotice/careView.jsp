
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

/* 댓글 조회수 인쇄 */
ul.info {
	padding-left: 30px;
	padding-top: 10px;
	font-size: 13px;
}

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

/* 인쇄버튼 */
ul.info li.copy {
	position: relative;
	left: 900px;
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
.context {
	width: 80%;
	height: auto;
	line-height: 180%;
	padding: 10px 0 0 30px;
	word-break: break-all;
}

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
/* 좋아요 */
img#heart {
	width: 15px;
	position: relative;
	bottom: 2px;
}

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

#nc_tbl tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

#nc_tbl tr td:last-of-type {
	text-align: right;
	width: 100px;
	padding-right: 12px;
}

/* 댓글 수정삭제 버튼 */
button.btn-reply {
	border: none;
	background: none;
	font-size: 12px;
	position: relative;
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

button#delete-btn1 {
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
			<button id="update-btn1" onclick="updateCare();">수정</button>
			<button id="delete-btn1" onclick="gotoList();">목록</button>
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

			<c:if test="${loginMember.name eq '관리자'}">
				<c:forEach items="${files}" var="f" varStatus="vs">
					<button type="button" class="file-btn"
						onclick="fileDownload('${f.originalFilename}','${f.renamedFilename }')">

						<p>
							요양보호사 자격증
							<c:out value="${vs.count } - ${f.originalFilename }" />
						</p>
					</button>
				</c:forEach>
			</c:if>
		</p>
	</div>

	<ul class="info">
		<li class="writer">댓글21</li>
		<li class="readcount">조회수</li>
		<li>좋아요&nbsp;<img src="${path }/resources/images/heart.png"
			id="heart" />&nbsp;2
		</li>

	</ul>



	<div id="nc_container">

		<table id="nc_tbl">


			<tr class="level1">
				<td><sup class="cm-writer"><img
						src="${path }/resources/images/logo5.png" width="20px;" />
						&nbsp;기린</sup>&nbsp;&nbsp;&nbsp; <sup>2020.04.24 18:03</sup>

					&nbsp;&nbsp;&nbsp;<sup><a href=""> <img
							src="${path }/resources/images/reply.png" width="10px;" /> 답글
					</a></sup> </br>

					<p>첫번째 댓글이야</p></td>
				<td
					style="display: flex; position: relative; left: 180px; top: 30px;">
					<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
					|
					<button class="btn-reply btnre" name="commentNo" id="delete-btn">삭제</button>
				</td>
			</tr>




			<tr class="level2" style="background-color: #f7f7f7">
				<td><sup class="cm-writer"><img src="images/logo.png"
						width="20px;" /> &nbsp;기린</sup>&nbsp;&nbsp;&nbsp; <sup>2020.04.24
						18:03</sup> &nbsp;&nbsp;&nbsp;<sup><a href=""> <img
							src="images/reply.png" width="10px;" /> 답글
					</a></sup> </br>
					<p>두번째 댓글이야</p></td>
				<td style="display: flex; position: relative; left: 180px;">
					<button class="btn-reply" name="commentNo" id="update-btn">수정</button>
					|
					<button class="btn-reply" name="commentNo" id="delete-btn">삭제</button>
				</td>
			</tr>

		</table>
	</div>

	<div>
		<span><strong>Comments</strong></span> <span id="cCnt"></span>
	</div>

	<div id="comment-container">
		<form action="${path}/care/commentEnd?cno=${c.careNo}" method="post"
			id="commentFrm" onsubmit="return nosubmit();">

			<input type="text" name="commentContent" class="comment-content"
				id="comment-con" /> <input type="hidden" name="commentRef"
				value="${c.careNo }" /> <input type="hidden" name="commentWriter"
				value='${loginMember ne null?loginMember.name:""}'> <input
				type="hidden" name="commentLevel" value="1" /> <input type="hidden"
				name="commentNo" value="0" />

			<button type="submit" id="btn-insert">등록</button>

		</form>
	</div>


	<!-- 댓글출력하기 -->
	<table>
		<c:forEach items="${list }" var="c">
			<c:if test="${c.commentLevel eq 1}">

				<tr class="level1">
					<td><sub class="comment-writer"><c:out
								value="${c.name }" /></sub> <sub class="comment-date"><c:out
								value="${c.commentDate }" /></sub> <br /> <c:out
							value="${c.commentContent }" /></td>
					<td>
						<button class="btn-reply reply1" value="${c.commentNo }">답글</button>
					</td>
				</tr>

			</c:if>

			<c:if test="${c.commentLevel eq 2}">

				<tr class="level2">
					<td><sub class="comment-writer"><c:out
								value="${c.name }" /></sub> <sub class="comment-date"><c:out
								value="${c.commentDate }" /></sub> <br /> <c:out
							value="${c.commentContent }" /></td>
					<td>
						<button class="btn-reply reply2" value="${c.commentNo }">답글</button>
					</td>
				</tr>

			</c:if>

			<c:if test="${c.commentLevel eq 3}">

				<tr class="level3">
					<td><sub class="comment-writer"><c:out
								value="${c.name }" /></sub> <sub class="comment-date"><c:out
								value="${c.commentDate }" /></sub> <br /> <c:out
							value="${c.commentContent }" /></td>
					<td></td>
				</tr>

			</c:if>

		</c:forEach>

	</table>





</section>




<script>
	//수정하기
		function updateCare(){
			location.replace('${path}/care/updateView?no=${c.careNo}');
		}
			
	//목록으로이동
	function gotoList(){
		location.replace('${path}/care/careNotice');
	}
	
	//파일다운로드
	 function fileDownload(ori,rename){
         ori=encodeURIComponent(ori);
         location.href="${path}/care/fileDownload?oName="+ori+"&rName="+rename;
      }
	 
			
			
	//댓글 리스트 불러오기
	<%-- $('.reply1').click(function() {
	
                           const tr=$('<tr>');
                           const td=$('<td>').css({
                              "display":"none","text-align":"left"
                           }).attr('colspan',2);
                           
                           const form=$("<form>").attr({
                                    "action" : "${path}/care/commentList",
                                    "method" : "post"
                                 });
                              const commentWriter=$("<input>").attr({
                                    "type" : "hidden",
                                    "name" : "boardRef",
                                    "value" : "${}"
                                 });
                              const boardRef=$("<input>").attr({
                                    "type" : "hidden",
                                    "name" : "commentWriter",
                                    "value" : "${loginmember.name}"
                                  });
                     
                          const level = $("<input>").attr({
                        "type" : "hidden",
                        "name" : "commentLevel",
                        "value" : "2"

                     });
                     const comment = $("<input>").attr({
                        "type" : "text",
                        "name" : "commentContent",

                     });
                     const commentRef = $("<input>").attr({
                        "type" : "hidden",
                        "name" : "commentRef",
                        "value" : $(this).val()

                     });
                     const btn = $("<button>").attr({
                        "type" : "submit",
                        "class" : "btn-insert2"
                     }).html("등록");
                     
                     form.append(commentRef).append(commentWriter).append(
                           level).append(comment).append(commentRef)
                           .append(btn);
                     td.append(form);
                     tr.append(td);
                     ($(this).parent().parent()).after(tr);
                     tr.children("td").slideDown(500);
                     $(this).off('click');
                  }
               })
               
               
               //===================================================================================
               $('.reply2').click(function() {
                           const tr=$('<tr>');
                           const td=$('<td>').css({
                              "display":"none","text-align":"left","padding-left":"80px"
                           }).attr('colspan',2);
                           
                           const form=$("<form>").attr({
                                    "action" : "${path}/care/commentList",
                                    "method" : "post"
                                 });
                              const commentWriter=$("<input>").attr({
                                    "type" : "hidden",
                                    "name" : "boardRef",
                                    "value" : "<%=b.getBoardNo()%>"
                                 });
                              const boardRef=$("<input>").attr({
                                    "type" : "hidden",
                                    "name" : "commentWriter",
                                    "value" : "${loginMember.name}"
                                  });
                     const level = $("<input>").attr({
                        "type" : "hidden",
                        "name" : "commentLevel",
                        "value" : "3"

                     });
                     const comment = $("<input>").attr({
                        "type" : "text",
                        "name" : "commentContent",

                     });
                     const commentRef = $("<input>").attr({
                        "type" : "hidden",
                        "name" : "commentRef",
                        "value" : $(this).val()

                     });
                     const btn = $("<button>").attr({
                        "type" : "submit",
                        "class" : "btn-insert2"
                     }).html("등록");
                     
                     form.append(boardRef).append(commentWriter).append(
                           level).append(comment).append(commentRef)
                           .append(btn);
                     td.append(form);
                     tr.append(td);
                     ($(this).parent().parent()).after(tr);
                     tr.children("td").slideDown(500);
                     $(this).off('click');
                  }
  
	
	//대댓글 클릭시 아래뜨게하기
	$(".btn-reply").click(function(){
		if(<%=loginMember!=null%>){
			const tr=$("<tr>").attr("class","reply");
			const td=$("<td>").css({
				"display":"none"
			}).attr("colspan",2);
			const form=$("<form>").attr({
				"action":"<%=request.getContextPath()%>/notice/noticeComment",
				"method":"post",
				"width":"100%",
				"onsubmit":"return nosubmit();"
			});
			const boardRef=$("<input>").attr({
					"type":"hidden",
					"name": "noticeNo",
					"value":"<%=n.getnNo()%>"
			});
			const writer=$("<input>").attr({
				"type":"hidden",
				"name": "commentWriter",
				"value":"<%=loginMember!=null?loginMember.getM_No():""%>"
			});
			const level=$("<input>").attr({
				"type":"hidden",
				"name": "commentLevel",
				"value":"2"
			});
			const comment=$("<input>").attr({
				"type":"text",
				"name": "commentContent",
				"class":"comment-content",
			}).css({
				"width":"950px",
				"height":"50px"
			})
			const commentRef=$("<input>").attr({
				"type":"hidden",
				"name": "commentNo",
				"value":$(this).val()
			});
			const btn=$("<button>").attr({
				"type":"submit","class":"btn-insert2 btn-reply2"
			}).html("등록");
			
			form.append(boardRef).append(writer).append(level).append(comment).append(commentRef).append(btn);
			td.append(form);
			tr.append(td);
			($(this).parent().parent()).after(tr);
			tr.children("td").slideDown(500);
			$(this).off("click");
		}
	})
	
	
	}
	
	//내용이 없으면 댓글 등록 x
	function nosubmit(){
		if($(".comment-content").val().length==0){
			return false;
		}else{
			return true;
		}
	} --%>
	
</script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />
