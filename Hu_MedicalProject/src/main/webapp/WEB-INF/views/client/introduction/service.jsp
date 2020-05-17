<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp"/>

<style>
* {
	font-family: 'helvetica','Spoqa Han Sans','Apple SD Gothic Neo', 'Malgun Gothic','Nanum Gothic', 'Noto Sans','sans-serif';
}

body{
	background-image:url('https://cdn.imweb.me/thumbnail/20190418/5cb808dca2354.png'); 
	background-attachment: fixed;
}
</style>

<div class="container-fluid p-0 border" style="">
	<div class="w-100 border" style="height:600px;">
		<h1 align="center">HU 서비스 소개</h1>
	</div>

	<div class="w-100 border" style="height:900px; background-color:white;">
		<div class="w-50 border mx-auto d-flex flex-wrap">
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
			<div class="border w-50" style="height:100px"></div>
		</div>
	</div>
	
	

</div>


<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>