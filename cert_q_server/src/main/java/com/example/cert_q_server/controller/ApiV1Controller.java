package com.example.cert_q_server.controller;

import com.example.cert_q_server.domain.word.Word;
import com.example.cert_q_server.domain.word.WordService;
import com.example.cert_q_server.domain.word.dto.WordDto;
import com.example.cert_q_server.domain.word.dto.WordDtoWithoutTheme;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class ApiV1Controller {

    private final WordService wordService;
    
    @GetMapping("/api/v1/words")
    public List<WordDto> getWords(@RequestParam("type") String type) {
        return wordService.getWordDtosByLanguageType(type);
    }

    @GetMapping("/api/v1/theme")
    public Map<String, List<WordDtoWithoutTheme>> getWordsGroupByTheme(@RequestParam("type") String type) {
//        result.keySet().forEach((e) -> System.out.println("e = " + result.get(e).size()));
        return wordService.getWordDtosByLanguageTypeGroupByTheme(type);
    }
}
