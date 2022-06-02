package com.Modoomoyeo.momo.participate;


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
public class ParticipateVO {
    @Id
    @Column
    private String no;  //고유댓글번호(PK)

    @Id
    @Column
    private int nickname; // 글번호

    @Builder
    public ParticipateVO(String no, int nickname) {
        this.no = no;
        this.nickname = nickname;
    }
}
