package com.web.spring.ask.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ask {
	
	private int askNo;
	private String askWriter;
	private String askTitle;
	private String askContent;
	private Date askDate;
	private int originNo;
	private int groupOrd;
	private int groupStep;
	private int groupIndent;

}
