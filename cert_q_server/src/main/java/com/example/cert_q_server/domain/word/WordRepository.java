package com.example.cert_q_server.domain.word;


import com.example.cert_q_server.domain.word.dto.WordDto;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface WordRepository extends JpaRepository<Word, Long> {

//    @EntityGraph(attributePaths = "meanings")
    @Query("SELECT DISTINCT new com.example.cert_q_server.domain.word.dto.WordDto(w) " +
            "FROM Word w " +
            "WHERE w.languageType = :type")
    List<WordDto> getWordDtosByLanguageType(@Param("type") String type);

    @Query("SELECT DISTINCT w " +
            "FROM Word w " +
            "JOIN FETCH w.meanings " +
            "WHERE w.languageType = :type")
    List<Word> getWordByLanguageType(@Param("type") String type);
//    @Query("SELECT DISTINCT new com.example.cert_q_server.domain.word.dto.WordDto(w) " +
//            "FROM Word w " +
//            "JOIN FETCH w.meanings " +
//            "WHERE w.languageType = :type")
//    List<WordDto> findWordDtoByLanguageType(@Param("type") String type);

//    @Query("SELECT w FROM Word w JOIN FETCH w.meanings WHERE w.languageType = :type")
//    List<Word> findWordByLanguageType(@Param("type") String type);


}
