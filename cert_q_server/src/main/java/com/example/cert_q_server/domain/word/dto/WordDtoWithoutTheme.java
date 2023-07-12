package com.example.cert_q_server.domain.word.dto;

import com.example.cert_q_server.domain.word.Word;
import com.example.cert_q_server.domain.word.meaning.WordMeaning;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WordDtoWithoutTheme
{
    private String spelling;
    private String pronunciation;

    private String languageType;
    private List<WordMeaning> meanings;


    public WordDtoWithoutTheme(Word word) {
        this.spelling = word.getSpelling();
        this.pronunciation = word.getPronunciation();
        this.languageType = word.getLanguageType();
        this.meanings = word.getMeanings();
    }

}

