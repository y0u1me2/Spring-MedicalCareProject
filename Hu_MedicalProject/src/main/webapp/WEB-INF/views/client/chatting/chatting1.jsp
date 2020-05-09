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
		let websocket=new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/chatting");
		let room='${param.room}';
		websocket.onopen=function(data){
			console.log(data);
			console.log('${param.room}');//userId
			//접속정보를 server에 알려주기
			websocket.send(JSON.stringify(new SocketMessage("open","${loginMember.email}","","",room)));
		}
		
		websocket.onmessage=function(data){
			console.log("메세지 : "+data);
			console.log(data);
			//const msg=data.data.split(",");
			const msg=JSON.parse(data.data);
			console.log(msg);
			//switch(msg[0]){
			switch(msg['type']){
				case "a" : adminMessage(msg);break;
				case "msg" : recieveMessage(msg);break; 
			}
		}
		
		function adminMessage(msg){
			//$("#msg-container").append("<p>"+msg[3]+"</p>");
			$("#msg-container").append("<p>"+msg['msg']+"</p>");
		}
		function recieveMessage(msg){
			$("#msg-container").append("<p>"+msg['sender']+" : "+msg['msg']+"</p>");
		}
		$(function(){
			$("#sendBtn").click(function(){
				const msg=$("#msg").val();
				if(msg.trim().length==0){
					alert("메세지를 입력하세요!");
					$("#msg").focus();
				}else{
					websocket.send(JSON.stringify(new SocketMessage("msg","${loginMember.email}","",msg,room)));
					$("#msg").val("");
				}
			});
		})
		
		function SocketMessage(type,sender,reciever,msg,room){
			this.type=type;
			this.sender=sender;
			this.reciever=reciever;
			this.msg=msg;
			this.room=room;
		}
		
	</script>

</body>
</html>