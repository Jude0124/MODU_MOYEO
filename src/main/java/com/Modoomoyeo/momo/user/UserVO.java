package com.Modoomoyeo.momo.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table
public class UserVO {
    @Id
    @Column
    private String nickname;            //작성자

    @Column
    private String no;                  //글번호

    @Column
    private String title;               //내용

    @Column
    private String time;                //작성일 (시간)

    @Column
    private String region;              //지역

    @Builder
    public UserVO(String nickname, String no, String title, String time, String region) {
        this.nickname = nickname;
        this.no = no;
        this.title = title;
        this.time = time;
        this.region = region;
    }
}
