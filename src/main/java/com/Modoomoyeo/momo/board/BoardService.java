package com.Modoomoyeo.momo.board;


import java.util.List;

public interface BoardService {
    int boardTotalRecord(BoardPagingVO bpvo);
    List<BoardVO> boardList(BoardPagingVO bpvo);
    int boardInsert(BoardVO bvo);
    public int contentDelete(Integer no);
    public int parDelete(Integer no);
    int participateInsert(BoardVO bvo);
    int participateCancel(String nickname, int no);

    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    //public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);
}
