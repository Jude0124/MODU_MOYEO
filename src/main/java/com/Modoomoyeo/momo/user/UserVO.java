package com.Modoomoyeo.momo.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "user")
public class UserVO {
    @Id
    @Column
    @NotBlank(message = "닉네임을 설정해주세요")
    private String nickname; // 닉네임(=작성자)

    @Column
    @NotBlank(message = "아이디는 필수 입력값입니다.")
    private String id; // id

    @Column
    @NotBlank(message = "이메일은 필수 입력값입니다.")
    private String email; //이메일

    @Column
    @NotBlank(message = "비밀번호는 필수 입력값입니다.")
    private String password; //비밀번호

    @Column
    @NotBlank(message = "지역을 선택해주세요")
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
