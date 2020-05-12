<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/client/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>

<div class="container-fluid">
	<button onclick="findHospital();">api 실행하기</button>
</div>

<script>
	function findHospital(){
		$.ajax({
			url: "${path}/hospitalFind.do",
			type: "post",
			dataType: 'json',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success: function(data){
				alert("데이터 로드 성공");
				console.log(data);
			}
		});
	}

</script>




<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>