package com.web.spring.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

//웹소켓 서버
//handler
//접속한 클라이언트의 연결을 유지/관리하는 역할
//세션값주고 왔다갔다 처리하게함.
//등록 조건 (관계유지위해)
//1. TextWebSocketHandler객체를 상속
//onOpen,onMessage 자동으로 alt shift s v 오버라이딩

//2. 파일 BinaryWebsocketHandler
public class ChattingServer extends TextWebSocketHandler{
	/*
	 * @Autowired Logger logger;
	 */
	
	@Autowired
	ObjectMapper mapper;//websocket-context.xml에 빈 등록했음
	
	//접속한 세션을 관리하기 위한 객체!-> 접속한 세션을 내가 직접 만들어줘야한다.
	Map<String,WebSocketSession> clients=new HashMap();
	
	@Override
	//onOpen과 유사 클라이언트가 웹소켓서버에 접속했을때 실행되는 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("접속했음.");
	//접속하면서 주어진값이 없어서 요정도만 할수 있다.
	//세션값은 스프링이 가지고 있는 웹소켓세션을 사용하고 있음.
		//들어올때마다 메세지실행
	}

	@Override
	//onMessage
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//보낸사람 session, message /send뒤에 있던(chatting.jsp 스크립트) 값이 여기에 꽂힌다.
		//클라이언트가 보낸 메세지 확인
		//logger.info("누구니?"+message.getPayload());//open,user99
		//websocket통신을 위한 메시지를 파싱하여 관리해야함.
		//파싱->우리가 통신하기위해HTTP 프로토콜(통신규약)사용
		//메세지자체를 그렇게 통신규약으로 만들어야한다. 메시지패턴을 정해놓고 파싱해서 가져와야함
		//,를 구분으로 배열만들기
		//0 : type(새로 생성(open),메세지,파일, 관리자가 보내는 메세지)->type은 내가 정하기 나름이다.
		//1 : 보낸 사람 아이디
		//
//		String[] data=message.getPayload().split(",");
		SocketMessage sm=getMessage(message.getPayload());
		//객체화가 되었다
		
		//websocket통신을 위한 메시지를 파싱하여 관리해야함.
		//파싱->우리가 통신하기위해HTTP 프로토콜(통신규약)사용
		//메세지자체를 그렇게 통신규약으로 만들어야한다. 메시지패턴을 정해놓고 파싱해서 가져와야함
		//분기처리하기(data 0번기준~
		/*switch(data[0]) {*/
		switch(sm.getType()) {
		/* case "open" : newClient(session,data);break; */
		case "open" : newClient(session,sm);break;
		/* case "msg" : sendMessage(data);break; */
		case "msg" : sendMessage(sm);break;
		}
 	}
	

	@Override//close 서버가 끊겼을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//logger.info("접속이 종료되었습니다.");
		//logger.info(session.getId());
		//세션 관련 메서드
		//getRemoteAdd:리모트주소
		//getAttribute : 저장해서 관리
		
		//누가나갈때마다 갱신이 된다.
		Set<Map.Entry<String, WebSocketSession>> entrykey=clients.entrySet();
		//키와 값의 쌍으로 구성된 모든 Map.Entry객체를 set에 담아 리턴
		//entrySet은 key와 value두개다 필요할때 사용하는 메서드
		Iterator<Map.Entry<String, WebSocketSession>> it=entrykey.iterator();
		while(it.hasNext()) {
			Map.Entry<String,WebSocketSession> client=it.next();
			if(!client.getValue().isOpen()) {
				it.remove();
			}
		}
	}
	
	/* private void newClient(WebSocketSession session,String[] msg) { */
	private void newClient(WebSocketSession session,SocketMessage msg) {

//		clients.put(msg[1], session);//open[0],user99[1]
		clients.put(msg.getSender(), session);
		//클라이언트 맵에 userId에 세션이 들어간다
		//세션관리위해 집어넣는다.
		
		//새로고침했을떄마다 세션아이디가 다시 부여되기때문에 관리를 해줘야한다.
		//현재 접속회원을 전송
		try {
			/* session.sendMessage(new TextMessage("a,admin, ,채팅접속을 환영합니다.")); */
			session.sendMessage(new TextMessage(mapper.writeValueAsString(new SocketMessage("a","admin","","채팅접속을 환영합니다!"))));
			//형식을 준수해서 보내야한다. => type/보낸사람/받는사람/메세지
			//send이므로 (파일입출력)try~catch로 IOException 예외처리해주기!
		} catch (IOException e) {
			e.printStackTrace();
		}//데이터 전송
	}
	
	/* private void sendMessage(String[] msg) { */
	private void sendMessage(SocketMessage msg) {
		/* if(msg[2].equals("all")) { */
		if(msg.getReceiver().equals("all")) {
			//JSON.stringify(new SocketMessage("msg[0]","${loginMember.userId}[1]","all[2]",+msg[3]
			
			Set<Map.Entry<String, WebSocketSession>> keys=clients.entrySet();
			//키와 값의 쌍으로 구성된 모든 Map.Entry객체를 set에 담아 리턴
			Iterator<Map.Entry<String,WebSocketSession>> it=keys.iterator();
			while(it.hasNext()) {
				Map.Entry<String,WebSocketSession> client=it.next();
				//if(client.getKey().equals(msg.getReceiver()))
				try {
					/* client.getValue().sendMessage(new TextMessage(String.join(",",msg))); */
					client.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
					//client의 값을 가져와 메세지 전송
				}catch(IOException e) {
					e.printStackTrace();
					}
				}
			}
		}
	//메세지파싱처리하기
	private SocketMessage getMessage(String msg) {
		SocketMessage sm=null;
		try {
			sm=mapper.readValue(msg,SocketMessage.class);
			//readValue()메서드가 msg를 소켓메시지객체에 넣어서 반환을 해준다.
		}catch(Exception e){
			e.printStackTrace();
			//파싱을하다가 파싱이 안됐을경우있기때문에 예외처리!
		}
		return sm;
	}
}