<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

/* 공통스타일 */
    * {
        margin: 0;
        font-family: "Nanum Gothic";
    }
   
/* 바디 해상도 및 폰트 */
    body {
        width: 1366px;
        height: auto;
    }
    
/* 내용 위치 */
	div#content{
		position:relative;
		text-align:center;
		left:200px;
		top:50px;
		width:80%;
	}

/* 404 */
	h1#error{
		font-size:70px;
	}
	
/* 텍스트 */	
	p#text{
		position: relative;
		top:18px;
		font-size:20px;
	}	

/* 홈으로 이동 버튼 */
#home-btn {
	position: relative;
	top:50px;
	height: 40px;
	width: 150px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-weight:bold;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

#home-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}


</style>

<head>
<meta charset="UTF-8">
<title>굿굿즈</title>
</head>
<body>
	
	
	
	<div id="content">
	<img src="images/logo.png" width="400px;">
	<h1 id="error">404</h1>
	<p id="text">찾을 수 없는 페이지 입니다.</br>
	요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨어요. :)
	</p>

	<a href="<%=request.getContextPath()%>/index.jsp"><button type="button" id="home-btn">홈으로 이동</button></a>
	</div>
	
</body>
</html>

