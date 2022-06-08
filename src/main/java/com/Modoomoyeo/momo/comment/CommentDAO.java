package com.Modoomoyeo.momo.comment;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommentDAO {
    List<CommentVO> commentList(Integer no);

    int commentWrite(CommentVO vo);

    int commentDel(Integer comment_no);
}
