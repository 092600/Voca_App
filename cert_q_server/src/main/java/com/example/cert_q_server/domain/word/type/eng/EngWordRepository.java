package com.example.cert_q_server.domain.word.type.eng;

import com.example.cert_q_server.domain.word.Word;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EngWordRepository  extends JpaRepository<EngWord, Long> {

    @Query("SELECT w FROM EngWord w JOIN FETCH w.meanings")
    List<EngWord> findWords();

}
