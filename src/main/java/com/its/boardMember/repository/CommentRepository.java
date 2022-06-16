package com.its.boardMember.repository;

import com.its.boardMember.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<CommentDTO> findAll(Long boardId) { //댓글목록
        return sql.selectList("Comment.findAll",boardId);
    }

    public void save(CommentDTO commentDTO) { //댓글등록
        sql.insert("Comment.save",commentDTO);
    }
}
