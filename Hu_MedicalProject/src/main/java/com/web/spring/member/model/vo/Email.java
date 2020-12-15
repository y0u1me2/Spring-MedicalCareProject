package com.web.spring.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Email {
	private String subject; //제목
    private String content; //내용
    private String receiver; //받는사람
}
