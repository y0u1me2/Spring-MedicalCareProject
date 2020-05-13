	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<jsp:include page="/WEB-INF/views/client/common/header.jsp">
		<jsp:param value="Hello Spring" name="pageTitle"/>
	</jsp:include>
		 <table class="table table-hover" style="border-top-color: black;">
              <thead>
                <tr>
                  <th style="text-align: center; width:770px; margin-right:100px;">이름</th>
                </tr>
              </thead>
              <tbody>
           <c:forEach items="${list }" var="a" varStatus="board">
                <tr>
                  <td>
                     <button class="btn btn-outline-dark" type="button"
						onclick="accessChatting2('${loginMember.email}','${a.name }');">${a.name }</button>
					<input id="chatName" type=text name="chatName" value="${a.name }">
                </tr>
           </c:forEach>
          </div>
            </table>
         </tbody>
         
	<script>
	
	
	</script>


	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>