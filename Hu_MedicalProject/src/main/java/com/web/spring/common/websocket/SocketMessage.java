package com.web.spring.common.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SocketMessage {

	private String type;
	private String sender;
	private String reciever;
	private String msg;
	private String room;
}
