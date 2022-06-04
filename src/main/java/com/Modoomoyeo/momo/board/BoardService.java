package com.Modoomoyeo.momo.board;


import java.util.List;

public interface BoardService {
    int boardTotalRecord(BoardPagingVO bpvo);
    public List<BoardVO> boardList(BoardPagingVO bpvo);



    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    //public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);
}
