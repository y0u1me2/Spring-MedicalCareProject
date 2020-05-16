	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>

 <section style="margin-bottom:30px;">
        <h2 style="text-align: center;padding-top: 45px;">1:1 문의 게시판</h2>
     <form action="${pageContext.request.contextPath}/ask/insertEndAsk.do" method="post">
        <div class="container-fluid" style="padding-top: 30px;">
          <div class="row">
            <div class=" col-xl-3">
            </div>
          <div class=" col-xl-6"> 
          제목 <input style="margin-bottom:8px;" name="askTitle" type="text" class="form-control" required>
         <c:if test="${not empty loginMember  }">
          작성자	 <input style="margin-bottom:8px;"name="askWriter" type="text" class="form-control" value="${loginMember.name }" required readonly>
		</c:if>
		<c:if test="${not empty loginHpMember  }">
          작성자	 <input style="margin-bottom:8px;" name="askWriter" type="text" class="form-control" value="${loginHpMember.id }" required readonly>
		</c:if>
	문의종류<br><select id="askClassification" name="askClassification"> 
     		 <option value="문의종류" selected disabled>선택</option>
         	 <option value="일반회원">일반회원</option>
         	 <option value="병원회원">병원회원</option>
         	 <option value="회원정보">회원정보</option>
         	 <option value="기타문의">기타문의</option>
    </select>
		
           <div class="form-group" style="margin-top: 20px;"> 문의내용
           <label for="comment"></label>
          <textarea name="askContent" class="form-control" rows="8" id="comment" required></textarea>
          </div>

           </div>
          <div class=" col-xl-3">
          </div>
          </div>
        </div>
      
        <button type="submit" class="btn btn-outline-success my-2 my-sm-0" style="margin-left:960px;"> 등록</button>
      </form>
      </section>
     <style>
		 select {
			width: 100px;
			padding: .3em .4em;
			border: 1px solid #999;
			font-family: inherit;
			 background: url(${pageContext.request.contextPath }/resources/images/arrow.jpg) no-repeat 95% 50%;
			border-radius: 0px;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			}
     </style>

	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>