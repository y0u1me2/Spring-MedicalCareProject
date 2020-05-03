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
          제목 <input name="askTitle" type="text" class="form-control" required>
          작성자 <input name="askWriter" type="text" class="form-control" required>

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
     

	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>