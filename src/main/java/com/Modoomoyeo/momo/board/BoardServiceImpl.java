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
    @Autowired
    @Qualifier ("boarddao")//이름정함
    BoardDAO dao;
    @Override
    public int insertboard(BoardVO vo) {
        return dao.insertboard(vo);
    }
}
