package com.dactech.requestoff;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class RequestOffApplication {
	public static void main(String[] args) {
		SpringApplication.run(RequestOffApplication.class, args);
	}
}
