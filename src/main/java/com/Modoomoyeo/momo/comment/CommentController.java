package com.Modoomoyeo.momo.comment;

import com.Modoomoyeo.momo.session.SessionConst;
import com.Modoomoyeo.momo.user.UserVO;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/comment/*")
public class CommentController {

    @Inject
    CommentService service;

    @PostMapping("/commentOk")
    public int commentOk(CommentVO vo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserVO checkuser =  (UserVO)session.getAttribute(SessionConst.LOGIN_USER);
        vo.setId(checkuser.getId());

        return service.commentWrite(vo);
    }

    @GetMapping("/commentList")
    @ResponseBody
    public List<CommentVO> list(Integer no) {
        return service.commentList(no);
    }

    @GetMapping("/commentDel")
    public int commentDel(Integer comment_no) {
        System.out.println("no: " + comment_no);
        return service.commentDel(comment_no);
    }



}
