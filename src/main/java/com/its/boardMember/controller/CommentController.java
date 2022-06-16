package com.its.boardMember.controller;

import com.its.boardMember.dto.CommentDTO;
import com.its.boardMember.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @PostMapping("/save")//댓글등록
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return commentDTOList;
    }
    @GetMapping("/delete")//댓글삭제
    public @ResponseBody List<CommentDTO> delete(@RequestParam("id")Long id,
                                                 @RequestParam("boardId") Long boardId){
        List<CommentDTO> commentDTOList = new ArrayList<CommentDTO>();
        try {
            commentService.delete(id);
            commentDTOList = commentService.findAll(boardId);
        } catch (Exception e){
            e.printStackTrace();
        }
        return commentDTOList;
    }
}
