
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>

/* 섹션안 공간 */
div.back {
	position: relative;
	left: 370px;
	top: 50px;
	margin-bottom: 25px;
} /* content 공간 */
div.goodsback {
	display: block;
	width: 80%;
} 
div.healthInfoWrite {
	display: none;
	width: 80%;
}
/*전체 1:1상담 목록 텍스트 */
h1.title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
} /* 제목밑에 선 */
hr.gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
	float: left;
}
/* content 위치 */
div.list-container {
	position: relative;
	top: 10px;
}

/* 테이블 선 색상 */
div.box>th, tr, td {
	border: 1px solid #e2e0e0;
	border-right: 1px solid #e2e0e0;
	padding: 7px;
}

tr:first-of-type {
	color: #80878d;
	text-align: center;
	vertical-align: middle;
	font-weight: normal;
	font-size: 15px;
	background-color: rgb(228, 235, 246);
	padding: 9px 10px 7px;
} /* 테이블 스타일 */
table.box {
	width: 80%;
	text-align: center;
	border: 1px solid #e2e0e0;
	border-collapse: collapse;
} /* 문의내용이
존재하지 않습니다. */
td#conbox {
	text-align: center;
	height: 300px;
	font-size: 15px;
	position: relative;
	width: 100%;
} /* 페이지바 위치 */
div#pageBar {
	position: relative;
	top: 20px;
} /* 페이지바 a태그 */
div#pageBar a {
	text-decoration: none;
	color: rgb(95, 93, 93);
} /* 답변상태 버튼 */
.inquiry-btn {
	position: relative;
	height: 30px;
	width: 80px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

.inquiry-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
} /*
리스트상자 */
.mListHeader {
	padding: 7px 15px;
	padding-bottom: 10px;
	border: 1px solid #bcbfc4;
	line-height: 21px;
	text-align: center;
	background: rgb(190, 209, 245);
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
	width: 80%;
	height: 50px;
	top: 23px;
} /* 삭제 버튼위치 */
.gleft {
	position: relative;
	right: 330px;
	top: 2px;
}

#numPerPage {
	position: relative;
	left: 370px;
	top: -25px;
} /* 삭제 버튼 스타일 */
.btn_Wihte {
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
} /* 검색결과
스타일 */
.total {
	font-size: 15px;
	font-family: "Nanum Gothic";
	color: rgb(49, 49, 49);
	margin: 2px 8px 0px 0px;
}

.total>span>strong {
	color: rgb(76, 231, 231);
}

#pageBar {
	width: 80%;
	margin: 40px 0 40px 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #eee;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}

tr.contentTR>td {
	overflow: hidden;
}
.disesaseWriteContent {
	display:flex; 
	justify-content:flex-start; 
	width:80%;
}
.disesaseWriteSubTitle {
	margin-left: 10px;
	width: 490px;
}
#disesaseSubTitle {
	width: 100%;
}

</style>

<div class="content-wrapper">
	<div class="back">
	<!-- ========================================= 건강정보 등록 관리 ========================================-->
		<div class="goodsback">
			<h1 class="title">건강정보 등록 관리</h1>
			<hr class="gline">
			<br> <br>
			<p style="display:flex; justify-content:space-between; width:80%;" class="total">				
				<span>
				<select id='keyword'>
					<option value="전체">진료항목 선택</option>
					<c:forEach items="${list }" var="d">
						<option value="${d.DISESASETITLE}"><c:out value="${d.DISESASETITLE}" /></option>
					</c:forEach>
				</select>
				검색결과<strong></strong>건
				</span>
			<span><button type='button' id="healthInfoWrite" class='inquiry-btn'>글쓰기</button></span>
			</p>
			<div class="list-container">
				<div class="mListHeader">
					<div class="gleft"></div>
				</div>
				<br />

				<table class="box">
					<tr id='contentTitle'>
						<td style='width:40%'>질병명</td>
						<td style='width:40%'>건강정보글 제목</td>
						<td style='width:10%'>수정</td>
						<td style='width:10%'>삭제</td>
					</tr>
				</table>
				<div id="pageBar">
				</div>
			</div>
		</div>
		<!--======================================건강정보 작성==========================================-->
		<div class="healthInfoWrite">
			<h1 class="title">건강정보 작성</h1>
			<hr class="gline">
			<br> <br>
			<div class="disesaseWriteContent">
				<div class="disesaseWriteTitle">
					<label for="disesaseSort">질병명 : </label>
					<select id="disesaseSort" name="disesaseSort">
						<option value="직접입력">직접입력</option>
						<c:forEach items="${list }" var="d">
							<option value="${d.DISESASENO}"><c:out value="${d.DISESASETITLE}" /></option>
						</c:forEach>
					</select>
					<input class="name" style="width:40%;" type="text" id="disesaseTitle" name="disesaseTitle">
					<input type="hidden" id="disesaseNo" name="disesaseNo">
				</div>
				<div class="disesaseWriteSubTitle">
					<textarea rows="1" id="disesaseSubTitle" name="disesaseSubTitle" placeholder="질병의 간단한 내용을 작성하세요."></textarea>
				</div>
			</div>
			<div class="disesaseFile">
				<div class="custom-file" style="display:inline;">
                    <input type="file" class="custom-file-input" name="disesaseFile" id="disesaseFile">
                    <label class="custom-file-label" style="width:80%;" for="disesaseFile">질병을 표현할 사진을 선택하세요</label>
                </div>
			</div>
			<hr class="gline">
			<br> <br>
			<div class="confirmerSelect">
				<label for="confirmerSort">검수자 : </label>
				<select id="confirmerSort">
					<option value="직접입력">직접입력</option>
					<c:forEach items="${confirmerList }" var="c">
						<option value="${c.CONFIRMERNO}"><c:out value="${c.CONFIRMERNAME}" /></option>
					</c:forEach>
				</select>
				<input class="name" style="width:10%;" type="text" id="confirmerName" name="confirmerName">
				<input type="hidden" id"="confirmerNo" name="confirmerNo">
				<input type="hidden" id"="confirmerNo" name="confirmerNo">
				<input type="hidden" id"="confirmerNo" name="confirmerNo">
				<input type="hidden" id"="confirmerNo" name="confirmerNo">
			</div>
			
			
		</div>
		<!-- =============================================================================================== -->
	</div>
