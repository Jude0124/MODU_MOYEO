package com.Modoomoyeo.momo.admin;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;


public class AdminCommentVO {
    private String comment_no;  //고유댓글번호(PK)
    private String no; // 글번호
    private String nickname; // 닉네임
    private String comment; // 댓글
    private String time; // 시간
    private List<Integer> noList;

    public String getComment_no() {
        return comment_no;
    }

    public void setComment_no(String comment_no) {
        this.comment_no = comment_no;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<Integer> getNoList() {
        return noList;
    }

    public void setNoList(List<Integer> noList) {
        this.noList = noList;
    }
}
