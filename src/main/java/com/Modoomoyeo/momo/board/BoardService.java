package com.Modoomoyeo.momo.board;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
    int insertboard(BoardVO vo);
}
