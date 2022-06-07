package com.Modoomoyeo.momo.board;

import com.Modoomoyeo.momo.user.UserVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

@Service

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



    @Override
    public int boardInsert(BoardVO bvo) {
        return dao.boardInsert(bvo);
    }

    //    private final BoardDAO dao;

    @Override
    public int contentDelete(Integer no) {
        return dao.contentDelete(no);
    }
//    private final BoardDAO dao;

//
//
//
//    @Autowired
//    public BoardServiceImpl(BoardDAO dao) {
//        this.dao = dao;
    }

    //@Override
    //public int totalRecordBoard(BoardPagingVO bpvo, BoardVO bvo) {
//        return dao.totalRecordBoard(bpvo, bvo);
//    }
//    @Override
//    public List<BoardVO> allList(BoardPagingVO bpvo, BoardVO bvo) {
//        return dao.allList(bpvo, bvo);
//    }
//}
