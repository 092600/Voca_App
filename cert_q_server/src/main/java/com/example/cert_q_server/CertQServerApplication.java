package com.example.cert_q_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class CertQServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CertQServerApplication.class, args);
	}

}
