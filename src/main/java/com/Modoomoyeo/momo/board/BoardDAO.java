package com.Modoomoyeo.momo.board;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper //dao 인식 어노테이션
@Repository(BoardDAO)
public class BoardDAO {
    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    //public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);
    int insertboard(BoardVO vo);
}
