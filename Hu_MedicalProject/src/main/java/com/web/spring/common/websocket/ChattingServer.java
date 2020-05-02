package com.web.spring.common.websocket;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;




	//웹소켓 서버
	//handler
	//접속한 클라이언트의 연결을 유지/관리하는 역할
	//세션값주고 왔다갔다 처리하게함.
	//등록 조건 (관계유지위해)
	//1. TextWebSocketHandler객체를 상속
	//onOpen,onMessage 자동으로 alt shift s v 오버라이딩
	public class ChattingServer extends TextWebSocketHandler{

		@Autowired
		Logger logger;
		
		@Override
		//onOpen과 유사 클라이언트가 웹소켓서버에 접속했을때 실행되는 메서드
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			logger.info("클라이언트가 접속하였습니다.");
		//접속하면서 주어진값이 없어서 요정도만 할수 있다.
		//세션값은 스프링이 가지고 있는 웹소켓세션을 사용하고 있음.
		}

		@Override//close 서버가 끊겼을때
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			logger.info("접속이 종료되었습니다.");
			logger.info(session.getId());
			//세션 관련 메서드
			//getRemoteAdd:리모트주소
			//getAttribute : 저장해서 관리
		}

		@Override//onMessage
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			// TODO Auto-generated method stub
			super.afterConnectionClosed(session, status);
		}
		
		
}
