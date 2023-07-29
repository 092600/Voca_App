package com.example.cert_q_server.controller;

import com.example.cert_q_server.domain.word.Word;
import com.example.cert_q_server.domain.word.WordService;
import com.example.cert_q_server.domain.word.dto.WordDto;
import com.example.cert_q_server.domain.word.dto.WordDtoWithoutTheme;
import com.example.cert_q_server.domain.word.type.LanguageType;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/voca")
public class ApiV1Controller {

    private final WordService wordService;
    
    @GetMapping("/words")
    public List<WordDto> getWords(
            @RequestParam("type") String type
    ) {
        return wordService.getWordDtosByLanguageType(type);
    }

    @GetMapping("/theme")
    public Map<String, List<WordDtoWithoutTheme>> getWordsGroupByTheme(
            @RequestParam("type") LanguageType type
    ) {
        System.out.println(type);
        return wordService.getWordDtosByLanguageTypeGroupByTheme(type);
    }

}
