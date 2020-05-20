<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp">
<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
<style>
/* 페이지바 */
 #pageBar {
  /*  position: relative; */
   left:100px;
   top: 200px;
}

div#pageBar a {
   text-decoration:none;
   color: rgb(95, 93, 93);
}

/* 페이지바 */
 #pageBar{
   width:80%;
   margin-left:550px;
   margin-top:30px;
   margin-bottom:20px;
   /* text-align:center; */
}
#pageBar>a,#pageBar>span{
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
.noticeBack{
	background-image: url( "${path }/resources/images/noticeBack.jpg" );
	background-attachment: fixed;
}
#noticeTitle{
	margin-top: 200px;
	text-align: left;
	margin-left: 80px;
	color:white;
	font-size: 100px;
	font-weight:700;
}
   </style>  
<section>
<div class="container-fluid p-0 border" style="">
	<div class="noticeBack border" style="height:600px;">
		<h1 id="noticeTitle">HU의 공지사항<br>알려드립니다.</h1>
	</div>
   
  <div class="container" style="margin-top:50px;height:350px; background-color:white;">
   <p>공지사항 총 <c:out value="${count }"/>건</p>
   
    <table class="table table-hover" style="border-top-color: black;">
        <thead>
          <tr>
            <th>NO</th>
            <th style="text-align: center;">제목</th>
            <th>첨부파일</th>
            <th style="text-align:right;">날짜&emsp;&emsp;</th>
          </tr>
        </thead>
        <tbody>
   			<c:forEach items="${list }" var="n">
				<tr>
					<td>&nbsp;<c:out value="${n['noticeNo'] }" /></td>
					<td>
					<a href="${path }/notice/noticeView?no=${n.noticeNo }"> 
						<c:out value="${n['noticeTitle'] }" />
					</a>
					</td>
					<td>&nbsp;&nbsp;&nbsp;
		                <c:if test="${n.fileCount>0}">
		                	<img src="${path }/resources/images/file.png" width="16px"/>
						</c:if>
                	</td>
					<td style="text-align:right"><fmt:formatDate value="${n['noticeDate'] }" type="date" pattern="yyyy/MM/dd"/></td>	
				</tr>
			</c:forEach>
		
 	  </tbody>
	 </table>
 </div>
 <c:if test="${loginMember.email eq 'admin' }">
   		 <button type="button" class="btn btn-secondary" id="noticeBtn" style="margin-left:1100px;"onclick="noticeInsert();"> 공지사항 작성</button>
     </c:if>
    <div style="text-align: center; font-size: 20px;" id="search-container">
		 <form action="${path }/notice/search.do" method="post">
            <select name="searchContent" id="searchContent" style="background-color:white; height:35px;">
              <option value=""  disabled selected>선택</option>
              <option value="noticeTitle"  <c:if test="">selected</c:if>>제목</option>
            </select>
            <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" size="20" value="${param.keyword }" required autocomplete="off">
            <input type="submit" id="searchBtn" class="search_btn" value="검색"/>
           </form>		
		</div>
			
  <div id="pageBar">
  	${pageBar }
  </div>
 </div>
</section>

<script>

function noticeInsert(){
	location.replace('${path }/notice/noticeInsert');
}
    </script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>