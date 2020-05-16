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
           <c:forEach items="${list }" var="a" varStatus="hospital">
                <tr>
                  <td>
                     <button class="btn btn-outline-dark" type="button"
						onclick="hpAccessChatting('${loginMember.email}','${a.id }');">${a.id }</button>
					<input id="chatName" type=text name="chatName" value="${a.id }">
                </tr>
           </c:forEach>
          </div>
            </table>
         </tbody>
         <script>
        /*    function accessChatting2(room1,room2){
 			if(room2){
 				requestChatting(room2);
 			}
 			open("${path}/chattingView2?room1=${loginMember.email}&room2="+room2,"_blank","width=500,height=490");
 		}
           */
         </script> 
   <%--       
	<script>
		function accessChatting2(room1,room2){
			//room1은일반회원(요청한회원) room2는 병원회원(요청받은회원) 
			if(room2){
				requestChatting(room2);
			}
			open("${path}/chattingView2?room1=${loginMember.email}&room2="+room2,"_blank","width=500,height=490");
		}
	</script>
	<c:if test="${loginMember != null or loginHpMember!=null }">
	<script>
	
		let alarm=new WebSocket("ws://localhost:9090${path}/alram");
		alram.onopen=function(msg){
			alarm.send(JSON.stringify(new AlramMessage("client","접속","${loginMember.email}","")));//공란병원회원
			//AlramMessage(type,msg,sender,receiver)
		}
		
		alarm.onmessage=function(msg){
			const data=JSON.parse(msg.data);
			switch(data.type){
			//병원관리자에게 알림이 뜨는 메서드
				case "newchat" : openChatting(data);break; 
			}
		}
	
		function openChatting(data){
			if(confirm(data.sender+"님 문의가 들어왔습니다 \n 응답하시겠습니까?")){
				accessChatting(data.sender);//채팅창 open!
			}
		}
	
		function requestChatting(room2){
			console.log("병원"+room2);
			alram.send(JSON.stringify(new AlramMessage("newchat","문의합니다.","${loginMember.email}","room2")));//
		//일반회원이 admin에게 채팅보냄
		}
		
		function AlramMessage(type,msg,sender,receiver){
			this.type=type;
			this.msg=msg;
			this.sender=sender;
			this.receiver=receiver;			
		}
	</script>
	</c:if>
	
	 --%>

	<jsp:include page="/WEB-INF/views/client/common/footer.jsp"/>