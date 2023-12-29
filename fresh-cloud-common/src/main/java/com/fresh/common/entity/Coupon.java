package com.fresh.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private Date start; //开始时间
    private Integer num;//卷的数量
    private Date end; //结束时间
    public Date getStart() {
        return start;
    }
    public void setStart(Date start) {
        DateFormat dateFormat=new SimpleDateFormat("yyyy MM dd HH:mm:ss");
        String format = dateFormat.format(start);
        Date date=new Date(format);
        this.start = date;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        DateFormat dateFormat=new SimpleDateFormat("yyyy MM dd HH:mm:ss");
        String format = dateFormat.format(end);
        Date date=new Date(format);
        this.end = date;
    }

}
