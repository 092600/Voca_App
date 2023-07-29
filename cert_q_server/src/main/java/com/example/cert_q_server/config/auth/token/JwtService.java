package com.example.cert_q_server.config.auth.token;


import java.io.IOException;
import java.util.*;
import java.util.function.Function;

import java.security.Key;

import com.example.cert_q_server.domain.user.User;
import com.example.cert_q_server.domain.user.user_details.CustomUserDetails;
import com.example.cert_q_server.domain.word.type.LanguageType;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class JwtService {

    @Value("${application.security.jwt.secret-key}")
    private String secreatKey;

    @Value("${application.security.jwt.expiration}")
    private long jwtExpiration;

    @Value("${application.security.jwt.refresh-token.expiration}")
    private long refreshExpiration;


    private final UserDetailsService userDetailsService;



    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    public String generateToken(CustomUserDetails userDetails)  {
        Map<String, Object> claims = setExtraClaims(userDetails);
        return generateToken(claims, userDetails);
    }

    Map<String, Object> setExtraClaims(CustomUserDetails userDetails) {
        Map<String, Object> claims = new HashMap<String, Object>();
        User user = userDetails.getUser();

        System.out.println("new Gson().toJson(user.getLanguagies()) = " + new Gson().toJson(user.getLanguagies()));

        claims.put("firstName", user.getFirstname());
        claims.put("lastName", user.getLastname());
        claims.put("status", user.getStatus().name());
        claims.put("languagies", new Gson().toJson(user.getLanguagies()));
        claims.put("profilePath", "http://localhost:8080/api/v1/auth/user/"+user.getId()+"/profile");

        System.out.println("claims = " + claims);


        return claims;
    }

    public String generateToken(
            Map<String, Object> extraClaims,
            UserDetails userDetails
    ) {
        return buildToken(extraClaims, userDetails, jwtExpiration);
    }

    public String generateRefreshToken(
            UserDetails userDetails
    ) {
        return buildToken(new HashMap<>(), userDetails, refreshExpiration);
    }

    private String buildToken(
            Map<String, Object> extraClaims,
            UserDetails userDetails,
            long expiration
    ) {
        return Jwts
                .builder()
                .setClaims(extraClaims)
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    /*
     *   isTokenValid(String token, UserDetails userDetails) : 토큰 유효 여부 확인 메서드
     *   Subject == UserDetails.getUsername() && Not Expired
     */
    public boolean isTokenValid(String token, UserDetails userDetails) {
        final String username = extractUsername(token);
        return (username.equals(userDetails.getUsername())) && !isTokenExpired(token);
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    private Claims extractAllClaims(String token) {
        return Jwts
                .parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    private Key getSignInKey() {
        byte[] keyBytes = Decoders.BASE64.decode(secreatKey);
        return Keys.hmacShaKeyFor(keyBytes);
    }

}
