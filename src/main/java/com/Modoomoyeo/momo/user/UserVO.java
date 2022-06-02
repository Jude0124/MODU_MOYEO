package com.Modoomoyeo.momo.user;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "user")
public class UserVO {
    @Column
    private String id;

    @Id
    @Column
    private String nickname;

    @Column
    private String email;

    @Column
    private String password;

    @Column
    private String region;
}
