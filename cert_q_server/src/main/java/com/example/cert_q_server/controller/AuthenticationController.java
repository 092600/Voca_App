package com.example.cert_q_server.controller;

import com.example.cert_q_server.config.account.AccountPrepareRequest;
import com.example.cert_q_server.config.account.AccountPrepareResponse;
import com.example.cert_q_server.config.account.AccountRegistrationResponse;
import com.example.cert_q_server.config.auth.AuthenticationRequest;
import com.example.cert_q_server.config.auth.AuthenticationResponse;
import com.example.cert_q_server.config.auth.AuthenticationService;
import com.example.cert_q_server.config.auth.RegisterRequest;
import com.example.cert_q_server.domain.word.type.LanguageType;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

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
    public ResponseEntity<AccountRegistrationResponse> register(
            @RequestBody RegisterRequest request
    ) {
//        AccountRegistrationResponse
//        authenticationService.register(request)
//        System.out.println("authenticationService.register(request) = " + authenticationService.register(request));
        return ResponseEntity.ok(authenticationService.register(request));
    }


    @PostMapping("/prepare")
    public ResponseEntity<AccountPrepareResponse> prepare(
//            @RequestPart AccountPrepareRequest request
            @RequestParam(name = "email") String email,
            @RequestParam(name = "languagies") List<String> languagies,
            @RequestPart(value = "image", required = false) MultipartFile image

    ) {
        List<LanguageType> langs = languagies.stream()
                .map((language) -> LanguageType.valueOf(language))
                .collect(Collectors.toList());
        
        AccountPrepareRequest request = AccountPrepareRequest.builder()
                            .email(email)
                            .image(image)
                            .languagies(langs)
                            .build();

        return ResponseEntity.ok(authenticationService.prepare(request));
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
