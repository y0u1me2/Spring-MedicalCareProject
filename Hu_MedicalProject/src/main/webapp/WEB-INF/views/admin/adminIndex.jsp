	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
		<jsp:param value="Hello Spring" name="pageTitle"/>
	</jsp:include>
	<div style="margin-left:620px; margin-top:50px;">
			<img src="${path }/resources/images/admin.png" width="300px">
		</div>
			<hr>
	<div style="margin-left:580px;">
		<h1 >H.U 관리자님 환영합니다.</h1>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;각종 관리를 위한 관리자님만을 위한 페이지입니다.</p>
	</div>
			
			
			
	
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>