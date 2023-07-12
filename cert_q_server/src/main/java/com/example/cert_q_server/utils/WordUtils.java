package com.example.cert_q_server.utils;

import com.example.cert_q_server.domain.word.Word;
import com.example.cert_q_server.domain.word.dto.WordDtoWithoutTheme;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class WordUtils {
    public static Map<String, List<WordDtoWithoutTheme>> convertToThemeMap(List<Word> words) {
        return words.stream()
                .collect(Collectors.groupingBy(
                        Word::getTheme,
                        Collectors.mapping(WordDtoWithoutTheme::new, Collectors.toList())
                ));
    }
}
