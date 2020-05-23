	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
		<jsp:param value="Hello Spring" name="pageTitle"/>
	</jsp:include>
	
	
	<div class="container-fluid">
		<img class="mx-auto my-5 d-block" src="${path }/resources/images/admin.png" width="300px">
		<hr>
		<h1 class="text-center">H.U 관리자님 환영합니다.</h1>
		<p class="text-center">각종 관리를 위한 관리자님만을 위한 공간입니다.</p>
	
	</div>
	
	
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>