package com.example.cert_q_server.controller;

import com.example.cert_q_server.config.auth.AuthenticationRequest;
import com.example.cert_q_server.config.auth.AuthenticationResponse;
import com.example.cert_q_server.config.auth.AuthenticationService;
import com.example.cert_q_server.config.auth.RegisterRequest;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @GetMapping("/email/duplicate")
    public ResponseEntity<Boolean> duplicateEmail(
            @RequestParam("email") String email
    ) {
        Boolean existsUserByEmail = authenticationService.duplicateEmail(email);

        return ResponseEntity.ok(existsUserByEmail);
    }
    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request
    ) {
        return ResponseEntity.ok(authenticationService.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody AuthenticationRequest request
    ) {
        return ResponseEntity.ok(authenticationService.authenticate(request));
    }

    @PostMapping("/refresh-token")
    public void refreshToken(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        authenticationService.refreshToken(request, response);
    }

}
