package com.Modoomoyeo.momo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl {
    @Autowired
    BoardDAO dao;
    public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo) {
        return dao.totalRecordBoard(bpvo, bvo);
    }
    public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo) {
        return dao.allList(bpvo, bvo);
    }
}
