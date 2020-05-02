<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 출력</title>
</head>
<body>
	<script>
		alert("${msg}");
		if('${not empty loc}'){
		location.replace("${pageContext.request.contextPath}${loc}");
		}
		else if('${not empty referer}'){
			location.replace("${referer}");
		}
	</script>
</body>
</html>