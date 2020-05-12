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
      margin-left:470px;
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
   /* 검색버튼 */
input#searchBtn {
	height: 40px;
	width: 70px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(121, 121, 79);
	position: relative;
	bottom: 1px;
	left: 10px;
}

input#searchBtn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}
/* 답변완료 */
/*       .blinking{
    animation:blink 0.8s ease-in-out infinite alternate;
}
@keyframes blink{
    0% {opacity:0;}
    50% {opacity:1;}
} */
   </style>  
    <section>
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
                  <th style="text-align: center; width:770px; margin-right:100px;">제목</th>
                  <th style="width:150px; ">문의자</th>
                  <th>&nbsp;&nbsp;&nbsp;&nbsp;등록일</th>
                  <!-- <th>답변상태</th> -->
                  
                </tr>
              </thead>
              <tbody>
           <c:forEach items="${list }" var="a" varStatus="board">
                <tr>
                  <td><c:out value="${a.askNo }"/></td>
                  <td style="text-align: center;">
                  	<a href="${path }/ask/askView.do?no=${a.askNo }" style="text-decoration: none; margin-right:10px;">
                  		<span><c:out value="${a.askTitle }"/></span></a>
                  			<c:if test="${a.replyCnt > 0}">
			                  	<span class="blinking" style="background-color:#ff9f31;color:white;width:80px;border-radius:20px; padding:3px 3px 3px 3px;">답변완료</span>
			                </c:if>
			                <c:if test="${a.replyCnt == 0}">
			                  	<span style="background-color:grey;width:80px;color:white;border-radius:20px; padding:3px 3px 3px 3px;">답변대기</span>
			                </c:if>
                  </td>
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
          <form action="${path }/ask/search.do"  method="post">
            <select name="searchType" id="searchContent" style="background-color:white; height:35px;">
              <option value=""  disabled selected>선택</option>
              <option value="title"  <c:if test="${param.searchType eq 'askContent' }">selected</c:if>>제목만</option>
              <option value="writer"  <c:if test="${param.searchType eq 'askWriter' }">selected</c:if>>글작성자</option>
            </select>
            <input type="text" id="keyword" placeholder="검색어를 입력해주세요" size="20" value="${param.keyword }" required autocomplete="off">
            <input type="submit" id="searchBtn" class="search_btn" value="검색"/>
           </form>
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