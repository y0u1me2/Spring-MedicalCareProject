package com.web.spring.common.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data//getter,setter생성
@AllArgsConstructor
@NoArgsConstructor
public class SocketMessage {
	
	private String type;
	private String sender;
	private String receiver;
	private String msg;

//	jackson : 자바객체를 자바로 자바객체를 자바스크립트객체로변환
}
