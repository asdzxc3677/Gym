package com.its.boardMember.service;

import com.its.boardMember.dto.BoardDTO;
import com.its.boardMember.dto.PageDTO;
import com.its.boardMember.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public void saveFile(BoardDTO boardDTO) throws IOException { //파일첨부 및 글작성 처리
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "_" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "D:\\spring_img\\" + boardFileName;
        if (!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.saveFile(boardDTO);
    }
    private static final int PAGE_LIMIT = 7; //한페이지에 보여줄 글 갯수 선언
    private static final int BLOCK_LIMIT = 11; // 보여줄 필요 페이지 수 선언

    public List<BoardDTO> pagingList(int page) { // 글목록을(페이징리스트) db로부터 가져오는 부분이다.
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String,Integer> pagingParam = new HashMap<>();
        pagingParam.put("start",pagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) { // 전체 페이지수 및 페이지번호 처리부분 이다.
        int boardCount = boardRepository.boardCount();
        int maxPage = (int)(Math.ceil((double) boardCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT -1;
        if (endPage > maxPage)
            endPage = maxPage;

        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public BoardDTO findById(Long id) {
        boardRepository.updateHits(id); //조회수 증가
        return boardRepository.findById(id); // 상세정보 가져오기
    }

    public void delete(Long id) { //글 삭제(댓글삭제 포함)
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) { //글수정처리
        boardRepository.update(boardDTO);
    }

    public List<BoardDTO> search(String searchType, String q) { //검색처리
        Map<String,String> searchParam = new HashMap<>();
        searchParam.put("type",searchType);
        searchParam.put("q",q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }
}
