package com.example.cert_q_server.config.filter;


import com.example.cert_q_server.config.auth.token.JwtService;
import com.example.cert_q_server.config.auth.token.TokenRepo;
import com.sun.istack.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    private final JwtService jwtService;

    private final TokenRepo tokenRepo;
    private final UserDetailsService userDetailsService;


    @Override
    protected void doFilterInternal(
            @NotNull HttpServletRequest request,
            @NotNull HttpServletResponse response,
            @NotNull FilterChain filterChain
    ) throws ServletException, IOException {
        final String authHeader = request.getHeader("Authorization");
        final String jwt;
        final String userEmail;

        // authHeader 가 없거나 "Bearer"로 시작하지 않는 경우 넘김
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        // "Bearer " 이후 순수 토큰 값만 jwt 변수에 할당
        jwt = authHeader.substring(7);
        userEmail = jwtService.extractUsername(jwt);

        if (userEmail != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            UserDetails userDetails = userDetailsService.loadUserByUsername(userEmail);

            var isTokenValid = tokenRepo.findByToken(jwt)
                    .map(t -> !t.isExpired() && !t.isRevoked())
                    .orElse(false);

            if (jwtService.isTokenValid(jwt, userDetails) && isTokenValid) {
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );

                authToken.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails(request)
                );

                SecurityContextHolder.getContext().setAuthentication(authToken);
            }
        }

        filterChain.doFilter(request, response);
    }

//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        // 헤더에서 토큰 받아오기
//        String token = jwtTokenProvider.resolveToken((HttpServletRequest) request);
//
//        // 토큰이 유효하다면
//        if (token != null && jwtTokenProvider.validateToken(token)) {
//            // 토큰으로부터 유저 정보를 받아
//            Authentication authentication = jwtTokenProvider.getAuthentication(token);
//            // SecurityContext 에 객체 저장
//            SecurityContextHolder.getContext().setAuthentication(authentication);
//        }
//
//        // 다음 Filter 실행
//        chain.doFilter(request, response);
//    }
}
