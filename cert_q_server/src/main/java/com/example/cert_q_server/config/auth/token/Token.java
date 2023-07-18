package com.example.cert_q_server.config.auth.token;

import com.example.cert_q_server.domain.user.User;
import lombok.*;

import javax.persistence.*;
import java.sql.ConnectionBuilder;

@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Token {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String token;

    @Enumerated(EnumType.STRING)
    private TokenType tokenType = TokenType.BEARER;

    private boolean revoked;

    // 토큰 만료 여부
    private boolean expired;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User user;

    @Builder
    public Token(Long id, String token, boolean revoked, boolean expired, User user) {
        this.id = id;
        this.token = token;
        this.revoked = revoked;
        this.expired = expired;
        this.user = user;
    }

    public void setExpired(boolean bool) {
        this.revoked = bool;
    }

    public void setRevoked(boolean bool) {
        this.revoked = bool;
    }
}
