package com.fresh.common.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: fresh-cloud
 * @description:

 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coupon implements Serializable {
    private static final long serialVersionUID =1l;
    private Long id;
    private String title;
    private String img;
    private String  money;
    private String desc;
    private String limit; //使用限制

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date start; //开始时间
    private Integer num;//卷的数量
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date end; //结束时间
    private Integer total;//总数


}
