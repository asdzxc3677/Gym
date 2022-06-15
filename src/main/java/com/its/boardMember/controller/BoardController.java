package com.its.boardMember.controller;

import com.its.boardMember.dto.BoardDTO;
import com.its.boardMember.dto.PageDTO;
import com.its.boardMember.service.BoardService;
import com.its.boardMember.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
//    @Autowired
//    private CommentService commentService;

    @GetMapping("/saveFile")// 파일첨부 글작성 화면 띄우기
    public String saveFileForm(){
        return "boardPages/saveFile";
    }
    @PostMapping("/saveFile") //파일첨부 글작성 처리
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException{ // throws IOException [입출력 예외를 던진다]
        boardService.saveFile(boardDTO);
        return "redirect:/board/paging";
    }
    @GetMapping("/paging") //페이지 처리
    public String paging(@RequestParam(value = "page",required = false, defaultValue = "1") int page, Model model){
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList",boardList);
        model.addAttribute("paging",paging);
        return "boardPages/pagingList";
    }
}
