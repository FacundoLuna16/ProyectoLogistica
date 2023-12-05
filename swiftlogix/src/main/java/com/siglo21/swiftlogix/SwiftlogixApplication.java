package com.siglo21.swiftlogix;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
//@EnableScheduling // Habilita el asincronismo

public class SwiftlogixApplication {

	public static void main(String[] args) {
		SpringApplication.run(SwiftlogixApplication.class, args);
	}

}
