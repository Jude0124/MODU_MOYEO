package com.Modoomoyeo.momo.admin;

import java.util.List;


public class adminUserVO {

    private String id;
    private String nickname;
    private String email;
    private String password;
    private String region;
    private List<String> nicknameList;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public List<String> getNicknameList() {
        return nicknameList;
    }

    public void setNicknameList(List<String> nicknameList) {
        this.nicknameList = nicknameList;
    }
}
