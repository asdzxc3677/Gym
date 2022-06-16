package com.its.boardMember.service;

import com.its.boardMember.dto.CommentDTO;
import com.its.boardMember.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;
    public List<CommentDTO> findAll(Long boardId) { //댓글목록
        return commentRepository.findAll(boardId);
    }

    public void save(CommentDTO commentDTO) { //댓글등록
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> delete(Long boardId) { //댓글삭제
        return commentRepository.delete(boardId);
    }
}
