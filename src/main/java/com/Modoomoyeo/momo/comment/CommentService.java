package com.Modoomoyeo.momo.comment;

import java.util.List;

public interface CommentService {


    public List<CommentVO> commentList(Integer no);

    public int commentWrite(CommentVO vo);

    public int commentDel(Integer comment_no);
}
