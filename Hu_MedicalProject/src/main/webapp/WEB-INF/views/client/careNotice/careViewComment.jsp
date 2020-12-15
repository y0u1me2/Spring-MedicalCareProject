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
						<button class="btn-reply reply1" name="commentNo" id="rep-btn" value="${c.commentNo }">
						 <img src="${path }/resources/images/reply.png" width="10px;" id="replyimg" />&nbsp;답글</button>
						 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.memberNo  }">		 
					<div id="btn-reply-container">
						<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
						|
						<button class="btn-reply del" name="commentNo" value="${c.commentNo }" id="delete-btn1">삭제</button>
												
						<input type="hidden" class="cRef" name="cno1"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
							<input type="hidden" name="memberNo" value="${loginMember.memberNo}" />
						<input type="hidden" name="commentWriter" value="${loginMember.name }" />
						<input type="hidden" class="level" name="level" value="${c.commentLevel}" />					
								
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
					

						<button class="btn-reply reply2" name="commentNo" id="rep-btn" value="${c.commentNo }">
						 <img src="${path }/resources/images/reply.png" width="10px;" />답글</button>
					
						 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.memberNo  }">	 					
					<div id="btn-reply-container">
						<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
						|
						<button class="btn-reply del" name="commentNo" value="${c.commentNo }" id="delete-btn2">삭제</button>
						
						<input type="hidden" class="cRef" name="cno2"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
						<input type="hidden" name="memberNo" value="${loginMember.memberNo}" />
						<input type="hidden" name="commentWriter" value="${loginMember.name }" />
						<input type="hidden" class="level" name="level" value="${c.commentLevel}" />
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
						<br/>
						<c:out value="${c.commentContent }" />
						<br/>
							<sup class="comment-date"><fmt:formatDate value="${c.commentDate }" type="date" pattern="yyyy/MM/dd"/></sup>
					</td>
					
					<td>
								 
					<c:if test="${loginMember ne null and loginMember.memberNo eq c.memberNo  }">	 					
					<div id="btn-reply-container3">
						<button class="btn-reply btnre" name="commentNo" id="update-btn">수정</button>
						|
						<button class="btn-reply del" name="commentNo" value="${c.commentNo }" id="delete-btn3">삭제</button>
						
						<input type="hidden" class="cRef" name="cno3"  value="${c.commentNo }"/>
						<input type="hidden" name="careNo"  value="${c.careNo }"/>
						<input type="hidden" class="level" name="level" value="${c.commentLevel}" />
					</div>					
					</c:if>
					</td>
				</tr>
			</c:if>

		</c:forEach>

	</table>
</div>  
</div>

<script>

	var cno1 = $("input[name=cno1]").val();
	var cno2 = $("input[name=cno2]").val();
	var cno3 = $("input[name=cno3]").val();
	
	//var commentNo = $(".cRef").val();
	var care = $("input[name=careNo]").val();
	var mNo = $("input[name=memberNo]").val();
	var name = $("input[name=commentWriter]").val();
	var url1 = '${path}/care/commentEndEnd?no='+care;
	
//댓글삭제

$(".btn-reply.del").click(function(){
		
	var commentNo = $(event.target).val();
	
	if(confirm("댓글을 삭제하시겠습니까?")){
		location.replace('${path}/care/replydelete?no='+commentNo+'&cno='+care);
	}
})


//답글 클릭시 입력칸 뜨기
	$(".reply1").click(function(){
		const tr=insertFunction(2,$(event.target).val(),"등록",url1);
		
		$(event.target).parent().parent().after(tr);
		tr.children("td").slideDown(500);
		$(event.target).off("click");
		
		$(".reply1").click(function(){
			tr.children("td").slideUp(500);
		})
		cancelBtn();
	});

	
	$(".reply2").click(function(){
		
		const tr=insertFunction(3,$(event.target).val(),"등록",url1);
		
		$(event.target).parent().parent().after(tr);
		tr.children("td").slideDown(500);
		$(event.target).off("click");
		
		$(".reply2").click(function(){
			tr.children("td").slideUp(500);
		})
		cancelBtn();
				
	});
	
function insertFunction(number,number2,btnName,url) {

	
	const tr=$("<tr>").attr("class","reply");
	
	const td=$("<td>").css({
		"display":"none"
	});

	const form=$("<form>").attr({
		"action":url,
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
		"value": number
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
		"value":number2
	});
	
	const commentNo=$("<input>").attr({
		"type":"hidden",
		"name": "commentNo",
		"value":number2
	});

	const btn=$("<button>").attr({
		"type":"submit","class":"btn-insert2 btn-reply2"
	}).html(btnName);
	
	const btn2=$("<button>").attr({
		"type":"button","class":"btn-insert2 btn-reply2 cancel"
	}).html("취소");


	form.append(boardRef).append(memberNo).append(writer).append(level).append(comment).append(commentRef).append(commentNo).append(btn).append(btn2);
	td.append(form);
	tr.append(td);
	
	return tr;
}
	
	
//댓글 수정하기	
 $(".btn-reply.btnre").click(function(){
	 
	 const number=$(this).siblings('input.level').val();
	 const number2=$(this).siblings('input.cRef').val();
	 
	 const url2 = '${path}/care/replyupdate?no='+number2+'&cno='+care;
	 
	 const tr = insertFunction(number,number2,"수정",url2);
	 
	 $(this).parent().parent().hide();
	 $(this).parent().parent().parent().append(tr);
	 tr.children("td").css("display","block");
	 cancelBtn();
 })

//댓글 수정,등록 취소버튼
function cancelBtn() {
	$(".cancel").click(function(){
		console.log($(this).parent());
		$(event.target).parent().parent().css("display","none");
		$(event.target).parent().parent().parent().siblings('td').css("display","block");
	})	
}


</script>
