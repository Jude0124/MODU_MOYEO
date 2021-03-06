package com.Modoomoyeo.momo.admin;

import java.util.List;

public class AdminBoardVO {
    private String no;                  //글번호
    private String nickname;            //작성자
    private String title;               //내용
    private String time;                //작성일 (시간)
    private String region;              //지역
    private String max;                 //최대



    private List<Integer> noList;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRegion() {return region;}

    public void setRegion(String region) {this.region = region;}

    public String getMax() {
        return max;
    }

    public void setMax(String max) {
        this.max = max;
    }

    public List<Integer> getNoList() {
        return noList;
    }

    public void setNoList(List<Integer> noList) {
        this.noList = noList;
    }
}