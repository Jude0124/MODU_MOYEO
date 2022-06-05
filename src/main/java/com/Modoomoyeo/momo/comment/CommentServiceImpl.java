package com.Modoomoyeo.momo.comment;

import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Inject
    CommentDAO dao;

    @Override
    public List<CommentVO> commentList(Integer no) {
        return dao.commentList(no);
    }

    @Override
    public int commentWrite(CommentVO vo) {
        return dao.commentWrite(vo) ;
    }

    @Override
    public int commentDel(Integer comment_no) {
        return dao.commentDel(comment_no);
    }
}
