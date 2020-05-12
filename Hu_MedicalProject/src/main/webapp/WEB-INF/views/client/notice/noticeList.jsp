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
      margin-left:390px;
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
   </style>  
<section>
<div id="section-container">
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-1 ">
        </div>
        <div class="col-xl-10 " style="padding-left:450px;margin-top:50px;font-size: 30px;">
        공지사항
      </div>
        <div class="col-xl-1 "></div>
    </div>
</div>
<%--     <c:if test="${loginMember equals "admin" }"> --%>
    <button type="button" class="btn btn-secondary" id="noticeBtn" style="margin-left:1020px;"onclick="noticeInsert();"> 공지사항 작성</button>
   <%--  </c:if> --%>
   

  <div class="container" style="margin-top:50px;">
   <p>공지사항 총 <c:out value="${count }"/>건</p>
    <table class="table table-hover" style="border-top-color: black;">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
            <th>조회</th>
          </tr>
        </thead>
        <tbody>
   			<c:forEach items="${list }" var="notice">
				<tr>
					<td><c:out value="${notice.noticeNo }" /></td>
					<td><a href="${path }/notice/noticeView?cno=${notice.noticeNo }"> 
					<c:out value="${notice.noticeTitle }" />
					</a></td>
						
					<td><fmt:formatDate value="${notice.noticeDate }" type="date" pattern="yyyy/MM/dd"/></td>

					<td><c:out value="" /></td>

				</tr>
			</c:forEach>
 	  </tbody>
	 </table>
 </div>
    <div style="text-align:center; font-size:20px;">
      <select name="searchContent" id="searchContent" style="background-color:white; height:35px;">
        <option value="titleContent" selected disabled>선택</option>
        <option value="title">제목</option>
      </select>
      <input type="text" id="searchText" placeholder="검색어를 입력해주세요" size="20">
      <input type="submit" id="searchBtn" class="search_btn" value="검색"/>
    </div>
  <div id="pageBar">
  	${pageBar }
  </div>
   
</section>

<script>

function askInsert(){
	location.replace('${path }/ask/insertAsk.do');
}
    </script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>