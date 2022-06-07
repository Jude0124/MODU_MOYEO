package com.Modoomoyeo.momo.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AdminController {

    @Autowired
    AdminService adser;

    @GetMapping("/admin")
    public ModelAndView adminUsers(AdminPagingVO apvo) {
        ModelAndView mav = new ModelAndView();
        apvo.setTotalRecord(adser.totalRecordUser(apvo));
        mav.addObject("adminUserList", adser.adminUsers(apvo));
        mav.addObject("apvo", apvo);
        mav.setViewName("admin/adminUsers");
        return mav;
    }

    // 회원정보 삭제
    @GetMapping("/adminUsersDel")
    public ResponseEntity<String> adminUsersDel(String id, HttpSession session){

        ResponseEntity<String> entity = null;

        try {
            adser.adminUsersDel(id);

            String msg = "<script>alert('회원정보가 삭제되었습니다.'); location.href='/admin';</script>";

            entity = new ResponseEntity<String>(msg, HttpStatus.OK);
        }catch(Exception e) {
            e.printStackTrace();

            String msg = "<script>alert('삭제실패하였습니다.');history.back();</script>";
            entity = new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @GetMapping("/adminBoards")
    public ModelAndView adminBoards(AdminPagingVO apvo){
        ModelAndView mav = new ModelAndView();
        apvo.setTotalRecord(adser.totalRecordBoard(apvo));
        mav.addObject("adminBoardList", adser.adminBoards(apvo));
        mav.addObject("apvo", apvo);
        mav.setViewName("admin/adminBoards");
        return mav;
    }

    @PostMapping("/adminBoardsDel")
    public ModelAndView adminUsersDel(AdminBoardVO bvo) {
        ModelAndView mav = new ModelAndView();
        adser.adminBoardDel(bvo);
        mav.setViewName("redirect:adminBoards");
        return mav;
    }
    @GetMapping("/adminJoin")
    public ModelAndView adminJoin(AdminPagingVO apvo) {
        ModelAndView mav = new ModelAndView();
        apvo.setTotalRecord(adser.totalRecordJoin(apvo));
        mav.addObject("adminJoinList", adser.adminJoin(apvo));
        mav.addObject("apvo", apvo);
        mav.setViewName("admin/adminJoin");
        return mav;
    }
    @PostMapping("/adminJoinDel")
    public ModelAndView adminJoinDel(AdminParticipateVO pvo) {
        ModelAndView mav = new ModelAndView();
        adser.adminJoinDel(pvo);
        mav.setViewName("redirect:adminJoin");
        return mav;
    }

    @GetMapping("/adminComment")
    public ModelAndView adminComment(AdminPagingVO apvo) {
        ModelAndView mav = new ModelAndView();
        apvo.setTotalRecord(adser.totalRecordComment(apvo));
        mav.addObject("adminCommentList", adser.adminComment(apvo));
        mav.addObject("apvo", apvo);
        mav.setViewName("admin/adminComment");
        return mav;
    }
    @PostMapping("/adminCommentDel")
    public ModelAndView adminCommentDel(AdminCommentVO cvo) {
        ModelAndView mav = new ModelAndView();
        adser.adminCommentDel(cvo);
        mav.setViewName("redirect:adminComment");
        return mav;

    }


}


