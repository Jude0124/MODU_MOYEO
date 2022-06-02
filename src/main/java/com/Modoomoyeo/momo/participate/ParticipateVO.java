package com.Modoomoyeo.momo.participate;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table
public class ParticipateVO implements Serializable {

    @Id
    @Column
    private int no;  //고유댓글번호(PK)

    @Id
    @Column
    private String nickname; // 닉네임

    @Builder
    public ParticipateVO(int no, String nickname) {
        this.no = no;
        this.nickname = nickname;
    }
}
