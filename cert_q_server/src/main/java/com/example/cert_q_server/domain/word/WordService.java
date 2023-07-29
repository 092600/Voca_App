package com.example.cert_q_server.domain.word;

import com.example.cert_q_server.domain.word.dto.WordDto;
import com.example.cert_q_server.domain.word.dto.WordDtoWithoutTheme;
import com.example.cert_q_server.domain.word.type.LanguageType;
import com.example.cert_q_server.utils.WordUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WordService {
    private final WordRepository wordRepository;
//    private final JpWordRepository jpWordRepository;
//    private final EngWordRepository engWordRepository;

    void saveWord(Word word) {
        wordRepository.save(word);
    }

    public List<Word> findWords() {
        return wordRepository.findAll();
    }

    public List<WordDto> getWordDtosByLanguageType(String languageType) {
        return wordRepository.getWordDtosByLanguageType(languageType);
    }

    public Map<String, List<WordDtoWithoutTheme>> getWordDtosByLanguageTypeGroupByTheme(LanguageType languageType) {
        List<Word> words = wordRepository.getWordByLanguageType(languageType);
        return WordUtils.convertToThemeMap(words);
    }

//    public List<Word> findEngWords() {
//        return engWordRepository.findWords().stream().map((engWord -> (Word) engWord)).collect(Collectors.toList());
//    }
//
//    public List<Word> findJpWords() {
//        return jpWordRepository.findWords().stream().map((jpWord -> (Word) jpWord)).collect(Collectors.toList());
//    }

}
