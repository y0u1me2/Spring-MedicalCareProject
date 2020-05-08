package com.web.spring.common.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlramMessage {
	
//알람을 띄워주는 객체!
	private String type;
	private String msg;
	private String sender;
	private String receiver;
}
