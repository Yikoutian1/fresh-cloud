package com.fresh.chat.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sys_User implements Serializable {
    private Long userId;
    private String userName;
}
