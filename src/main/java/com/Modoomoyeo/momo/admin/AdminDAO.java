package com.Modoomoyeo.momo.admin;

import com.Modoomoyeo.momo.board.BoardVO;
import com.Modoomoyeo.momo.comment.CommentVO;
import com.Modoomoyeo.momo.participate.ParticipateVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import javax.xml.stream.events.Comment;
import java.util.List;
@Mapper
@Repository
public interface AdminDAO {
    //관리자페이지 회원단
    public int totalRecordUser(AdminPagingVO apvo);                     //회원 페이징
    public List<adminUserVO> adminUsers(AdminPagingVO apvo);            //회원 목록
    public int adminUsersDel(String id);                                //회원 버튼 삭제

    //관리자페이지 모임글 관리단
    public int totalRecordBoard(AdminPagingVO apvo);                    //모임글 페이징
    public List<AdminBoardVO> adminBoards(AdminPagingVO apvo);          //모임글 목록
    public int adminBoardDel(AdminBoardVO bvo);                         //모임글 다중삭제

    //관리자페이지 모임 관리단
    public int totalRecordJoin(AdminPagingVO apvo);                     //참여 페이징
    public List<AdminParticipateVO> adminJoin(AdminPagingVO apvo);      //참여 목록
    public int adminJoinDel(AdminParticipateVO pvo);                    //참여 다중삭제

    //관리자페이지 댓글 관리단
    public int totalRecordComment(AdminPagingVO apvo);                  //댓글 페이징
    public List<AdminCommentVO> adminComment(AdminPagingVO apvo);       //댓글 목록
    public int adminCommentDel(AdminCommentVO cvo);                     //댓글 다중삭제

}
