package com.Modoomoyeo.momo.comment;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "comment")
public class CommentVO {
    @Id
    @Column
    private int comment_no;  //고유댓글번호(PK)

    @Column
    private int no; // 글번호

    @Column
    private String nickname; // 닉네임

    @Column
    private String comment; // 댓글

    @Column
    private String time; // 시간

    @Builder
    public CommentVO(int comment_no, int no, String nickname, String comment, String time) {
        this.comment_no = comment_no;
        this.no = no;
        this.nickname = nickname;
        this.comment = comment;
        this.time = time;
    }

}
