package com.example.cert_q_server.domain.word;

import javax.persistence.*;

import com.example.cert_q_server.domain.word.meaning.WordMeaning;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@Entity
@Inheritance(
        strategy = InheritanceType.SINGLE_TABLE
)
@DiscriminatorColumn(
        name = "languageType",
        discriminatorType = DiscriminatorType.STRING
)
@NoArgsConstructor
public abstract class Word {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String theme;

    @Column(nullable = false)
    private String spelling;

    @Column(nullable = true)
    private String pronunciation;

    @Column(name="languageType", insertable = false, updatable = false)
    protected String languageType;

    @JsonManagedReference
    @OneToMany(mappedBy = "word", fetch = FetchType.LAZY)
    private List<WordMeaning> meanings;
}