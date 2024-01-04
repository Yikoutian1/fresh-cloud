package com.fresh.chat.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Record implements Serializable {
    /**
     * 发送者Id
     */
    private Integer id;
    /**
     * 发送者名
     */
    private String name;
    /**
     * 接收者名
     */
    private String receive;
    /**
     * 发送给谁
     */
    private Integer objId;
    /**
     * 消息内容
     */
    private String text;

    private Date sendTime;
}
