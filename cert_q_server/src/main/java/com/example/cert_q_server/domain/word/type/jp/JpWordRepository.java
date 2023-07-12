package com.example.cert_q_server.domain.word.type.jp;

import com.example.cert_q_server.domain.word.type.eng.EngWord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JpWordRepository extends JpaRepository<JpWord, Long> {
    @Query("SELECT w FROM JpWord w JOIN FETCH w.meanings")
    List<JpWord> findWords();

}
