package com.Modoomoyeo.momo.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
import java.util.List;

@Service("boardservice")

public class BoardServiceImpl implements BoardService{

    @Inject
    BoardDAO dao;

    @Override
    public int boardTotalRecord(BoardPagingVO bpvo) {
        return dao.boardTotalRecord(bpvo);
    }

    @Override
    public List<BoardVO> boardList(BoardPagingVO bpvo) {
        return dao.boardList(bpvo);
    }
//    private final BoardDAO dao;
//
//
//
//    @Autowired
//    public BoardServiceImpl(BoardDAO dao) {
//        this.dao = dao;
    }
}
