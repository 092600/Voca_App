package com.example.cert_q_server.config.account;

import com.example.cert_q_server.domain.word.type.LanguageType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AccountPrepareRequest {

    private String email;
    private MultipartFile image;

    private List<LanguageType> languagies;

}
