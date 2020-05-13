<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />

</head>
<style>
    body {

        padding-top: 70px;

        padding-bottom: 30px;

    }

    nav>a:first-child {
        color: black;
        font-size: 30px;
    }

    nav>ul:first-child {
        padding-left: 200px;
    }

    ul>li>a {
        color: black;
    }

    ul>li {
        padding-right: 30px;
    }

    .navbar-nav li ul {
        display: none;
        /* 평상시에는 서브메뉴가 안보이게 하기 */
        height: auto;
        padding: 0px;
        margin: 0px;
        border: 0px;
        position: absolute;
        width: 200px;
        z-index: 200;
        list-style: none;
    }

    .navbar-nav li:hover ul {
        display: block;
        /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
        color: grey;
    }

    .navbar-nav li ul a {
        text-decoration: none;
    }

    /* 등록,목록 버튼 */
    div.btns {
        position: relative;
        top: 30px;
        left: 440px;
    }

    /* 등록버튼 */
    button#btnSave {
        height: 40px;
        width: 100px;
        background: #313030;
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border: 0;
        font-size: 15px;
        color: rgb(233, 233, 229);
        position: relative;
    }

    button#btnSave:hover {
        background: black;
        outline: none;
    }

    /* 삭제버튼 */
    button#delete-btn {
        height: 40px;
        width: 100px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 5px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
    }

    button#btnList:hover {
        background: rgb(251, 251, 249);
        outline: none;
    }

    div#section-container{
        position: relative;
        top:100px;
    }
    
    footer{
    	position:relative;
    	top:300px;
    }
</style>

    <section>
        <div id="section-container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-1 ">
                </div>
                <div class="col-xl-10 " style="padding-left:450px;margin-top:50px;font-size: 30px;">
                    공지사항 수정하기
                </div>
                <div class="col-xl-1 ">
                </div>
            </div>
        </div>


        <div class="container" role="main">



            <form name="form" id="careFrm" role="form" method="post"
            action="${path}/notice/noticeUpdateEnd?no=${notice.noticeNo}" enctype="multipart/form-data">
				
                <div class="mb-3">

                    <label for="title">제목</label>

                    <input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle }">

                </div>



                <div class="mb-3">

                    <label for="reg_id">작성자</label>

                    <input type="text" class="form-control" name="noticeWriter" id="reg_id" value="${notice.noticeWriter }" readonly required>

                </div>



                <div class="mb-3">

                    <label for="content">내용</label>

                    <textarea class="form-control" rows="5" name="noticeContent" id="noticeContent"><c:out value="${notice.noticeContent }" /></textarea>

                </div>



                <div class="mb-3">

                    <label for="tag">첨부 파일</label>
                  
					<input type="file" class="form-control" name="upFile" id="upFile">

			
				<c:forEach items="${files}" var="f" varStatus="vs">				
								<span><c:out value="기존 파일 : ${f.originalFilename }"/></span>
								<input type="hidden" name="orifile" value="${f.originalFilename }" />	
				</c:forEach>	
				
					
																
                </div>


            <div class="btns">

                <button type="submit" id="btnSave">수정</button>

                <button type="button" id="delete-btn" onclick="noticeList();">취소</button>

            </div>
            </form>

        </div>


    </div>
    </section>

    <script>

        new WOW().init();
        
      //취소하기
		function noticeList(){
			if(confirm("수정 내용이 저장되지 않습니다. 취소하시겠습니까?")){	
				location.replace('${path }/notice/noticeList');
			}
      }

        
        
    </script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>
