package com.example.cert_q_server.domain.word.dto;

import com.example.cert_q_server.domain.word.Word;
import com.example.cert_q_server.domain.word.meaning.WordMeaning;
import com.example.cert_q_server.domain.word.type.LanguageType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WordDto {

    private String theme;

    private String spelling;
    private String pronunciation;

    private LanguageType languageType;
    private List<WordMeaning> meanings;


    public WordDto(Word word) {
        this.theme = word.getTheme();
        this.spelling = word.getSpelling();
        this.pronunciation = word.getPronunciation();
        this.languageType = word.getLanguageType();
        this.meanings = word.getMeanings();
    }

}
