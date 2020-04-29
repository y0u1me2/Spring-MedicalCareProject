<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">

  <style>
    * {
      margin: 0;
    }

    body {
      width: 1366px;
      height: auto;
    }

    /* 버튼클릭시 파란테두리 없애기 */
    button:focus {outline:none;}

    div#menu {
      position: relative;
      left: 450px;


    }

    /* 버튼들 */
    div#btns {
      background: rgb(247, 245, 245);
      width: 500px;
      border-radius: 30px;
      display: flex;
      position: relative;
      top: 30px;

    }

    /* 전체 진료과목 버튼 */
    button#subject {
      background: rgb(247, 245, 245);
      border: none;
      width: 300px;
      border-radius: 20px;
    }


    button#subject>img {
      position: relative;
      left: 10px;
    }

    button#subject:hover {
      background: rgb(200, 200, 202);
      outline: none;
    }

    /* 가운데 | */
    p#bar {
      color: rgb(226, 226, 219);
      font-size: 20px;
      position: relative;
      top: 5px;
    }

    /* 위치 찾기 버튼 */
    button#location {
      background: rgb(247, 245, 245);
      border: none;
      width: 280px;
      border-radius: 20px;
    }

    button#location>img {
      position: relative;
      left: 10px;
    }

    button#location:hover {
      background: rgb(200, 200, 202);
      outline: none;
    }

    /* #tag들 */
    div#tag {
      position: relative;
      top: 50px;
    }

    div#tag>button {
      border: none;
      background-color: white;
    }

    /* 병원정보들 */
    div#hospital_content {
      position: relative;
      top: 80px;
      width: 450px;
      border-radius: 15px;
      border: solid 1px rgb(82, 81, 81);
      margin-right: 20px;


    }

    /* 공지사항 div */
    div#notice {
      background: rgb(247, 245, 245);
    }

    div#content {
      display: flex;

    }

    /* 전체병원보기 버튼 */
    button#lookup {
     background-color:#DAF1DE;;
      border-radius: 20px;
      border: none;
      position: relative;
      width: 200px;
      height: 50px;
      left: 550px;
      top: 50px;

    }

    /* 약국 tag들 */
    div#tag2 {
      position: relative;
      top: 100px;
      left: 500px;

    }

    div#tag2>button {
      border: none;
      background-color: white;
    }

    /* 약국정보들 */
    div#content2 {
      display: flex;

    }

    div#pharmacy_content {
      position: relative;
      top: 150px;
      width: 450px;
      border-radius: 15px;
      border: solid 1px rgb(82, 81, 81);
      margin-right: 20px;


    }


    /* 약국버튼들 */
    div#pharm {
      position: relative;
      left: 100px;

    }

    /* 전화 & 찾아가기 버튼 */
    button#pharm-btn {
      height: 40px;
      width: 100px;
      border: solid 1px rgb(147, 147, 194);
      background: white;
      border-radius: 10px;
      font-size: 15px;
      color: rgb(134, 134, 133);
      margin-right: 5px;
    }



    button#pharm-btn:hover {
      background: rgb(251, 251, 249);
      outline: none;
    }

    /* 날씨정보들 */
    div#weather-content {
      position: relative;
      top: 200px;
    }


    /* 날씨정보 텍스트 */
    div#weather-text {
      color: rgb(206, 204, 204);
    }
  </style>



  <div class="container-fluid">


    <div class="container-fluid">

      <div class="row">
        <div class="col-sm-12">

          <img src="images/treatment_status.png" width="50px;" />

          <!-- ================================================================ -->
          <div id="menu">
            <div id="btns">
              <button id="subject">전체 진료과목<img src="images/triangle.png" width="10px;" /></button>
              <p id="bar">|</p>
              <button id="location">Google location api?<img src="images/triangle.png" width="10px;" /></button>
            </div>

            <div id="tag">
              <button>#가까운_접수병원</button>
              <button>#바로접수가능</button>
              <button>#인기접수병원</button>
              <button>#신규접수병원</button>
            </div>
          </div>


          <!-- ================================================================ -->
          <!-- 병원정보들 -->
          <div id="content">
            <div id="hospital_content">
              <p>예약병원</p>
              <h3>우리동네이비인후과의원</h3>
              <p><img src="images/location.png" width="15px;" />5km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 진료시간 09:00~18:00</p>
              </hr>

              <p>진료항목</p>

              <p>일반진료</p>피부질환<p>영유아검진</p>
              <p>예방접종</p>
              <p>혈액검사</p>
              <p>수액</p>

              <p><img src="images/bell.png" width="15px;" />☆★ 진료시간 변경 안내 ★☆(공지사항-드롭다운으로만들것)</p>

              <div id="notice">
                <p>3월부터 수요일 진료시간이 변경되오니 착오 없으시길 바랍니다.
                  다른날의 진료시간은 모두 동일하며, 수요일의 진료시간은 오전 8시반~오후1시까지입니다

                  월,화,목,금 9:00~18:00
                  수 9:00~13:00
                  토 9:00~14:00

                  점심시간 13:00~14:00
                  일,공휴일 휴무
                </p>
              </div>

            </div>

            <div id="hospital_content">
              <p>예약병원</p>
              <h3>우리동네이비인후과의원</h3>
              <p><img src="images/location.png" width="15px;" />5km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 진료시간 09:00~18:00</p>
              </hr>

              <p>진료항목</p>

              <p>일반진료</p>피부질환<p>영유아검진</p>
              <p>예방접종</p>
              <p>혈액검사</p>
              <p>수액</p>

              <p><img src="images/bell.png" width="15px;" />☆★ 진료시간 변경 안내 ★☆(공지사항-드롭다운으로만들것)</p>

              <div id="notice">
                <p>3월부터 수요일 진료시간이 변경되오니 착오 없으시길 바랍니다.
                  다른날의 진료시간은 모두 동일하며, 수요일의 진료시간은 오전 8시반~오후1시까지입니다

                  월,화,목,금 9:00~18:00
                  수 9:00~13:00
                  토 9:00~14:00

                  점심시간 13:00~14:00
                  일,공휴일 휴무
                </p>
              </div>

            </div>

            <div id="hospital_content">
              <p>예약병원</p>
              <h3>우리동네이비인후과의원</h3>
              <p><img src="images/location.png" width="15px;" />5km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 진료시간 09:00~18:00</p>
              </hr>

              <p>진료항목</p>

              <p>일반진료</p>피부질환<p>영유아검진</p>
              <p>예방접종</p>
              <p>혈액검사</p>
              <p>수액</p>

              <p><img src="images/bell.png" width="15px;" />☆★ 진료시간 변경 안내 ★☆(공지사항-드롭다운으로만들것)</p>

              <div id="notice">
                <p>3월부터 수요일 진료시간이 변경되오니 착오 없으시길 바랍니다.
                  다른날의 진료시간은 모두 동일하며, 수요일의 진료시간은 오전 8시반~오후1시까지입니다

                  월,화,목,금 9:00~18:00
                  수 9:00~13:00
                  토 9:00~14:00

                  점심시간 13:00~14:00
                  일,공휴일 휴무
                </p>
              </div>

            </div>
          </div>

          <!-- ================================================================ -->
          <!-- 병원위치 찾기 -->
          <p>원하시는 병원이 없으면</br>
            지도에서 병원을 찾아보세요.
          </p>

          <button id="lookup"><img src="images/hospital.png" width="20px" />&nbsp;&nbsp;전체 병원 보기</button>


          <div id="tag2">
            <button>#가까운_약국</button>
            <button>#문연약국</button>
            <button>#연중무휴약국</button>
          </div>


          <!-- ================================================================ -->
          <!-- 약국정보들 -->
          <div id="content2">
            <div id="pharmacy_content">
              <p>영업중</p>
              <p>연중무휴</p>
              <h3>사당365약국</h3>
              <p><img src="images/location.png" width="15px;" />70km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 영업시간 09:00~23:00</p>
              </hr>

              <div id="pharm">
                <button id="pharm-btn">전화</button>
                <button id="pharm-btn">찾아가기</button>
              </div>
            </div>

            <div id="pharmacy_content">
              <p>영업중</p>
              <p>연중무휴</p>
              <h3>사당365약국</h3>
              <p><img src="images/location.png" width="15px;" />70km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 영업시간 09:00~23:00</p>
              </hr>

              <div id="pharm">
                <button id="pharm-btn">전화</button>
                <button id="pharm-btn">찾아가기</button>
              </div>
            </div>

            <div id="pharmacy_content">
              <p>영업중</p>
              <p>연중무휴</p>
              <h3>사당365약국</h3>
              <p><img src="images/location.png" width="15px;" />70km</p>
              <p id="bar">|</p>
              <p>서울특별시 강남구 강남대로 21길</p>

              <p>오늘의 영업시간 09:00~23:00</p>
              </hr>

              <div id="pharm">
                <button id="pharm-btn">전화</button>
                <button id="pharm-btn">찾아가기</button>
              </div>
            </div>

</div>
            <!-- ================================================================ -->
            <!-- 날씨정보 -->
            <div id="weather-content">
              <p>날씨 api 불러올것!</p>

              <div id="weather-text">
                <p>미세먼지 정보 제공 안내</br></br>

                  미세먼지 정보는 한국환경공단에서 제공하는 국가대기오염정보 Open API를 활용하여, 측정
                  시점 기준으로 업데이트되며, 일부 측정 데이터는 오류가 발생할 수 있습니다.
                </p>

              </div>

            </div>




          </div>
     
    </div>
    
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
   