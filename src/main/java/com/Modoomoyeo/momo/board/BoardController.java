package com.Modoomoyeo.momo.board;

import com.Modoomoyeo.momo.session.SessionConst;
import com.Modoomoyeo.momo.user.UserServiceImpl;
import com.Modoomoyeo.momo.user.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequiredArgsConstructor
public class BoardController {

    @Inject
    BoardService boser;

    private final UserServiceImpl userServiceImpl;



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
    public ModelAndView boardWrite(@SessionAttribute(name = SessionConst.LOGIN_USER, required = false) UserVO loginUser) {
        UserVO userInfo = userServiceImpl.getUser(loginUser);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("board/board_write");
        mav.addObject("userInfo", userInfo);
        return mav;
    }

    /*상세보기폼*/
    @GetMapping("/boardInfo")
    public ModelAndView boardInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("board/board_info");
        return mav;
    }

    @PostMapping ("/boardWriteOK")
    public String boardWriteOK(@SessionAttribute(name = SessionConst.LOGIN_USER, required = false) UserVO loginUser, @RequestParam String boardTitle, @RequestParam int boardMax, BoardVO bvo, HttpServletRequest request,Model model) {

        boser.boardInsert(bvo);
        return "board/boardlist";
    }


}
