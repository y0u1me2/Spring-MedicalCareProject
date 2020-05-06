package com.web.spring.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanComponent {
	
	@Bean
	public Logger getLogger() {
		return LoggerFactory.getLogger(BeanComponent.class);
	}
	
}
