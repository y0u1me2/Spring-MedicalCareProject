	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
		
<style>

div.content-wrapper{
	background-color:white;
	position: relative;
	left: 350px;
}

div.goodsback{
	width:80%;
	height:auto;
	position: relative;
	top: 50px;
	margin-bottom:25px;
}

* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}


/* 1:1문의 텍스트 */
h1#title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
	;
}

/*제목 밑에 라인 */
hr#line1 {
	   border: 1px solid rgb(177, 174, 174);
        position: relative;
        top: 20px;
        width: 80%;
}

h1#title2 {
	width: 100%;
	text-align: left;
	color: rgb(97, 96, 96);
	font-size: 15px;
}

table#tbl-detail {
	width: 820px;
	height: 300px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
}

table#tbl-detail th {
	width: 125px;
	border: 1px solid #e2e0e0;
	padding: 5px 0;
	text-align: center;
	background-color: rgb(228, 235, 246);
}

table#tbl-detail td {
	border: 1px solid #e2e0e0;
	padding: 5px 0 5px 10px;
	text-align: left;
}

 /* 답변하기 버튼 */
#update-btn{
        height: 35px;
        width: 100px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 5px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
        position:relative;
        top:-2px;
    }

    .back-btn:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 
    
    a span{
    	text-decoration: none;
        color: rgb(95, 93, 93);
    }
    
    div#detailBack{
    	position:relative;
    	right:120px;
    }
  button.file-btn {
	height: 50px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	

}
 
</style>

<!-- ============================================================== -->

<div class="content-wrapper">


	<form action="${path }/admin/careNoticeYes?no=${c.careNo}" method="post">


			<div class="goodsback">
		<h1 id="title">돌보미 등록 승인하기</h1>
		<hr id="line1">
		<br>
		<br>

			<div>
				<h1 id="title2">고객님의 돌보미 등록 글입니다.</h1>
			</div>
			<br>
		<div id="detailBack">

			<table id="tbl-detail">
				<tr>
					<th>제목</th>
					<td><c:out value="${c.careTitle }"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><c:out value="${c.careContent}"/></td>
				</tr>
				
				<tr>
					<th>자격증</th>
					<td>
						<c:forEach items="${files}" var="f" varStatus="vs">
					<button type="button" class="file-btn"
						onclick="fileDownload('${f.originalFilename}','${f.renamedFilename }')">

						<p>
							요양보호사 자격증
							<c:out value="${vs.count } - ${f.originalFilename }" />
						</p>
					</button>
				</c:forEach>				
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center"><input
						type="submit" id="update-btn" value="승인하기" >
		
					</td>
				</tr>
			</table>
			</div>
			
			</form>
			
		</div>
		
</div>

<script>
//파일다운로드
function fileDownload(ori,rename){
    ori=encodeURIComponent(ori);
    location.href="${path}/admin/fileDownload?oName="+ori+"&rName="+rename;
 }



</script>






	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>