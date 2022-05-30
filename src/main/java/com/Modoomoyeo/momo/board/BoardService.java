package com.Modoomoyeo.momo.board;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
    public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo);
    public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo);
}
