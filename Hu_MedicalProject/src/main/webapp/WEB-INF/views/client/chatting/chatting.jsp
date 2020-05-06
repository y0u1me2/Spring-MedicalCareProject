<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅구현하기</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<input type="text" id="msg"><button id="sendBtn">전송</button>
	<div id="msg-container">
	</div>
	
	
	<script>
		let websocket=new WebSocket
		("ws://localhost:9090${pageContext.request.contextPath}/chatting");
		//localhost rlcass로 변경
		websocket.onopen=function(data){
			console.log(data);
			//접속정보를 server에 알려주기
			websocket.send(JSON.stringify(new SocketMessage("open","${loginMember.email}","","")));
			//JSON.stringify : javascript값이나 객체를 JSON문자열로 변환
			/* send()뒤에 있는 스트링값을 보낸다 */
			/*send라고 보내면  onMessage가 자동으로 받는다.  */
		}
		websocket.onmessage=function(data){
			/* data== session.sendMessage(new TextMessage("채팅접속을 환영합니다.")); */
			console.log("메세지"+data);
			console.log(data);
			/* const msg=data.data.split(",");//나눠야함. */
			const msg=JSON.parse(data.data);
			//JSON.parse string객체를 json객체로 변환
			
			/* switch(msg[0]){ */
			switch(msg['type']){
				case "a" : adminMessage(msg);break;
				case "msg" : receiveMessage(msg);break;
			}
		}		
		
		function adminMessage(msg){
		/* 	$("#msg-container").append("<p>"+msg[3]+"</p>");//이렇게 메세지를 꽂아준다. */
			$("#msg-container").append("<p>"+msg['msg']+"</p>");
		}
		
		function receiveMessage(msg){
			$("#msg-container").append("<p>"+msg['sender']+" : "+msg['msg']+"</p>")
		}
		
		$(function(){
			$("#sendBtn").click(function(){
				const msg=$("#msg").val();
				
				if(msg.trim().length==0){
					alert("메세지를 입력하세요!");
					$("#msg").focus();
				}else{
					websocket.send(JSON.stringify(new SocketMessage("msg","${loginMember.email}","all",msg)));
					//자바스크립트에서 보낸 걸 자바에서 쓸수있게  바꿔줘야함 JSON.stringify
					
					
					$("#msg").val("");
					/*	switch(data[0]) {
					case "open" : newClient(session,data);break;
					case "msg" : sendMessage(session,data);break;  */
					/* 두번째 msg */
					/*메세지를 chattingServer에 보낼때도 형식에 맞춰서 보내야한다.  */
				}
			});
		});
		
		
		function SocketMessage(type,sender,receiver,msg){
			this.type=type;
			this.sender=sender;
			this.receiver=receiver;
			this.msg=msg;
		}
	</script>
	
</body>
</html>