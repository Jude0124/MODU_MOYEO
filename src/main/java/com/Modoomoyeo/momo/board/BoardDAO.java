package com.Modoomoyeo.momo.board;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BoardDAO {
    int boardTotalRecord(BoardPagingVO bpvo);
    List<BoardVO> boardList(BoardPagingVO bpvo);
    int boardInsert(BoardVO bvo);
    int contentDelete(Integer no);
    int participateInsert(BoardVO bvo);
    int participateCancel(String nickname, int no);

    int parDelete(Integer no);

    List<BoardVO> participateList(BoardPagingVO bpvo);


    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    //public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);

}
