package com.example.cert_q_server.config.auth;


import lombok.*;

@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequest {

    private String firstName;
    private String lastName;

    private String email;
    private String password;

}
