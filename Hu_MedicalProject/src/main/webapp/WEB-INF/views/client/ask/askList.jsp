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
    <input type="text" value="${replyCount }">
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-1 ">
            </div>
            <div class="col-xl-10 " style="padding-left:450px;margin-top:50px;font-size: 30px;">
              1:1 문의게시판
            </div>
              <div class="col-xl-1 ">
            </div>
          </div>
      </div>
        <div class="container" style="margin-top:50px;">
          <table class="table table-hover" style="border-top-color: black;">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>답변상태</th>
                  <th style="text-align: center;">제목</th>
                  <th>문의자</th>
                  <th>등록일</th>
                </tr>
              </thead>
              <tbody>
           <c:forEach items="${list }" var="a" varStatus="board">
                <tr>
                  <td><c:out value="${a.askNo }"/></td>
                  <td>
                  	<c:if test="${a.replyCnt > 0}">
                  	답변완료
                  	</c:if>
                  	<c:if test="${a.replyCnt == 0}">
                  	답변대기
                  	</c:if>
                  </td>
                  <td style="text-align: center;"><a href="${path }/ask/askView.do?no=${a.askNo }" style="text-decoration: none;"><c:out value="${a.askTitle }"/></td>
                  <td><c:out value="${a.askWriter }"/></td>
                  <td><c:out value="${a.askDate }"/></td>
                </tr>
           </c:forEach>
          </div>
            </table>
         </tbody>
        
         
          <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-left:1020px;"onclick="
          askInsert();"> 문의하기</button>
          <div style="text-align:center; font-size:20px;">
            <select name="searchContent" id="searchContent" style="background-color:white; height:35px;">
              <option value="titleContent" selected disabled>선택</option>
              <option value="title">제목만</option>
              <option value="writer">글작성자</option>
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