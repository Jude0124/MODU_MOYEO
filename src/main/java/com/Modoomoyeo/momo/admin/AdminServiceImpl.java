package com.Modoomoyeo.momo.admin;

import com.Modoomoyeo.momo.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDAO dao;

    //관리자페이지 회원단
    public int totalRecordUser(AdminPagingVO apvo) {                     //회원 페이징
        return dao.totalRecordUser(apvo);
    }
    public List<adminUserVO> adminUsers(AdminPagingVO apvo) {            //회원 목록
        return dao.adminUsers(apvo);
    }
    public int adminUsersDel(String id){                                //회원 버튼 삭제
        return dao.adminUsersDel(id);
    }

    //관리자페이지 모임글 관리단
    public int totalRecordBoard(AdminPagingVO apvo) {                    //모임글 페이징
        return dao.totalRecordBoard(apvo);
    }
    public List<AdminBoardVO> adminBoards(AdminPagingVO apvo) {          //모임글 목록
        return dao.adminBoards(apvo);
    }
    public int adminBoardDel(AdminBoardVO bvo) {                         //모임글 다중삭제
        return dao.adminBoardDel(bvo);
    }

    //관리자페이지 모임 관리단
    public int totalRecordJoin(AdminPagingVO apvo) {                     //참여 페이징
        return dao.totalRecordJoin(apvo);
    }
    public List<AdminParticipateVO> adminJoin(AdminPagingVO apvo) {      //참여 목록
        return dao.adminJoin(apvo);
    }
    public int adminJoinDel(AdminParticipateVO pvo) {                    //참여 다중삭제
        return dao.adminJoinDel(pvo);
    }

    //관리자페이지 댓글 관리단
    public int totalRecordComment(AdminPagingVO apvo) {                  //댓글 페이징
        return dao.totalRecordComment(apvo);
    }
    public List<AdminCommentVO> adminComment(AdminPagingVO apvo) {       //댓글 목록
        return dao.adminComment(apvo);
    }
    public int adminCommentDel(AdminCommentVO cvo) {                     //댓글 다중삭제
        return dao.adminCommentDel(cvo);
    }
}
