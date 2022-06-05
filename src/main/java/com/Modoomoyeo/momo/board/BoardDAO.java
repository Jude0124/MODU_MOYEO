package com.Modoomoyeo.momo.board;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface BoardDAO {
    public int boardTotalRecord(BoardPagingVO bpvo);
    public List<BoardVO> boardList(BoardPagingVO bpvo);


    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    //public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);
    int insertboard(BoardVO vo);
}
