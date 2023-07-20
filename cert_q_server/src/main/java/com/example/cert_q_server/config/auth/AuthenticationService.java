package com.example.cert_q_server.config.auth;

import com.example.cert_q_server.config.account.AccountPrepareRequest;
import com.example.cert_q_server.config.account.AccountPrepareResponse;
import com.example.cert_q_server.config.account.AccountRegistrationResponse;
import com.example.cert_q_server.config.auth.token.JwtService;
import com.example.cert_q_server.config.auth.token.Token;
import com.example.cert_q_server.config.auth.token.TokenRepo;
import com.example.cert_q_server.config.auth.token.TokenType;
import com.example.cert_q_server.domain.user.User;
import com.example.cert_q_server.domain.user.UserRepo;
import com.example.cert_q_server.domain.user.UserServiceImpl;
import com.example.cert_q_server.domain.user.UserStatus;
import com.example.cert_q_server.domain.user.role.Role;
import com.example.cert_q_server.domain.user.user_details.CustomUserDetails;
import com.example.cert_q_server.domain.word.type.LanguageType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.istack.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final UserRepo userRepo;
    private final TokenRepo tokenRepo;

    private final UserServiceImpl userService;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;


    public Boolean duplicateEmail(String email) {
        return userRepo.existsByEmail(email);
    }

    public AccountPrepareResponse prepare(
            @NotNull AccountPrepareRequest request
    ) {
        try {
            userService.prepare(request);
            return new AccountPrepareResponse(true);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new AccountPrepareResponse(false);
    }

    public AccountRegistrationResponse register (
            RegisterRequest request
    ) {

        try {
            userService.existsByEmail(request.getEmail());

            var user = User.builder()
                    .firstname(request.getFirstName())
                    .lastname(request.getLastName())
                    .email(request.getEmail())
                    .password(passwordEncoder.encode(request.getPassword()))
                    .role(Role.USER)
                    .status(UserStatus.NEED_PREPARE)
                    .build();

            userService.save(user);

            return AccountRegistrationResponse.builder()
                    .created(true)
                    .build();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return AccountRegistrationResponse.builder()
                .created(false)
                .build();
    }

    public AuthenticationResponse authenticate(
            AuthenticationRequest request
    ) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                ));

        var user = new CustomUserDetails(userService.findByEmail(request.getEmail()));

        var jwtToken = jwtService.generateToken(user);
        var refreshToken = jwtService.generateRefreshToken(user);

        revokeAllUserTokens(user.getUser());
        saveUserToken(user.getUser(), jwtToken);

        return AuthenticationResponse.builder()
                .accessToken(jwtToken)
                .refreshToken(refreshToken)
                .build();
    }

    private void saveUserToken(User user, String jwtToken) {
        var token = Token.builder()
                .user(user)
                .token(jwtToken)
                .expired(false)
                .revoked(false)
                .build();
        tokenRepo.save(token);
    }

    private void revokeAllUserTokens(User user) {
        var validUserTokens = tokenRepo.findAllValidTokenByUser(user.getId());
        if (validUserTokens.isEmpty())
            return;

        validUserTokens.forEach(token -> {
            token.setExpired(true);
            token.setRevoked(true);
        });

        tokenRepo.saveAll(validUserTokens);
    }

    public void refreshToken(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        final String refreshToken;
        final String userEmail;

        if (authHeader == null ||!authHeader.startsWith("Bearer ")) {
            return;
        }

        // Token Value
        refreshToken = authHeader.substring(7);
        userEmail = jwtService.extractUsername(refreshToken);

        if (userEmail != null) {
            var user = userRepo.findByEmail(userEmail)
                    .orElseThrow();
            var userDetails = new CustomUserDetails(user);

            if (jwtService.isTokenValid(refreshToken, userDetails)) {
                var accessToken = jwtService.generateToken(userDetails);
                revokeAllUserTokens(user);
                saveUserToken(user, accessToken);
                var authResponse = AuthenticationResponse.builder()
                        .accessToken(accessToken)
                        .refreshToken(refreshToken)
                        .build();
                new ObjectMapper().writeValue(response.getOutputStream(), authResponse);
            }
        }
    }
}
