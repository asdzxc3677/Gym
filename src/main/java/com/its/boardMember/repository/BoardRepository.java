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
    } //파일첨부 글작성

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) { // 페이징리스트(글목록)
        return sql.selectList("Board.pagingList",pagingParam);
    }

    public int boardCount() { // 전체 페이지수 및 페이지번호
        return sql.selectOne("Board.count");
    }

    public void updateHits(Long id) { //조회수 증가
        sql.update("Board.updateHits",id);
    }

    public BoardDTO findById(Long id) { // 상세정보 가져오기
        return sql.selectOne("Board.findById",id);
    }

    public void delete(Long id) { //글 삭제(댓글삭제 포함)
        sql.delete("Board.delete",id);
    }

    public void update(BoardDTO boardDTO) {  //글수정처리
        sql.update("Board.update",boardDTO);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) { //글검색
        return sql.selectList("Board.search",searchParam);
    }
}
