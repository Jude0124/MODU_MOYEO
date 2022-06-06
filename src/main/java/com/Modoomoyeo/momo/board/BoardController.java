package com.Modoomoyeo.momo.board;

import com.Modoomoyeo.momo.session.SessionConst;
import com.Modoomoyeo.momo.user.UserServiceImpl;
import com.Modoomoyeo.momo.user.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;



@Controller
@RequiredArgsConstructor
public class BoardController {

    @Inject
    BoardService boser;

    private final UserServiceImpl userServiceImpl;

    @GetMapping("/boardList")
    public ModelAndView boardList(BoardPagingVO bpvo, @SessionAttribute(name = SessionConst.LOGIN_USER, required = false) UserVO loginUser) {
        ModelAndView mav = new ModelAndView();

        bpvo.setTotalRecord(boser.boardTotalRecord(bpvo));

        mav.addObject("list", boser.boardList(bpvo));
        mav.addObject("bpvo", bpvo);

        mav.setViewName("board/board_list");

        if(loginUser != null){
            UserVO userInfo = userServiceImpl.getUser(loginUser);
            mav.addObject("userInfo", userInfo);
        }
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

    /*게시글 삭제*/
    @GetMapping("/board/contentDel")
    public ModelAndView contentDel(Integer no) {
        ModelAndView mav = new ModelAndView();
        boser.contentDelete(no);

        mav.setViewName("redirect:/boardList");
        return mav;
    }
}