</div>


<script>
	$.ajax({
		url:"${path}/admin/healthInfoPaging.do",
		data:{'keyword':$('#keyword').val()},
		success:function(data) {
			$('.total>span>strong').append(data.count);
			$('#pageBar').append(data.pageBar);
			for (var i = 0; i < data.healthInfoAllList.length; i++) {
				var tr="<tr class='contentTR'><td>"+data.healthInfoAllList[i].DISESASETITLE+"</td>"
						+"<td>"+data.healthInfoAllList[i].HEALTHINFOTITLE+"</td>"
						+"<td><button type='button' class='inquiry-btn'>수정</button></td>"
						+"<td><button type='button' class='inquiry-btn'>삭제</button></td></tr>";
				$('.box').append(tr);						
			}
		}
	});
	
	function fn_paging(cPage){
		$('#contentTitle').siblings('tr.contentTR').remove();
		$.ajax({
			url:"${path}/admin/healthInfoPaging.do",
			data:{'cPage':cPage, 'keyword':$('#keyword').val()},
			success:function(data) {
				for (var i = 0; i < data.healthInfoAllList.length; i++) {
					var tr="<tr class='contentTR'><td>"+data.healthInfoAllList[i].DISESASETITLE+"</td>"
							+"<td>"+data.healthInfoAllList[i].HEALTHINFOTITLE+"</td>"
							+"<td><button type='button' class='inquiry-btn'>수정</button></td>"
							+"<td><button type='button' class='inquiry-btn'>삭제</button></td></tr>";
					$('.box').append(tr);						
				} 
			}
		})
	}
	
	$('#keyword').change(function(){
		$('#contentTitle').siblings('tr.contentTR').remove();
		$('.total>span>strong').text('');
		$('#pageBar').children().remove();
		$.ajax({
			url:"${path}/admin/healthInfoPaging.do",
			data:{'keyword':$('#keyword').val()},
			success:function(data) {
				$('.total>span>strong').append(data.count);
				$('#pageBar').append(data.pageBar);
				for (var i = 0; i < data.healthInfoAllList.length; i++) {
					var tr="<tr class='contentTR'><td>"+data.healthInfoAllList[i].DISESASETITLE+"</td>"
							+"<td>"+data.healthInfoAllList[i].HEALTHINFOTITLE+"</td>"
							+"<td><button type='button' class='inquiry-btn'>수정</button></td>"
							+"<td><button type='button' class='inquiry-btn'>삭제</button></td></tr>";
					$('.box').append(tr);						
				}
			}
		});
	})
	
	$('#healthInfoWrite').click(function() {
		$('.goodsback').css('display','none');
		$('.healthInfoWrite').css('display','block');
	})
	
	$('select').change(function() {
		if($(this).val()=='직접입력') {
			$(this).siblings('input').val('');
			$(this).siblings('input.name').focus();
			$(this).siblings('input.name').prop('readonly',false);
			$(this).siblings('input.name').attr({placeholder:'직접 입력'});
			
			/* $('#disesaseTitle').val('');
			$('#disesaseTitle').focus();
			$('#disesaseTitle').prop('readonly',false);
			$('#disesaseTitle').attr({placeholder:'직접 입력'}); */
		}else {			
			$(this).siblings('input').prop('readonly',true);
			if($(this).attr('name')=='disesaseSort') {
				$.ajax({
					url:"${path}/admin/selectDisesaseCategory.do",
					data:{'disesaseNo':$('#disesaseSort').val()},
					success:function(data) {
						console.log(data.dc);
						$('#disesaseTitle').val(data.dc.disesaseTitle);
						$('#disesaseSubTitle').val(data.dc.disesaseSubTitle);
						$('#disesaseFile').val("${path}"+data.dc.disesaseFile);
						$('#disesaseTitle').prop('readonly',true);
						$('#disesaseSubTitle').prop('readonly',true);
						$('#disesaseFile').prop('readonly',true);
					}
				})
			}else {
				$.ajax({
					url:"${path}/admin/selectConfirmer.do",
					data:{'confirmerNo':$('#confirmerSort').val()},
					success:function(data) {
						$('#confirmerName').val(data.c.confirmerName);
						//$('#disesaseSubTitle').val(data.dc.disesaseSubTitle);
						//$('#disesaseFile').val("${path}"+data.dc.disesaseFile);
						$('#confirmerName').prop('readonly',true);
						//$('#disesaseSubTitle').prop('readonly',true);
						//$('#disesaseFile').prop('readonly',true);
					}
				})
			}
			
		}
	})
</script>






<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />