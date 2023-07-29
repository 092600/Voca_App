package com.example.cert_q_server.domain.user;

import com.example.cert_q_server.config.auth.token.Token;
import com.example.cert_q_server.domain.common.UserTimeEntity;
import com.example.cert_q_server.domain.user.role.Role;
import com.example.cert_q_server.domain.word.type.LanguageType;
import lombok.*;

import javax.persistence.*;
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

    @Column(nullable = false, length = 50)
    private String email;
    @Column(nullable = false)
    private String password;

    private String profilePath;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Enumerated(EnumType.STRING)
    private UserStatus status;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    List<LanguageType> languagies;

    @OneToMany(mappedBy = "user")
    private List<Token> tokens;

    public String getFullUserName() {
        return firstname + " " + lastname;
    }

    public void prepare() {
        status = UserStatus.ACTIVE;
        profilePath = "/Users/sim/Documents/GitHub/Voca_App/image/profile/"+id+"/profile.jpg";
    }

}
