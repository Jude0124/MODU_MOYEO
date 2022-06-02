package com.Modoomoyeo.momo.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class LoginDTO {
    @NotBlank
    private String id = "";
    @NotBlank
    private String password = "";
}
