package com.Modoomoyeo.momo.board;

import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BoardDAO {
    public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);

}
