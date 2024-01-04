package com.fresh.chat.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Memberinfo implements Serializable {
    private static final long serialVersionUID = 64130862947928234L;
    private Integer mno;
    private String nickName;
    private String realName;
    private String pwd;
    private String tel;
    private String email;
    private String photo;
    private String regDate;
    private Integer staus;
}
