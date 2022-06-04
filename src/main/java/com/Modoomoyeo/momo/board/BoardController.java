package com.Modoomoyeo.momo.board;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;



@Controller
public class BoardController {

    @Inject
    BoardService boser;

    /*전체글보기 폼*/
//    @GetMapping("/boardList")
//    public ModelAndView boardList(BoardPagingVO bpvo, BoardVO bvo, HttpSession session) {
//        ModelAndView mav = new ModelAndView();
////        bvo.setNickname((String)session.getAttribute("nickname"));
////
////        bpvo.setTotalRecord(boser.totalRecordBoard(bpvo, bvo));
////        mav.addObject("bpvo", bpvo);
////
////        mav.addObject("list", boser.allList(bpvo, bvo));
//        mav.setViewName("board/board_list");
//        return mav;
//    }

    @GetMapping("/boardList")
    public ModelAndView boardList(BoardPagingVO bpvo) {
        ModelAndView mav = new ModelAndView();

        bpvo.setTotalRecord(boser.boardTotalRecord(bpvo));

        mav.addObject("list", boser.boardList(bpvo));
        mav.addObject("bpvo", bpvo);

        mav.setViewName("board/board_list");
        return mav;
    }

    /*글쓰기폼*/
    @GetMapping("/boardWrite")
    public ModelAndView boardWrite() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("board/board_write");
        return mav;
    }

    /*상세보기폼*/
    @GetMapping("/boardInfo")
    public ModelAndView boardInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("board/board_info");
        return mav;
    }

}
