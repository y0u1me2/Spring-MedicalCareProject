<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!--===================== 댓글출력하기 =========================== -->
<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->
<div id="listReply">
<div id="nc_container">	
	<table id="nc_tbl">
		<c:forEach items="${list }" var="c">
			<c:if test="${c.commentLevel eq 1}">

			<tr class="level1">
					<td>
						<sup class="cm-writer"><img src="${path }/resources/images/logo5.png" width="20px;" />
						<c:out value="${c.commentWriter }" /></sup>&nbsp;&nbsp;&nbsp;
						<br/>
						<c:out value="${c.commentContent }" />
						<br/>
						<sup class="comment-date"><fmt:formatDate value="${c.commentDate }" type="date" pattern="yyyy/MM/dd"/></sup>
						<button class="btn-reply btnre" name="commentNo" id="rep-btn" value="${c.commentNo }">
						 <img src="${path }/resources/images/reply.png" width="10px;" id="replyimg" />&nbsp;답글</button>
						 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.memberNo  }">		 
					<div id="btn-reply-container">
						<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
						|
						<button class="btn-reply btnre" name="commentNo" id="delete-btn">삭제</button>
						
						<input type="hidden" name="cno"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
						
					</div>
					</c:if>
					</td>					
				</tr>
			</c:if>

			<c:if test="${c.commentLevel eq 2}">

				<tr class="level2">
					<td>
						<sup class="cm-writer"><img src="${path }/resources/images/logo5.png" width="20px;" />
						<c:out value="${c.commentWriter }" /></sup>&nbsp;&nbsp;&nbsp;
						<br/>
						<c:out value="${c.commentContent }" />						
						<br/>
						<sup class="comment-date"><fmt:formatDate value="${c.commentDate }" type="date" pattern="yyyy/MM/dd"/></sup>
					

						<button class="btn-reply btnre" name="commentNo" id="rep-btn" value="${c.commentNo }">
						 <img src="${path }/resources/images/reply.png" width="10px;" />답글</button>
					
						 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.memberNo  }">	 					
					<div id="btn-reply-container">
						<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
						|
						<button class="btn-reply btnre" name="commentNo" id="delete-btn">삭제</button>
						<input type="hidden" name="cno"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
						<input type="hidden" name="memberNo" value="${loginMember.memberNo}" />
						<input type="hidden" name="commentWriter" value="${loginMember.name }" />
					</div>	
					</c:if>
					</td>
				</tr>
			</c:if>


			<c:if test="${c.commentLevel eq 3}">

				<tr class="level3">
					<td>
						<sup class="cm-writer"><img src="${path }/resources/images/logo5.png" width="20px;" />
						<c:out value="${c.commentWriter }" /></sup>&nbsp;&nbsp;&nbsp;
							<sup class="comment-date"><fmt:formatDate value="${c.commentDate }" type="date" pattern="yyyy/MM/dd"/></sup>
						<c:out value="${c.commentContent }" />
					</td>
					
					<td>
						<button class="btn-reply btnre" name="commentNo" id="rep-btn" value="${c.commentNo }">
						 <img src="${path }/resources/images/reply.png" width="10px;" />답글</button>
						 <br/>
						 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.commentNo  }">		 
					<td style="display: flex; position: relative; left: 180px; top: 30px;">
						<button class="btn-reply btnre" id="update-btn">수정</button>
						|
						<button class="btn-reply btnre" id="delete-btn">삭제</button>
						
						<input type="hidden" name="cno"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
										
					</td>
					</c:if>
				</tr>
			</c:if>

		</c:forEach>

	</table>
</div>  
</div>

<script>

	var cno = $("input[name=cno]").val();
	var care = $("input[name=careNo]").val();
	var mNo = $("input[name=memberNo]").val();
	var name = $("input[name=commentWriter]").val();
		
//댓글삭제
$("#delete-btn").click(function(){
	
	if(confirm("댓글을 삭제하시겠습니까?")){
		location.replace('${path}/care/replydelete?no='+cno+'&cno='+care);
	}
})

//댓글수정
$("#update-btn").click(function(){
	if(${loginMember.name eq c.careWriter}){
		$(".level1").hide();
	}
})	
	
	//댓글 목록 출력
	$(function(){
		$.ajax({
			type: "get", //get방식으로 댓글 전달
			url:"${path}/care/commentList?no=${c.careNo}",
			success:function(result){//성공하면 출력하기
				console.log(result);
				$("#listReply").html(result);
			
			}
		})
	})



//대댓글 클릭시 입력칸 뜨기
	$(".btn-reply.btnre").click(function(){
	
			const tr=$("<tr>").attr("class","reply");
			
			const td=$("<td>").css({
				"display":"none"
			});
		
			const form=$("<form>").attr({
				"action":'${path}/care/commentEndEnd?no='+care,
				"method":"post",
				"width":"100%",
				"onsubmit":"return nosubmit();"
			});
			
			const boardRef=$("<input>").attr({
					"type":"hidden",
					"name": "careNo",
					"value":care
			});
		
			const memberNo=$("<input>").attr({
					"type":"hidden",
					"name":"memberNo",
					"value":mNo
			});
			
			const writer=$("<input>").attr({
				"type":"hidden",
				"name": "commentWriter",
				"value":name
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
				"name": "commentRef",
				"value":$(this).val()
			});
			
			const btn=$("<button>").attr({
				"type":"submit","class":"btn-insert2 btn-reply2"
			}).html("등록");
			
			form.append(boardRef).append(memberNo).append(writer).append(level).append(comment).append(commentRef).append(btn);
			td.append(form);
			tr.append(td);
			
			($(this).parent().parent()).after(tr);
			tr.children("td").slideDown(500);
			$(this).off("click");
			
			
		
	});

	
</script>
