package com.its.boardMember.repository;

import com.its.boardMember.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void saveFile(BoardDTO boardDTO) { //파일첨부 글작성
        sql.insert("Board.saveFile",boardDTO);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) { // 페이징리스트(글목록)
        return sql.selectList("Board.pagingList",pagingParam);
    }

    public int boardCount() { //전체 페이지수 및 페이지번호
        return sql.selectOne("Board.count");
    }
}
