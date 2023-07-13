package com.example.cert_q_server.domain.user;

import com.example.cert_q_server.config.auth.token.Token;
import com.example.cert_q_server.domain.common.BaseTimeEntity;
import com.example.cert_q_server.domain.common.UserTimeEntity;
import com.example.cert_q_server.domain.user.role.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User extends UserTimeEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstname;
    private String lastname;

    private String email;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Enumerated(EnumType.STRING)
    private UserStatus status;

    @OneToMany(mappedBy = "user")
    private List<Token> tokens;

    public String getFullUserName() {
        return firstname + " " + lastname;
    }

}
