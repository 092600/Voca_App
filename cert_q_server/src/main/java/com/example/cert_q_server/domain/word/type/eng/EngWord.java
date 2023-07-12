package com.example.cert_q_server.domain.word.type.eng;

import com.example.cert_q_server.domain.word.Word;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Getter
@Entity
@DiscriminatorValue("ENG")
@NoArgsConstructor(
        access = AccessLevel.PROTECTED
)
public class EngWord extends Word {


}
