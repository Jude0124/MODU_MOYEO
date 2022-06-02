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
@Table(name = "user")
public class UserVO {
    @Id
    @Column
    private String nickname; // 닉네임(=작성자)

    @Column
    private String id; // id

    @Column
    private String email; //이메일

    @Column
    private String password; //비밀번호

    @Column
    private String region; // 지역

    @Builder
    public UserVO(String nickname, String id, String email, String password, String region) {
        this.nickname = nickname;
        this.id = id;
        this.email = email;
        this.password = password;
        this.region = region;
    }
}
