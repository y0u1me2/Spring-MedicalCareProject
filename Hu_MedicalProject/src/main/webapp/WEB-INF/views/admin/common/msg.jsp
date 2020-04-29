<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	<script>
		alert('${msg}');
		
		if(${not empty loc}){
			location.replace('${pageContext.request.contextPath}${loc}');
		}else if('${not empty referer}'){
			location.replace("${referer}");
			}
		
		
	</script>	
</body>
</html>