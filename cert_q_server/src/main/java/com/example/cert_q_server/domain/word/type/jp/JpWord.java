package com.example.cert_q_server.domain.word.type.jp;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import com.example.cert_q_server.domain.word.Word;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@DiscriminatorValue("JP")
@NoArgsConstructor(
        access = AccessLevel.PROTECTED
)
public class JpWord extends Word {


}
