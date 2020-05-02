	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>
	<input type="hidden" name="askNo" value="${a.askNo }">
   <div class="container-fluid" style="padding-top: 100px;">
        <div class="row">
          <div class="col-xl-2">
          </div>
          <div class=" col-xl-8 " style="height: 500px; margin-bottom: 100px;">
           <h2>${a.askTitle }</h2>
           <p style="padding-top: 13px; color:lightgray;">${a.askDate }</p>
           <hr>
           <div style="height: 200px; ">
            ${a.askContent }

           </div>
           <hr>
           <div style="float: right;">
           <button class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 2px;">수정</button>
           <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-right: 2px;">삭제</button>
           <button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='문의게시판.html'" >목록</button>
           </div> 
    
           </div>
          </div>
          <div class="col-xl-2">
          </div>
        </div>
      
        
	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>