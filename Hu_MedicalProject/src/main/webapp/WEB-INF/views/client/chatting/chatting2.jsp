<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chat.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
</head>
<style>
body{
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	
}

#sendBtn{
background-color: rgb(44, 55, 68);
border-radius:10px;
  border: none;

  color: white;

  padding: 10px 20px;

  text-align: center;

  text-decoration: none;

  display: inline-block;

  font-size: 13px;

  margin: 4px 2px;

  cursor: pointer; 
 } 

</style>
<body>
                          
<div id="start" class="container bootstrap snippet">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="portlet portlet-default">
                <div id="chat" class="panel-collapse collapse in">
                    <div>
                    <div class="portlet-body chat-widget" style=" height: 300px;">
                       <!-- 메세지시작 -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="media">
                                    <div class="media-body">
                                        <!-- 메세지 삽입 부분 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="portlet-footer">
                        <form role="form">
                            <div class="form-group">
                                <textarea  id="msg" class="form-control" rows="3" style="width:430px;" placeholder="메세지를 입력하세요."></textarea>
                            </div>
                            <div class="form-group" style="margin-left:360px;">
                                <button type="button" id="sendBtn" >Send</button>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-md-4 -->
    </div>
</div>        
  <style>
  /* 스크롤내리기위한css */
 .portlet-body{
 overflow:scroll
 }
  </style>
    <script>
	//let websocket=new WebSocket("ws://rclass.iptime.org:9999${pageContext.request.contextPath}/chatting");
		let websocket=new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/chatting");

	let sender='${param.room}';
	let roomId='${param.roomId}';
	console.log(roomId);
	websocket.onopen=function(data){
		console.log(data);
		console.log('${param.receiver}');//userId
		//접속정보를 server에 알려주기
		
			if(${not empty loginMember}){
			 websocket.send(JSON.stringify(new SocketMessage("hpOpen","${loginMember.email}",sender,"",roomId)));
			 	//websocket.send(JSON.stringify(new SocketMessage("open","접속","${loginMember.email}","","",room)));
		 }
			else if(${not empty loginHpMember}){
				 websocket.send(JSON.stringify(new SocketMessage("hpOpen","${loginHpMember.id}",sender,"",roomId)));
			} 
	}
	
	websocket.onmessage=function(data){
		console.log("메세지 : "+data);
		console.log(data);
		//const msg=data.data.split(",");
		const msg=JSON.parse(data.data);
		console.log(msg);
		//switch(msg[0]){
		switch(msg['type']){
			case "a" : adminMessage(msg);break;//환영합니다 메시지 띄워주는 메서드
			case "hpmsg" : recieveMessage(msg);break; 
		}
	}

	function adminMessage(msg){
		$(".media-body").append("<p style='text-align:center'>&nbsp;환영합니다."+"<br>"+"※실시간 병원 문의는  병원 사정에 따라 달라질수 있습니다.※</p>");//환영합니다.
	}
	
	function recieveMessage(msg){
		/*div scroll적용  */
		
           $(".media-body") .append("<p style='font-size:17px;'>"+msg['sender']+" : "+msg['msg']+"</p><hr>");
           $('.portlet-body') .stop();
            $('.portlet-body') .animate({ scrollTop: $('.portlet-body')[0].scrollHeight }, 800);
	}
	
	$(function(){
		$("#sendBtn").click(function(){
			const msg=$("#msg").val();
			if(msg.trim().length==0){
				alert("메세지를 입력하세요!");
				$("#msg").focus();
				
			}else if(${not empty loginMember}){
				websocket.send(JSON.stringify(new SocketMessage("hpmsg","${loginMember.email}",sender,msg,roomId)));
				$("#msg").val("");
				
			}else if(${not empty loginHpMember}){
				websocket.send(JSON.stringify(new SocketMessage("hpmsg","${loginHpMember.id}",sender,msg,roomId)));
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