package com.example.cert_q_server.domain.word.type.esp;

import com.example.cert_q_server.domain.word.Word;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Getter
@Entity
@DiscriminatorValue("ESP")
@NoArgsConstructor(
        access = AccessLevel.PROTECTED
)
public class EspWord extends Word {


}
