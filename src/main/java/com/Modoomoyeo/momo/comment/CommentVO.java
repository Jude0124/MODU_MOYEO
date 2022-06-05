package com.Modoomoyeo.momo.comment;

public class CommentVO {
    private int comment_no;
    private int no;
    private String nickname;
    private String comment;
    private String time;

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getComment_no() {
        return comment_no;
    }

    public void setComment_no(int comment_no) {
        this.comment_no = comment_no;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
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




}