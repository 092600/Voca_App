package com.example.cert_q_server.domain.word.meaning;

import com.example.cert_q_server.domain.word.Word;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
public class WordMeaning {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String meaning;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name ="word")
    private Word word;
}