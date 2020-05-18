package com.web.spring.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.spring.common.websocket.AlramMessage;

public class AlramServer extends TextWebSocketHandler {
	
	@Autowired
	Logger logger;

	@Autowired
	ObjectMapper mapper;
	
	Map<String, WebSocketSession> clients=new HashMap();
	//세션에 저장된 유저들

	@Override//onMessage
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//보낸사람 session, message /send뒤에 있던(chatting.jsp 스크립트) 값이 여기에 꽂힌다.
		AlramMessage msg=getMessage(message.getPayload());
		//
		logger.debug("msg"+msg);
		switch(msg.getType()) {
			case "client" : newClient(msg,session);break;
			case "newchat" : requestChat(msg);break;
			case "hospitalChat" :requestChat(msg);break;
			case "hpAdminChat":requestChat(msg);break;
		}
	}
	private void newClient(AlramMessage msg, WebSocketSession session) {
		clients.put(msg.getSender(),session);
		msg.setMsg(session.getId());
		try {
			session.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void requestChat(AlramMessage msg) {
		Set<Map.Entry<String,WebSocketSession>> entry = clients.entrySet();
		for(Map.Entry<String, WebSocketSession> client : entry) {
			if(msg.getReceiver().equals(client.getKey())) {
				try {
					client.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	private AlramMessage getMessage(String msg) {
		AlramMessage converData=null;
		try {
			converData=mapper.readValue(msg, AlramMessage.class);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return converData;
	}
}
